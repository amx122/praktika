-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 21 2024 г., 17:01
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `Praktika`
--

-- --------------------------------------------------------

--
-- Структура таблицы `admin_settings`
--

CREATE TABLE `admin_settings` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `welcome_text` varchar(200) NOT NULL,
  `welcome_subtitle` text NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `result_request` int UNSIGNED NOT NULL COMMENT 'The max number of shots per request',
  `status_page` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 Offline, 1 Online',
  `email_verification` enum('0','1') NOT NULL COMMENT '0 Off, 1 On',
  `email_no_reply` varchar(200) NOT NULL,
  `email_admin` varchar(200) NOT NULL,
  `captcha` enum('on','off') NOT NULL DEFAULT 'on',
  `file_size_allowed` int UNSIGNED NOT NULL COMMENT 'Size in Bytes',
  `google_analytics` text NOT NULL,
  `paypal_account` varchar(200) NOT NULL,
  `twitter` varchar(200) NOT NULL,
  `facebook` varchar(200) NOT NULL,
  `googleplus` varchar(200) NOT NULL,
  `instagram` varchar(200) NOT NULL,
  `google_adsense` text NOT NULL,
  `currency_symbol` char(10) NOT NULL,
  `currency_code` varchar(20) NOT NULL,
  `min_donation_amount` int UNSIGNED NOT NULL,
  `min_campaign_amount` int UNSIGNED NOT NULL,
  `max_campaign_amount` int UNSIGNED NOT NULL,
  `payment_gateway` enum('Paypal','Stripe') NOT NULL DEFAULT 'Paypal',
  `paypal_sandbox` enum('true','false') NOT NULL DEFAULT 'true',
  `min_width_height_image` varchar(100) NOT NULL,
  `fee_donation` int UNSIGNED NOT NULL,
  `auto_approve_campaigns` enum('0','1') NOT NULL DEFAULT '1',
  `stripe_secret_key` varchar(255) NOT NULL,
  `stripe_public_key` varchar(255) NOT NULL,
  `max_donation_amount` int UNSIGNED NOT NULL,
  `enable_paypal` enum('0','1') NOT NULL DEFAULT '0',
  `enable_stripe` enum('0','1') NOT NULL DEFAULT '0',
  `enable_bank_transfer` enum('0','1') NOT NULL DEFAULT '0',
  `bank_swift_code` varchar(250) NOT NULL,
  `account_number` varchar(250) NOT NULL,
  `branch_name` varchar(250) NOT NULL,
  `branch_address` varchar(250) NOT NULL,
  `account_name` varchar(250) NOT NULL,
  `iban` varchar(250) NOT NULL,
  `date_format` varchar(200) NOT NULL,
  `link_privacy` varchar(200) NOT NULL,
  `link_terms` varchar(200) NOT NULL,
  `currency_position` enum('left','right') NOT NULL DEFAULT 'left',
  `facebook_login` enum('on','off') NOT NULL DEFAULT 'off',
  `google_login` enum('on','off') NOT NULL DEFAULT 'off',
  `decimal_format` enum('comma','dot') NOT NULL DEFAULT 'dot',
  `registration_active` enum('on','off') NOT NULL DEFAULT 'on',
  `color_default` varchar(100) NOT NULL,
  `version` varchar(5) NOT NULL,
  `captcha_on_donations` enum('on','off') NOT NULL DEFAULT 'on',
  `status_pwa` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `admin_settings`
--

