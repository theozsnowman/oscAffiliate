DROP TABLE IF EXISTS affiliate_affiliate;
CREATE TABLE IF NOT EXISTS `affiliate_affiliate` (
  `affiliate_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_gender` char(1) NOT NULL DEFAULT '',
  `affiliate_firstname` varchar(32) NOT NULL DEFAULT '',
  `affiliate_lastname` varchar(32) NOT NULL DEFAULT '',
  `affiliate_dob` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `affiliate_email_address` varchar(96) NOT NULL DEFAULT '',
  `affiliate_telephone` varchar(32) NOT NULL DEFAULT '',
  `affiliate_fax` varchar(32) NOT NULL DEFAULT '',
  `affiliate_password` varchar(40) NOT NULL DEFAULT '',
  `affiliate_homepage` varchar(96) NOT NULL DEFAULT '',
  `affiliate_street_address` varchar(64) NOT NULL DEFAULT '',
  `affiliate_suburb` varchar(64) NOT NULL DEFAULT '',
  `affiliate_city` varchar(32) NOT NULL DEFAULT '',
  `affiliate_postcode` varchar(10) NOT NULL DEFAULT '',
  `affiliate_state` varchar(32) NOT NULL DEFAULT '',
  `affiliate_country_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_zone_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_agb` tinyint(4) NOT NULL DEFAULT '0',
  `affiliate_company` varchar(60) NOT NULL DEFAULT '',
  `affiliate_company_taxid` varchar(64) NOT NULL DEFAULT '',
  `affiliate_commission_percent` decimal(4,2) NOT NULL DEFAULT '0.00',
  `affiliate_payment_check` varchar(100) NOT NULL DEFAULT '',
  `affiliate_payment_paypal` varchar(64) NOT NULL DEFAULT '',
  `affiliate_payment_bank_name` varchar(64) NOT NULL DEFAULT '',
  `affiliate_payment_bank_branch_number` varchar(64) NOT NULL DEFAULT '',
  `affiliate_payment_bank_swift_code` varchar(64) NOT NULL DEFAULT '',
  `affiliate_payment_bank_account_name` varchar(64) NOT NULL DEFAULT '',
  `affiliate_payment_bank_account_number` varchar(64) NOT NULL DEFAULT '',
  `affiliate_date_of_last_logon` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `affiliate_number_of_logons` int(11) NOT NULL DEFAULT '0',
  `affiliate_date_account_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `affiliate_date_account_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `affiliate_lft` int(11) NOT NULL,
  `affiliate_rgt` int(11) NOT NULL,
  `affiliate_root` int(11) NOT NULL,
  `affiliate_newsletter` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`affiliate_id`)
) 
COLLATE='utf8_unicode_ci';

