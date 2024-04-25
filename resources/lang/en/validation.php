<?php

return [

   'accepted' => 'Атрибут :має бути прийнятий.',
 'active_url' => 'Атрибут :не є дійсною URL-адресою.',
 'after' => 'Атрибут :має бути датою після :date.',
 'alpha' => 'Атрибут :може містити лише літери.',
 'alpha_dash' => 'Атрибут :може містити лише літери, цифри та тире.',
 "ascii_only" => "Атрибут :може містити лише літери, цифри та тире.",
 'alpha_num' => "Атрибут :може містити лише літери та цифри.", "alpha_num" => "Атрибут :може містити лише літери та цифри.",
 'array' => 'Атрибут :має бути масивом.', 'array' => 'Атрибут :має бути масивом.',
 'before' => 'Атрибут :має бути датою перед :date.',
 'between' => [
 'numeric' => 'Атрибут :має бути між :min та :max.',
 'file' => 'Атрибут :має бути в межах від :min до :max кілобайт.', 'string' => 'Атрибут :має бути в межах від :min до :max.',
 'string' => 'Атрибут :повинен містити від :min до :max символів.', 'string' => 'Атрибут :повинен містити від :min до :max символів.',
 'array' => 'Атрибут :повинен мати від :min до :max елементів.',
    ],
    'boolean'              => 'Поле :attribute повинно мати значення true або false.',
    'confirmed'            => 'Підтвердження атрибуту :не збігається.',
    'date'                 => 'Атрибут :не є дійсною датою.',
    'date_format'          => 'Атрибут :не відповідає формату :format.',
    'different'            => 'Атрибут :attribute і :other повинні відрізнятися.',
    'digits'               => 'Атрибут :повинен мати значення :цифри цифри цифри.',
    'digits_between'       => 'Атрибут :має бути між цифрами :min та :max.',
    'dimensions'           => 'Атрибут :має невірні розміри зображення.',
    'distinct'             => 'Поле :attribute має повторюване значення.',
    'email'                => 'Атрибут :має бути дійсною адресою електронної пошти.',
    'exists'               => 'The selected :attribute is invalid.',
    'file'                 => 'Атрибут :повинен бути файлом.',
    'filled'               => 'Поле :attribute є обов"язковим.',
    'image'                => 'Атрибут :має бути зображенням.',
    'in'                   => 'Вибраний атрибут :є недійсним.',
    'in_array'             => 'Поле :attribute не існує в :other.',
    'integer'              => 'Атрибут :має бути цілим числом.',
    'ip'                   => 'Атрибут :повинен бути дійсною IP-адресою.',
    'json'                 => 'Атрибут :повинен бути коректним JSON-рядком.',
    'max'                  => [
        'numeric' => 'The :attribute may not be greater than :max.',
        'file'    => 'The :attribute may not be greater than :max kilobytes.',
        'string'  => 'The :attribute may not be greater than :max characters.',
        'array'   => 'The :attribute may not have more than :max items.',
    ],
    'mimes'                => 'The :attribute must be a file of type: :values.',
    'min'                  => [
        'numeric' => 'The :attribute must be at least :min.',
        'file'    => 'The :attribute must be at least :min kilobytes.',
        'string'  => 'The :attribute must be at least :min characters.',
        'array'   => 'The :attribute must have at least :min items.',
    ],
    'not_in'               => 'The selected :attribute is invalid.',
    'numeric'              => 'The :attribute must be a number.',
    'present'              => 'The :attribute field must be present.',
    'regex'                => 'The :attribute format is invalid.',
    'required'             => 'The :attribute field is required.',
    'required_if'          => 'The :attribute field is required when :other is :value.',
    'required_unless'      => 'The :attribute field is required unless :other is in :values.',
    'required_with'        => 'The :attribute field is required when :values is present.',
    'required_with_all'    => 'The :attribute field is required when :values is present.',
    'required_without'     => 'The :attribute field is required when :values is not present.',
    'required_without_all' => 'The :attribute field is required when none of :values are present.',
    'same'                 => 'The :attribute and :other must match.',
    'size'                 => [
        'numeric' => 'The :attribute must be :size.',
        'file'    => 'The :attribute must be :size kilobytes.',
        'string'  => 'The :attribute must be :size characters.',
        'array'   => 'The :attribute must contain :size items.',
    ],
    'string'               => 'The :attribute must be a string.',
    'timezone'             => 'The :attribute must be a valid zone.',
    'unique'               => 'The :attribute has already been taken.',
    'url'                  => 'The :attribute format is invalid.',
    "letters"              => "The username must contain at least one letter or number",
    "account_not_confirmed" => "Your account is not confirmed, please check your email",
	"user_suspended"        => "Your account has been suspended, please contact us if an error",


    'custom' => [
        'attribute-name' => [
            'rule-name' => 'custom-message',
        ],
    ],


    'attributes' => [
      'agree_gdpr' => 'box I agree with the processing of personal data',
    ],

];