INSERT INTO `admin_settings` (`id`, `title`, `description`, `welcome_text`, `welcome_subtitle`, `keywords`, `result_request`, `status_page`, `email_verification`, `email_no_reply`, `email_admin`, `captcha`, `file_size_allowed`, `google_analytics`, `paypal_account`, `twitter`, `facebook`, `googleplus`, `instagram`, `google_adsense`, `currency_symbol`, `currency_code`, `min_donation_amount`, `min_campaign_amount`, `max_campaign_amount`, `payment_gateway`, `paypal_sandbox`, `min_width_height_image`, `fee_donation`, `auto_approve_campaigns`, `stripe_secret_key`, `stripe_public_key`, `max_donation_amount`, `enable_paypal`, `enable_stripe`, `enable_bank_transfer`, `bank_swift_code`, `account_number`, `branch_name`, `branch_address`, `account_name`, `iban`, `date_format`, `link_privacy`, `link_terms`, `currency_position`, `facebook_login`, `google_login`, `decimal_format`, `registration_active`, `color_default`, `version`, `captcha_on_donations`, `status_pwa`) VALUES
(1, 'Платформа сборів', 'Опис', 'Маленька допомога для великої справи!', 'Платформа для краудфандингу', 'Платформа для краудфандингу', 8, '1', '1', 'dustfip@gmail.com', 'dustfip@gmail.com', 'off', 2048, '', 'paypal@yousite.com', 'https://www.twitter.com/', 'https://www.facebook.com/', '', 'https://www.instagram.com/', '', '$', 'USD', 5, 100, 1000000, 'Paypal', 'true', '800x400', 5, '1', '', '', 10000, '0', '0', '0', '', '', '', '', '', '', 'M d, Y', 'https://yousite.com/p/privacy', 'https://yousite.com/p/terms-of-service', 'left', 'off', 'off', 'dot', 'on', '#f45302', '4.9', 'on', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `blogs`
--

CREATE TABLE `blogs` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `campaigns`
--

CREATE TABLE `campaigns` (
  `id` int NOT NULL,
  `small_image` varchar(255) NOT NULL,
  `large_image` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` mediumtext,
  `user_id` int UNSIGNED NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('active','pending') NOT NULL DEFAULT 'active',
  `token_id` varchar(255) NOT NULL,
  `goal` int UNSIGNED NOT NULL,
  `location` varchar(200) NOT NULL,
  `finalized` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0 No 1 Yes',
  `categories_id` int UNSIGNED NOT NULL,
  `featured` enum('0','1') NOT NULL DEFAULT '0',
  `deadline` varchar(200) NOT NULL DEFAULT '',
  `video` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `campaigns`
--

INSERT INTO `campaigns` (`id`, `small_image`, `large_image`, `title`, `description`, `user_id`, `date`, `status`, `token_id`, `goal`, `location`, `finalized`, `categories_id`, `featured`, `deadline`, `video`) VALUES
(1, '11713453113aryckw9xvbfpq83ckycj2sithq7ej5kwwja5juqb.jpg', '117134531138j0adyqd2yfxm4h3jiapri9fbvzxpin0osuo4nwt.jpg', 'testing', '//////////////////////////////////////////////////////////////////////////////////////', 1, '2024-04-18 12:11:55', 'active', 'S7RtsC8hMEhX6bIdrfnKoVGoFs3cRCmV7lc7P7FgYoWeR12ri1gNaX2XTP2uD8cSNpYJS8YrTxmxGg9zEUvyoEL04rpAnoSZvDTafzBHkF01ZRqTgHMeQFHY7L5IblFHIO7r86RAza1UxZLi3LCbB5Qk0b3oevBBi6gDeSit7lbm6cORKVkGKtKiEciEZrVjUkRLzEhN', 10000, 'Кременчуг', '0', 11, '0', '27-04-2024', 'https://youtube.com');

-- --------------------------------------------------------

--
-- Структура таблицы `campaigns_reported`
--

CREATE TABLE `campaigns_reported` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `campaigns_id` int UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE `categories` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `mode` enum('on','off') NOT NULL DEFAULT 'on',
  `image` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `countries`
--

CREATE TABLE `countries` (
  `id` int NOT NULL,
  `country_code` varchar(2) NOT NULL DEFAULT '',
  `country_name` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `countries`
--

INSERT INTO `countries` (`id`, `country_code`, `country_name`) VALUES
(1, 'US', 'United States'),
(2, 'CA', 'Canada'),
(3, 'AF', 'Afghanistan'),
(4, 'AL', 'Albania'),
(5, 'DZ', 'Algeria'),
(6, 'DS', 'American Samoa'),
(7, 'AD', 'Andorra'),
(8, 'AO', 'Angola'),
(9, 'AI', 'Anguilla'),
(10, 'AQ', 'Antarctica'),
(11, 'AG', 'Antigua and/or Barbuda'),
(12, 'AR', 'Argentina'),
(13, 'AM', 'Armenia'),
(14, 'AW', 'Aruba'),
(15, 'AU', 'Australia'),
(16, 'AT', 'Austria'),
(17, 'AZ', 'Azerbaijan'),
(18, 'BS', 'Bahamas'),
(19, 'BH', 'Bahrain'),
(20, 'BD', 'Bangladesh'),
(21, 'BB', 'Barbados'),
(22, 'BY', 'Belarus'),
(23, 'BE', 'Belgium'),
(24, 'BZ', 'Belize'),
(25, 'BJ', 'Benin'),
(26, 'BM', 'Bermuda'),
(27, 'BT', 'Bhutan'),
(28, 'BO', 'Bolivia'),
(29, 'BA', 'Bosnia and Herzegovina'),
(30, 'BW', 'Botswana'),
(31, 'BV', 'Bouvet Island'),
(32, 'BR', 'Brazil'),
(33, 'IO', 'British lndian Ocean Territory'),
(34, 'BN', 'Brunei Darussalam'),
(35, 'BG', 'Bulgaria'),
(36, 'BF', 'Burkina Faso'),
(37, 'BI', 'Burundi'),
(38, 'KH', 'Cambodia'),
(39, 'CM', 'Cameroon'),
(40, 'CV', 'Cape Verde'),
(41, 'KY', 'Cayman Islands'),
(42, 'CF', 'Central African Republic'),
(43, 'TD', 'Chad'),
(44, 'CL', 'Chile'),
(45, 'CN', 'China'),
(46, 'CX', 'Christmas Island'),
(47, 'CC', 'Cocos (Keeling) Islands'),
(48, 'CO', 'Colombia'),
(49, 'KM', 'Comoros'),
(50, 'CG', 'Congo'),
(51, 'CK', 'Cook Islands'),
(52, 'CR', 'Costa Rica'),
(53, 'HR', 'Croatia (Hrvatska)'),
(54, 'CU', 'Cuba'),
(55, 'CY', 'Cyprus'),
(56, 'CZ', 'Czech Republic'),
(57, 'DK', 'Denmark'),
(58, 'DJ', 'Djibouti'),
(59, 'DM', 'Dominica'),
(60, 'DO', 'Dominican Republic'),
(61, 'TP', 'East Timor'),
(62, 'EC', 'Ecuador'),
(63, 'EG', 'Egypt'),
(64, 'SV', 'El Salvador'),
(65, 'GQ', 'Equatorial Guinea'),
(66, 'ER', 'Eritrea'),
(67, 'EE', 'Estonia'),
(68, 'ET', 'Ethiopia'),
(69, 'FK', 'Falkland Islands (Malvinas)'),
(70, 'FO', 'Faroe Islands'),
(71, 'FJ', 'Fiji'),
(72, 'FI', 'Finland'),
(73, 'FR', 'France'),
(74, 'FX', 'France, Metropolitan'),
(75, 'GF', 'French Guiana'),
(76, 'PF', 'French Polynesia'),
(77, 'TF', 'French Southern Territories'),
(78, 'GA', 'Gabon'),
(79, 'GM', 'Gambia'),
(80, 'GE', 'Georgia'),
(81, 'DE', 'Germany'),
(82, 'GH', 'Ghana'),
(83, 'GI', 'Gibraltar'),
(84, 'GR', 'Greece'),
(85, 'GL', 'Greenland'),
(86, 'GD', 'Grenada'),
(87, 'GP', 'Guadeloupe'),
(88, 'GU', 'Guam'),
(89, 'GT', 'Guatemala'),
(90, 'GN', 'Guinea'),
(91, 'GW', 'Guinea-Bissau'),
(92, 'GY', 'Guyana'),
(93, 'HT', 'Haiti'),
(94, 'HM', 'Heard and Mc Donald Islands'),
(95, 'HN', 'Honduras'),
(96, 'HK', 'Hong Kong'),
(97, 'HU', 'Hungary'),
(98, 'IS', 'Iceland'),
(99, 'IN', 'India'),
(100, 'ID', 'Indonesia'),
(101, 'IR', 'Iran (Islamic Republic of)'),
(102, 'IQ', 'Iraq'),
(103, 'IE', 'Ireland'),
(104, 'IL', 'Israel'),
(105, 'IT', 'Italy'),
(106, 'CI', 'Ivory Coast'),
(107, 'JM', 'Jamaica'),
(108, 'JP', 'Japan'),
(109, 'JO', 'Jordan'),
(110, 'KZ', 'Kazakhstan'),
(111, 'KE', 'Kenya'),
(112, 'KI', 'Kiribati'),
(113, 'KP', 'Korea, Democratic People\'s Republic of'),
(114, 'KR', 'Korea, Republic of'),
(115, 'XK', 'Kosovo'),
(116, 'KW', 'Kuwait'),
(117, 'KG', 'Kyrgyzstan'),
(118, 'LA', 'Lao People\'s Democratic Republic'),
(119, 'LV', 'Latvia'),
(120, 'LB', 'Lebanon'),
(121, 'LS', 'Lesotho'),
(122, 'LR', 'Liberia'),
(123, 'LY', 'Libyan Arab Jamahiriya'),
(124, 'LI', 'Liechtenstein'),
(125, 'LT', 'Lithuania'),
(126, 'LU', 'Luxembourg'),
(127, 'MO', 'Macau'),
(128, 'MK', 'Macedonia'),
(129, 'MG', 'Madagascar'),
(130, 'MW', 'Malawi'),
(131, 'MY', 'Malaysia'),
(132, 'MV', 'Maldives'),
(133, 'ML', 'Mali'),
(134, 'MT', 'Malta'),
(135, 'MH', 'Marshall Islands'),
(136, 'MQ', 'Martinique'),
(137, 'MR', 'Mauritania'),
(138, 'MU', 'Mauritius'),
(139, 'TY', 'Mayotte'),
(140, 'MX', 'Mexico'),
(141, 'FM', 'Micronesia, Federated States of'),
(142, 'MD', 'Moldova, Republic of'),
(143, 'MC', 'Monaco'),
(144, 'MN', 'Mongolia'),
(145, 'ME', 'Montenegro'),
(146, 'MS', 'Montserrat'),
(147, 'MA', 'Morocco'),
(148, 'MZ', 'Mozambique'),
(149, 'MM', 'Myanmar'),
(150, 'NA', 'Namibia'),
(151, 'NR', 'Nauru'),
(152, 'NP', 'Nepal'),
(153, 'NL', 'Netherlands'),
(154, 'AN', 'Netherlands Antilles'),
(155, 'NC', 'New Caledonia'),
(156, 'NZ', 'New Zealand'),
(157, 'NI', 'Nicaragua'),
(158, 'NE', 'Niger'),
(159, 'NG', 'Nigeria'),
(160, 'NU', 'Niue'),
(161, 'NF', 'Norfork Island'),
(162, 'MP', 'Northern Mariana Islands'),
(163, 'NO', 'Norway'),
(164, 'OM', 'Oman'),
(165, 'PK', 'Pakistan'),
(166, 'PW', 'Palau'),
(167, 'PA', 'Panama'),
(168, 'PG', 'Papua New Guinea'),
(169, 'PY', 'Paraguay'),
(170, 'PE', 'Peru'),
(171, 'PH', 'Philippines'),
(172, 'PN', 'Pitcairn'),
(173, 'PL', 'Poland'),
(174, 'PT', 'Portugal'),
(175, 'PR', 'Puerto Rico'),
(176, 'QA', 'Qatar'),
(177, 'RE', 'Reunion'),
(178, 'RO', 'Romania'),
(179, 'RU', 'Russian Federation'),
(180, 'RW', 'Rwanda'),
(181, 'KN', 'Saint Kitts and Nevis'),
(182, 'LC', 'Saint Lucia'),
(183, 'VC', 'Saint Vincent and the Grenadines'),
(184, 'WS', 'Samoa'),
(185, 'SM', 'San Marino'),
(186, 'ST', 'Sao Tome and Principe'),
(187, 'SA', 'Saudi Arabia'),
(188, 'SN', 'Senegal'),
(189, 'RS', 'Serbia'),
(190, 'SC', 'Seychelles'),
(191, 'SL', 'Sierra Leone'),
(192, 'SG', 'Singapore'),
(193, 'SK', 'Slovakia'),
(194, 'SI', 'Slovenia'),
(195, 'SB', 'Solomon Islands'),
(196, 'SO', 'Somalia'),
(197, 'ZA', 'South Africa'),
(198, 'GS', 'South Georgia South Sandwich Islands'),
(199, 'ES', 'Spain'),
(200, 'LK', 'Sri Lanka'),
(201, 'SH', 'St. Helena'),
(202, 'PM', 'St. Pierre and Miquelon'),
(203, 'SD', 'Sudan'),
(204, 'SR', 'Suriname'),
(205, 'SJ', 'Svalbarn and Jan Mayen Islands'),
(206, 'SZ', 'Swaziland'),
(207, 'SE', 'Sweden'),
(208, 'CH', 'Switzerland'),
(209, 'SY', 'Syrian Arab Republic'),
(210, 'TW', 'Taiwan'),
(211, 'TJ', 'Tajikistan'),
(212, 'TZ', 'Tanzania, United Republic of'),
(213, 'TH', 'Thailand'),
(214, 'TG', 'Togo'),
(215, 'TK', 'Tokelau'),
(216, 'TO', 'Tonga'),
(217, 'TT', 'Trinidad and Tobago'),
(218, 'TN', 'Tunisia'),
(219, 'TR', 'Turkey'),
(220, 'TM', 'Turkmenistan'),
(221, 'TC', 'Turks and Caicos Islands'),
(222, 'TV', 'Tuvalu'),
(223, 'UG', 'Uganda'),
(224, 'UA', 'Ukraine'),
(225, 'AE', 'United Arab Emirates'),
(226, 'GB', 'United Kingdom'),
(227, 'UM', 'United States minor outlying islands'),
(228, 'UY', 'Uruguay'),
(229, 'UZ', 'Uzbekistan'),
(230, 'VU', 'Vanuatu'),
(231, 'VA', 'Vatican City State'),
(232, 'VE', 'Venezuela'),
(233, 'VN', 'Vietnam'),
(234, 'VG', 'Virgin Islands (British)'),
(235, 'VI', 'Virgin Islands (U.S.)'),
(236, 'WF', 'Wallis and Futuna Islands'),
(237, 'EH', 'Western Sahara'),
(238, 'YE', 'Yemen'),
(239, 'YU', 'Yugoslavia'),
(240, 'ZR', 'Zaire'),
(241, 'ZM', 'Zambia'),
(242, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Структура таблицы `donations`
--

CREATE TABLE `donations` (
  `id` int UNSIGNED NOT NULL,
  `campaigns_id` int UNSIGNED NOT NULL,
  `txn_id` varchar(255) NOT NULL,
  `fullname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `country` varchar(100) NOT NULL,
  `postal_code` varchar(100) NOT NULL,
  `donation` int UNSIGNED NOT NULL,
  `payment_gateway` varchar(100) NOT NULL,
  `oauth_uid` varchar(200) NOT NULL,
  `comment` varchar(200) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `anonymous` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0 No, 1 Yes',
  `rewards_id` int UNSIGNED NOT NULL,
  `bank_swift_code` varchar(250) NOT NULL,
  `account_number` varchar(250) NOT NULL,
  `branch_name` varchar(250) NOT NULL,
  `branch_address` varchar(250) NOT NULL,
  `account_name` varchar(250) NOT NULL,
  `iban` varchar(250) NOT NULL,
  `approved` enum('0','1') NOT NULL DEFAULT '1',
  `bank_transfer` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `gallery`
--

CREATE TABLE `gallery` (
  `id` int UNSIGNED NOT NULL,
  `image` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `languages`
--

CREATE TABLE `languages` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abbreviation` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `languages`
--

INSERT INTO `languages` (`id`, `name`, `abbreviation`) VALUES
(1, 'Українська', 'en');

-- --------------------------------------------------------

--
-- Структура таблицы `likes`
--

CREATE TABLE `likes` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int UNSIGNED NOT NULL,
  `campaigns_id` int UNSIGNED NOT NULL,
  `status` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL DEFAULT '1',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

CREATE TABLE `pages` (
  `id` int UNSIGNED NOT NULL,
  `title` varchar(150) NOT NULL,
  `content` text NOT NULL,
  `slug` varchar(100) NOT NULL,
  `show_navbar` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0 No, 1 Yes',
  `lang` char(10) NOT NULL DEFAULT 'en'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `pages`
--

INSERT INTO `pages` (`id`, `title`, `content`, `slug`, `show_navbar`, `lang`) VALUES
(2, 'Умови', 'Текст', 'terms-of-service', '0', 'en'),
(3, 'Конфіденційність', 'Текст', 'privacy', '0', 'en'),
(5, 'Про нас', 'Текст', 'about', '0', 'en'),
(7, 'Підтримка', 'текст', 'support', '0', 'en'),
(8, 'Як це працює', '&quot;Платформа для збору коштів на збройні сили&quot; дозволяє користувачам зібрати фінансові ресурси для підтримки різних аспектів військової справи. Процес роботи цієї платформи може бути описаний наступним чином:<br />\r\n<br />\r\n1. **Створення Проекту**: Користувачі можуть створювати проекти, що описують конкретні потреби або ініціативи військових частин, військових розвідок, ветеранських організацій тощо. Ці проекти можуть включати різноманітні завдання, такі як закупівля необхідного обладнання, забезпечення медичних послуг для поранених воїнів, підтримка ветеранів тощо.<br />\r\n<br />\r\n2. **Публікація Проектів**: Після створення проекту його можна опублікувати на платформі, де будь-який користувач може ознайомитися з описом та метою проекту.<br />\r\n<br />\r\n3. **Збір Коштів**: Люди, які підтримують військову справу, мають можливість здійснювати пожертвування на підтримку конкретних проектів. Це може бути зроблено через різні методи оплати, такі як кредитні картки, електронні платежі, криптовалюти тощо.<br />\r\n<br />\r\n4. **Моніторинг та Звітність**: Адміністратори платформи можуть забезпечувати моніторинг фінансових потоків, перевіряти використання зібраних коштів та забезпечувати звітність щодо витрат. Крім того, організатори проектів можуть регулярно оновлювати статус і відомості про реалізацію проектів для своїх пожертвувачів.<br />\r\n<br />\r\n5. **Заохочення та Залучення Спільноти**: Платформа може заохочувати індивідів, компанії, фонди та інші організації до активної участі в зборі коштів шляхом надання різноманітних стимулів, відзнак та публічних визнань.<br />\r\n<br />\r\n6. **Підтримка та Обслуговування Користувачів**: Платформа може надавати технічну підтримку та консультації користувачам, які бажають створити або підтримати проекти. Крім того, вона може забезпечувати інструменти для спілкування та обміну думками серед спільноти.<br />\r\n<br />\r\nТаким чином, платформа для збору коштів на збройні сили є важливим інструментом для підтримки оборонної справи та воєнної діяльності, забезпечуючи ефективний механізм для залучення фінансових ресурсів та сприяючи реалізації різноманітних проектів на користь військової галузі.', 'how-it-works', '1', 'en');

-- --------------------------------------------------------

--
-- Структура таблицы `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int UNSIGNED NOT NULL,
  `token` varchar(150) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` enum('1','0') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `sandbox` enum('true','false') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'true',
  `fee` decimal(3,1) NOT NULL,
  `fee_cents` decimal(2,2) NOT NULL,
  `email` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `key_secret` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bank_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `paypal_form` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `name`, `type`, `enabled`, `sandbox`, `fee`, `fee_cents`, `email`, `token`, `key`, `key_secret`, `bank_info`, `paypal_form`) VALUES
(1, 'PayPal', 'normal', '0', 'true', '5.4', '0.30', 'paypal@yoursite.com', '12bGGfD9bHevK3eJN06CdDvFSTXsTrTG44yGdAONeN1R37jqnLY1PuNF0mJRoFnsEygyf28yePSCA1eR0alQk4BX89kGG9Rlha2D2KX55TpDFNR5o774OshrkHSZLOFo2fAhHzcWKnwsYDFKgwuaRg', '', '', '', 'normal'),
(2, 'Stripe', 'card', '0', 'true', '2.9', '0.30', '', 'asfQSGRvYzS1P0X745krAAyHeU7ZbTpHbYKnxI2abQsBUi48EpeAu5lFAU2iBmsUWO5tpgAn9zzussI4Cce5ZcANIAmfBz0bNR9g3UfR4cserhkJwZwPsETiXiZuCixXVDHhCItuXTPXXSA6KITEoT', '', '', '', ''),
(3, 'Bank Transfer', 'bank', '0', 'true', '0.0', '0.00', '', 'zzzdH5811lZSjioHrg3zLD69DAAMvPLiwdzTouAdc7HbtaqgujPEZjH3i7RGeRtFKrY2baT7rXd6CaBtsRpo4XtgHvqCyCWiW5BlCrg1uSMCOSdi1tzPjCPx8px280YEyLvNtiRzWHJJk8WRegfTms', '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `reserved`
--

CREATE TABLE `reserved` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `reserved`
--

INSERT INTO `reserved` (`id`, `name`) VALUES
(14, 'account'),
(31, 'api'),
(2, 'app'),
(46, 'blog'),
(30, 'bootstrap'),
(37, 'campaigns'),
(34, 'categories'),
(36, 'collections'),
(29, 'comment'),
(42, 'config'),
(25, 'contact'),
(41, 'database'),
(35, 'featured'),
(32, 'freebies'),
(45, 'gallery'),
(9, 'goods'),
(1, 'gostock1'),
(11, 'jobs'),
(21, 'join'),
(16, 'latest'),
(20, 'login'),
(33, 'logout'),
(27, 'members'),
(13, 'messages'),
(19, 'notifications'),
(15, 'popular'),
(6, 'porn'),
(26, 'programs'),
(12, 'projects'),
(3, 'public'),
(23, 'register'),
(40, 'resources'),
(39, 'routes'),
(17, 'search'),
(7, 'sex'),
(44, 'storage'),
(8, 'tags'),
(38, 'tests'),
(24, 'upgrade'),
(28, 'upload'),
(4, 'vendor'),
(5, 'xxx');

-- --------------------------------------------------------

--
-- Структура таблицы `rewards`
--

CREATE TABLE `rewards` (
  `id` int UNSIGNED NOT NULL,
  `campaigns_id` int UNSIGNED NOT NULL,
  `title` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `amount` int UNSIGNED NOT NULL,
  `description` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `quantity` int UNSIGNED NOT NULL,
  `delivery` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `updates`
--

CREATE TABLE `updates` (
  `id` int NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `campaigns_id` int UNSIGNED NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `token_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `countries_id` char(25) NOT NULL,
  `password` char(60) NOT NULL,
  `email` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `avatar` varchar(70) NOT NULL,
  `status` enum('pending','active','suspended','delete') NOT NULL DEFAULT 'active',
  `role` enum('normal','admin') NOT NULL DEFAULT 'normal',
  `remember_token` varchar(100) NOT NULL,
  `token` varchar(80) NOT NULL,
  `confirmation_code` varchar(125) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `paypal_account` varchar(200) NOT NULL,
  `payment_gateway` varchar(50) NOT NULL,
  `bank` text NOT NULL,
  `oauth_uid` varchar(200) NOT NULL,
  `oauth_provider` varchar(200) NOT NULL,
  `username` varchar(50) NOT NULL,
  `phone` int UNSIGNED NOT NULL,
  `street` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `countries_id`, `password`, `email`, `date`, `avatar`, `status`, `role`, `remember_token`, `token`, `confirmation_code`, `updated_at`, `created_at`, `paypal_account`, `payment_gateway`, `bank`, `oauth_uid`, `oauth_provider`, `username`, `phone`, `street`) VALUES
(1, 'Євгеній Хань', '224', '$2y$10$w/laxDgcmRoIfwcCpKOtzOZrfXPGJE1iHjxf08wh2akHYQ9ZLgC7S', 'dustfip@gmail.com', '2021-03-14 10:19:16', '11713446307bzmanho4og5yog4.png', 'active', 'admin', 'JHAkFasaErgpwd51Bc27XXQfzYIY8ORDUzMh6FTRTuNd2snGSdB27IIWQL8x', 'Wy4VkAl2dxHb9WHoXjTowSGPXFPnEQHca6RBe2yeqqmRafs0hSbCEobhNkZZAbCDIru60ceLzAAOI3fj', '', '2024-04-18 10:18:27', '2016-09-09 15:34:42', '', '', '', '', '', '', 0, '');

-- --------------------------------------------------------

--
-- Структура таблицы `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` int UNSIGNED NOT NULL,
  `campaigns_id` int UNSIGNED NOT NULL,
  `status` enum('pending','paid') NOT NULL DEFAULT 'pending',
  `amount` varchar(50) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gateway` varchar(100) NOT NULL,
  `account` text NOT NULL,
  `date_paid` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `txn_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `admin_settings`
--
ALTER TABLE `admin_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `max_campaign_amount` (`max_campaign_amount`),
  ADD KEY `type` (`status_pwa`);

--
-- Индексы таблицы `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blogs_slug_index` (`slug`(191)),
  ADD KEY `blogs_tags_index` (`tags`(191));

--
-- Индексы таблицы `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token_id` (`token_id`),
  ADD KEY `author_id` (`user_id`,`status`,`token_id`),
  ADD KEY `image` (`small_image`),
  ADD KEY `goal` (`goal`),
  ADD KEY `categories_id` (`categories_id`);

--
-- Индексы таблицы `campaigns_reported`
--
ALTER TABLE `campaigns_reported`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slug` (`slug`);

--
-- Индексы таблицы `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `donations`
--
ALTER TABLE `donations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaigns_id` (`campaigns_id`);

--
-- Индексы таблицы `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_hash` (`token`),
  ADD KEY `email` (`email`);

--
-- Индексы таблицы `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `reserved`
--
ALTER TABLE `reserved`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`) USING BTREE;

--
-- Индексы таблицы `rewards`
--
ALTER TABLE `rewards`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `updates`
--
ALTER TABLE `updates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token_id` (`token_id`),
  ADD KEY `author_id` (`token_id`),
  ADD KEY `image` (`image`),
  ADD KEY `category_id` (`campaigns_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `username` (`status`),
  ADD KEY `role` (`role`);

--
-- Индексы таблицы `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaings_id` (`campaigns_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `admin_settings`
--
ALTER TABLE `admin_settings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `campaigns_reported`
--
ALTER TABLE `campaigns_reported`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=243;

--
-- AUTO_INCREMENT для таблицы `donations`
--
ALTER TABLE `donations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `reserved`
--
ALTER TABLE `reserved`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT для таблицы `rewards`
--
ALTER TABLE `rewards`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `updates`
--
ALTER TABLE `updates`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