DROP TABLE IF EXISTS affiliate_banners;
CREATE TABLE IF NOT EXISTS `affiliate_banners` (
  `affiliate_banners_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_banners_title` varchar(64)  NOT NULL DEFAULT '',
  `affiliate_products_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_category_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_banners_image` varchar(64)  NOT NULL DEFAULT '',
  `affiliate_date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `affiliate_date_status_change` datetime DEFAULT NULL,
  `affiliate_status` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`affiliate_banners_id`)
) 
COLLATE='utf8_unicode_ci';


	
DROP TABLE IF EXISTS affiliate_banners_history;
CREATE TABLE IF NOT EXISTS `affiliate_banners_history` (
  `affiliate_banners_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_banners_products_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_banners_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_banners_affiliate_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_banners_shown` int(11) NOT NULL DEFAULT '0',
  `affiliate_banners_clicks` tinyint(4) NOT NULL DEFAULT '0',
  `affiliate_banners_history_date` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`affiliate_banners_history_id`,`affiliate_banners_products_id`)
) 
COLLATE='utf8_unicode_ci';


DROP TABLE IF EXISTS affiliate_clickthroughs;
CREATE TABLE IF NOT EXISTS `affiliate_clickthroughs` (
  `affiliate_clickthrough_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_clientdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `affiliate_clientbrowser` varchar(200),
  `affiliate_clientip` varchar(50),
  `affiliate_clientreferer` varchar(200),
  `affiliate_products_id` int(11) DEFAULT '0',
  `affiliate_banner_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`affiliate_clickthrough_id`),
  KEY `refid` (`affiliate_id`)
)
COLLATE='utf8_unicode_ci';

DROP TABLE IF EXISTS affiliate_news;
CREATE TABLE IF NOT EXISTS `affiliate_news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `news_status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`news_id`)
) 
COLLATE='utf8_unicode_ci';
INSERT INTO `affiliate_news` (`news_id`, `date_added`, `news_status`) VALUES(1, now(), 1);

DROP TABLE IF EXISTS affiliate_newsletters;
CREATE TABLE IF NOT EXISTS `affiliate_newsletters` (
  `affiliate_newsletters_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255)  NOT NULL DEFAULT '',
  `content` mediumtext NOT NULL,
  `module` varchar(255)  NOT NULL DEFAULT '',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_sent` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `locked` int(1) DEFAULT '0',
  PRIMARY KEY (`affiliate_newsletters_id`)
)
COLLATE='utf8_unicode_ci';

DROP TABLE IF EXISTS affiliate_news_contents;
CREATE TABLE IF NOT EXISTS `affiliate_news_contents` (
  `affiliate_news_contents_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_news_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_news_languages_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_news_headlines` varchar(255)  NOT NULL DEFAULT '',
  `affiliate_news_contents` text  NOT NULL,
  PRIMARY KEY (`affiliate_news_contents_id`),
  KEY `affiliate_news_id` (`affiliate_news_id`),
  KEY `affiliate_news_languages_id` (`affiliate_news_languages_id`)
)
COLLATE='utf8_unicode_ci';

INSERT INTO `affiliate_news_contents` (`affiliate_news_contents_id`, `affiliate_news_id`, `affiliate_news_languages_id`, `affiliate_news_headlines`, `affiliate_news_contents`) VALUES
	(1, 1, 1, 'Welcome', 'Welcome to the news');
	
DROP TABLE IF EXISTS affiliate_payment;	
CREATE TABLE IF NOT EXISTS `affiliate_payment` (
  `affiliate_payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_payment` decimal(15,2) NOT NULL DEFAULT '0.00',
  `affiliate_payment_tax` decimal(15,2) NOT NULL DEFAULT '0.00',
  `affiliate_payment_total` decimal(15,2) NOT NULL DEFAULT '0.00',
  `affiliate_payment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `affiliate_payment_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `affiliate_payment_status` int(5) NOT NULL DEFAULT '0',
  `affiliate_firstname` varchar(32)  NOT NULL DEFAULT '',
  `affiliate_lastname` varchar(32)  NOT NULL DEFAULT '',
  `affiliate_street_address` varchar(64)  NOT NULL DEFAULT '',
  `affiliate_suburb` varchar(64)  NOT NULL DEFAULT '',
  `affiliate_city` varchar(32)  NOT NULL DEFAULT '',
  `affiliate_postcode` varchar(10)  NOT NULL DEFAULT '',
  `affiliate_country` varchar(32)  NOT NULL DEFAULT '0',
  `affiliate_company` varchar(60) NOT NULL DEFAULT '',
  `affiliate_state` varchar(32)  NOT NULL DEFAULT '0',
  `affiliate_address_format_id` int(5) NOT NULL DEFAULT '0',
  `affiliate_last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`affiliate_payment_id`)
)
COLLATE='utf8_unicode_ci';

DROP TABLE IF EXISTS affiliate_payment_status;
CREATE TABLE IF NOT EXISTS `affiliate_payment_status` (
  `affiliate_payment_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_language_id` int(11) NOT NULL DEFAULT '1',
  `affiliate_payment_status_name` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`affiliate_payment_status_id`,`affiliate_language_id`),
  KEY `idx_affiliate_payment_status_name` (`affiliate_payment_status_name`)
)
COLLATE='utf8_unicode_ci';

INSERT INTO `affiliate_payment_status` (`affiliate_payment_status_id`, `affiliate_language_id`, `affiliate_payment_status_name`) VALUES
	(0, 1, 'Pending'),
	(1, 1, 'Paid');

