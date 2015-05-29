<?php
/*
  $Id: ,v 3.00 2015/05/29

  oscAffiliate, Affiliate Module for osCommerce
  http://www.snowtech.com.au

  Copyright (c) 2002 -2015 Snowtech Services

*/

define('NAVBAR_TITLE_1', 'Login');
define('NAVBAR_TITLE_2', 'Affiliate Password Forgotten');
define('HEADING_TITLE', 'I\'ve Forgotten My Affiliate Password!');
define('TEXT_NO_EMAIL_ADDRESS_FOUND', '<font color="#ff0000"><strong>NOTE:</strong></font> The E-Mail Address was not found in our records. Please try again.');
define('EMAIL_PASSWORD_REMINDER_SUBJECT', STORE_NAME . ' - New Affiliate Password');
define('EMAIL_PASSWORD_REMINDER_BODY', 'A new affiliate password was requested from ' . $REMOTE_ADDR . '.' . "\n\n" . 'Your new affiliate password to \'' . STORE_NAME . '\' is:' . "\n\n" . '   %s' . "\n\n");
define('TEXT_PASSWORD_SENT', 'A New Affiliate Password Has Been Sent To Your Email Address');
?>