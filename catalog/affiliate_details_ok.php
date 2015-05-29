<?php
/*
  $Id: ,v 3.00 2015/05/29

  oscAffiliate, Affiliate Module for osCommerce
  http://www.snowtech.com.au

  Copyright (c) 2002 -2015 Snowtech Services

*/

  require('includes/application_top.php');
  require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_AFFILIATE_DETAILS_OK);
  $breadcrumb->add(NAVBAR_TITLE, tep_href_link(FILENAME_AFFILIATE_DETAILS_OK));
  require(DIR_WS_INCLUDES . 'template_top.php');
?>
  <h1><?php echo HEADING_TITLE; ?></h1>
 <div class="contentContainer">
  <div class="contentText">

  </div>
  <div class="buttonSet">
<span class="buttonAction"><?php echo '<a href="' . tep_href_link(FILENAME_AFFILIATE_SUMMARY) . '">' . tep_draw_button(IMAGE_BUTTON_CONTINUE, 'triangle-1-e') . '</a>'; ?></span>
   </div>
</div>
<?php
  require(DIR_WS_INCLUDES . 'template_bottom.php');
  require(DIR_WS_INCLUDES . 'application_bottom.php');
?>