INSERT INTO configuration_group VALUES (900, 'Affiliate Program', 'Options for the Affiliate Program', 50, 1);
INSERT INTO configuration VALUES ('','E-Mail Address', 'AFFILIATE_EMAIL_ADDRESS', 'Enter Email Address', 'The E Mail Address for the Affiliate Program', 900, 1, NULL, now(), NULL, NULL);
INSERT INTO configuration VALUES ('','Affiliate Pay Per Sale Payment % Rate', 'AFFILIATE_PERCENT', '10.0000', 'Percentage Rate for the Affiliate Program', 900, 2, NULL, now(), NULL, NULL);
INSERT INTO configuration VALUES ('','Payment Threshold', 'AFFILIATE_THRESHOLD', '50.00', 'Payment Threshold for paying affiliates', 900, 3, NULL, now(), NULL, NULL);
INSERT INTO configuration VALUES ('','Cookie Lifetime', 'AFFILIATE_COOKIE_LIFETIME', '7200', 'How long does the click count (seconds) if customer comes back', 900, 4, NULL, now(), NULL, NULL);
INSERT INTO configuration VALUES ('','Billing Time', 'AFFILIATE_BILLING_TIME', '30', 'Orders billed must be at least "30" days old.<br>This is needed if a order is refunded', 900, 5, NULL, now(), NULL, NULL);
INSERT INTO configuration VALUES ('','Order Min Status', 'AFFILIATE_PAYMENT_ORDER_MIN_STATUS', '3', 'The status an order must have at least, to be billed', 900, 6, NULL, now(), NULL, NULL);
INSERT INTO configuration VALUES ('','Pay Affiliates with check', 'AFFILIATE_USE_CHECK', 'true', 'Pay Affiliates with check', 900, 7, NULL, now(), NULL,'tep_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO configuration VALUES ('','Pay Affiliates with PayPal', 'AFFILIATE_USE_PAYPAL', 'true', 'Pay Affiliates with PayPal', 900, 8, NULL, now(), NULL,'tep_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO configuration VALUES ('','Pay Affiliates by Bank', 'AFFILIATE_USE_BANK', 'true', 'Pay Affiliates by Bank', 900, 9, NULL, now(), NULL,'tep_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO configuration VALUES ('','Individual Affiliate Percentage', 'AFFILATE_INDIVIDUAL_PERCENTAGE', 'true', 'Allow per Affiliate provision', 900, 10, NULL, now(), NULL,'tep_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO configuration VALUES ('','Use Affiliate-tier' , 'AFFILATE_USE_TIER', 'false', 'Multilevel Affiliate provisions', 900, 11, NULL, now(), NULL,'tep_cfg_select_option(array(\'true\', \'false\'), ');
INSERT INTO configuration VALUES ('','Number of Tierlevels', 'AFFILIATE_TIER_LEVELS', '0', 'Number of Tierlevels', 900, 12, NULL, now(), NULL, NULL);
INSERT INTO configuration VALUES ('','Percentage Rate for the Tierlevels', 'AFFILIATE_TIER_PERCENTAGE', '8.00;5.00;1.00', 'Percent Rates for the tierlevels<br>Example: 8.00;5.00;1.00', 900, 13, NULL, now(), NULL, NULL);
INSERT INTO configuration VALUES ('','Affiliate News', 'MAX_DISPLAY_AFFILIATE_NEWS', '3', 'Maximum number of items to display on the Affiliate News page', 900, 14,  NULL, now(), NULL, NULL);

	
DROP TABLE IF EXISTS affiliate_payment_status_history;
CREATE TABLE IF NOT EXISTS `affiliate_payment_status_history` (
  `affiliate_status_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_payment_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_new_value` int(5) NOT NULL DEFAULT '0',
  `affiliate_old_value` int(5) DEFAULT NULL,
  `affiliate_date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `affiliate_notified` int(1) DEFAULT '0',
  PRIMARY KEY (`affiliate_status_history_id`)
)
COLLATE='utf8_unicode_ci';

DROP TABLE IF EXISTS affiliate_sales;
CREATE TABLE IF NOT EXISTS `affiliate_sales` (
  `affiliate_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `affiliate_browser` varchar(100)  NOT NULL DEFAULT '',
  `affiliate_ipaddress` varchar(20)  NOT NULL DEFAULT '',
  `affiliate_orders_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_value` decimal(15,2) NOT NULL DEFAULT '0.00',
  `affiliate_payment` decimal(15,2) NOT NULL DEFAULT '0.00',
  `affiliate_clickthroughs_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_billing_status` int(5) NOT NULL DEFAULT '0',
  `affiliate_payment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `affiliate_payment_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_percent` decimal(4,2) NOT NULL DEFAULT '0.00',
  `affiliate_salesman` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`affiliate_orders_id`,`affiliate_id`)
) 
COLLATE='utf8_unicode_ci';