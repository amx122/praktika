<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use App\Models\AdminSettings;
use App\Models\Campaigns;
use App\Models\Donations;
use App\Models\User;
use App\Models\Rewards;
use Srmklive\PayPal\Services\PayPal as PayPalClient;
use App\Helper;
use Mail;
use Carbon\Carbon;
use App\Models\PaymentGateways;

class PayPalController extends Controller
{
  public function __construct(AdminSettings $settings, Request $request) 
  {
		$this->settings = $settings::first();
		$this->request = $request;
	}

    public function show() 
	{

	  if (! $this->request->expectsJson()) {
			abort(404);
	  }

      // Get Payment Gateway
      $payment = PaymentGateways::findOrFail($this->request->payment_gateway);

	  $urlSuccess = route('paypal.success');
	  $urlCancel  = url('paypal/donation/cancel', $this->request->campaign_id);

		try {
			// Init PayPal
			$provider = new PayPalClient();
			$token = $provider->getAccessToken();
			$provider->setAccessToken($token);
	  
			$order = $provider->createOrder([
				  "intent"=> "CAPTURE",
				  'application_context' =>
					  [
						  'return_url' => $urlSuccess,
						  'cancel_url' => $urlCancel,
						  'shipping_preference' => 'NO_SHIPPING'
					  ],
				  "purchase_units"=> [
					   [
						  "amount"=> [
							  "currency_code"=> $this->settings->currency_code,
							  "value"=> $this->request->amount,
							  'breakdown' => [
								'item_total' => [
								  "currency_code"=> $this->settings->currency_code,
								  "value"=> $this->request->amount
								],
							  ],
						  ],
						   'description' => __('misc.donation_for').' '.$this->request->campaign_title,
	  
						   'items' => [
							 [
							   'name' => __('misc.donation_for').' '.$this->request->campaign_title,
								'category' => 'DIGITAL_GOODS',
								  'quantity' => '1',
								  'unit_amount' => [
									"currency_code"=> $this->settings->currency_code,
									"value" => $this->request->amount
								  ],
							 ],
						  ],
	  
						  'custom_id' => http_build_query([
							  'id' => $this->request->campaign_id,
							  'fn' => $this->request->full_name,
							  'mail' => $this->request->email,
							  'cc' => $this->request->country,
							  'pc' => $this->request->postal_code,
							  'cm' => $this->request->comment,
							  'anyms' => $this->request->input('anonymous', '0'),
							  'pl' => $this->request->input('_pledge', 0)
						  ]),
					  ],
				  ],
			  ]);
	  
			  return response()->json([
						  'success' => true,
						  'url' => $order['links'][1]['href']
					  ]);
	  
			} catch (\Exception $e) {
	  
			  \Log::debug($e);
	  
			  return response()->json([
				'errors' => ['error' => $e->getMessage()]
			  ]);
			}
    }// Send PayPal

	public function verifyTransaction()
	{
		// Get Payment Data
		$payment = PaymentGateways::whereName('PayPal')->first();

		// Init PayPal
		$provider = new PayPalClient();
		$token = $provider->getAccessToken();
		$provider->setAccessToken($token);
   
		try {
		  // Get PaymentOrder using our transaction ID
		  $order  = $provider->capturePaymentOrder($this->request->token);
		  $txnId  = $order['purchase_units'][0]['payments']['captures'][0]['id'];
		  $amount = $order['purchase_units'][0]['payments']['captures'][0]['amount']['value'];
   
		  // Parse the custom data parameters
		  parse_str($order['purchase_units'][0]['payments']['captures'][0]['custom_id'] ?? null, $donation);

		  if ($order['status'] && $order['status'] === "COMPLETED") {
			if ($donation) {
				 // Check outh POST variable and insert in DB
				 $verifiedTxnId = Donations::where('txn_id', $txnId)->first();
			}

			if (! isset($verifiedTxnId)) {

			   $sql = new Donations();
		   	   $sql->campaigns_id = $donation['id'];
			   $sql->txn_id       = $txnId;
			   $sql->fullname     = $donation['fn'];
			   $sql->email        = $donation['mail'];
			   $sql->country      = $donation['cc'];
			   $sql->postal_code  = $donation['pc'];
			   $sql->donation     = $amount;
			   $sql->payment_gateway = 'PayPal';
			   $sql->comment      = $donation['cm'];
			   $sql->anonymous    = $donation['anyms'];
			   $sql->rewards_id   = $donation['pl'];
			   $sql->save();

			   // Send Email
			   $sender        = $this->settings->email_no_reply;
			   $titleSite     = $this->settings->title;
			   $_emailUser    = $donation['mail'];
			   $campaignID   = $donation['id'];
			   $fullNameUser = $donation['fn'];

				 $queryCampaing = Campaigns::find($donation['id']);
				 $campaignTitle = $queryCampaing->title;
				 $organizerName = $donation['fn'];
				 $organizerEmail = $donation['mail'];
				 $paymentGateway = 'PayPal';

				 try {
					Mail::send('emails.thanks-donor', array(
						'data' => $campaignID,
						'fullname' => $fullNameUser,
						'title_site' => $titleSite,
						'campaign_id' => $campaignID,
						'organizer_name' => $organizerName,
						'organizer_email' => $organizerEmail,
						'payment_gateway' => $paymentGateway,
					),
   
						function($message) use ( $sender, $fullNameUser, $titleSite, $_emailUser, $campaignTitle)
							{
									$message->from($sender, $titleSite)
										->to($_emailUser, $fullNameUser)
									->subject(__('misc.thanks_donation').' - '.$campaignTitle.' || '.$titleSite );
							});
				 } catch (\Exception $e) {
					\Log::info($e->getMessage());
				 }
				 
		     return redirect(url('paypal/donation/success', $donation['id']));
		  }// <--- Verified Txn ID
		}

	  } catch (\Exception $e) {
		\Log::debug($e);
		return redirect('/');
	  }
	}// end method verifyTransaction

}
