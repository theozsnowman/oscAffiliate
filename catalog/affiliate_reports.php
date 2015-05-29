<?php
/*
  $Id: ,v 3.00 2015/05/29

  oscAffiliate, Affiliate Module for osCommerce
  http://www.snowtech.com.au

  Copyright (c) 2002 -2015 Snowtech Services

*/

  require('includes/application_top.php');
  if (!tep_session_is_registered('affiliate_id')) {
    $navigation->set_snapshot();
    tep_redirect(tep_href_link(FILENAME_AFFILIATE, '', 'SSL'));
  }
  require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_AFFILIATE_REPORTS);
  $breadcrumb->add(NAVBAR_TITLE, tep_href_link(FILENAME_AFFILIATE_REPORTS));
  require(DIR_WS_INCLUDES . 'template_top.php');
?>
<h1><?php echo HEADING_TITLE; ?></h1>
<div class="contentContainer">
  <div class="contentText">
    <?php echo TEXT_INFORMATION; ?>
  </div>

<div class="contentText">
            <p><strong><?php echo '<a href="' . tep_href_link(FILENAME_AFFILIATE_CLICKS, '', 'SSL'). '">' . TEXT_AFFILIATE_CLICKS . '</a>';?></strong></p>
               <p><img src="images/arrow_green.gif" border="0" alt="" width="12" height="10">&nbsp;<?php echo TEXT_INFORMATION_CLICKS ;?>&nbsp; <?php echo '<a href="' . tep_href_link(FILENAME_AFFILIATE_CLICKS, '', 'SSL') . '">'  . tep_draw_button(IMAGE_BUTTON_CLICKS, 'link', null, 'primary') . '</a>';?></p>
          </div>
<div class="contentText">
            <p><strong><?php echo '<a href="' . tep_href_link(FILENAME_AFFILIATE_SALES, '', 'SSL'). '">' . TEXT_AFFILIATE_SALES . '</a>';?></strong></p>
               <p><img src="images/arrow_green.gif" border="0" alt="" width="12" height="10">&nbsp;<?php echo TEXT_INFORMATION_SALES ;?>&nbsp;<?php echo '<a href="' . tep_href_link(FILENAME_AFFILIATE_SALES, '', 'SSL') . '">' . tep_draw_button(IMAGE_BUTTON_SALES, 'link', null, 'primary') . '</a>';?></p>

         </div>
<div class="contentText">
            <p><strong><?php echo '<a href="' . tep_href_link(FILENAME_AFFILIATE_PAYMENT, '', 'SSL'). '">' . TEXT_AFFILIATE_PAYMENT . '</a>';?></strong></p>
                <p><img src="images/arrow_green.gif" border="0" alt="" width="12" height="10">&nbsp;<?php echo TEXT_INFORMATION_PAYMENT ;?>&nbsp;<?php echo '<a href="' . tep_href_link(FILENAME_AFFILIATE_PAYMENT, '', 'SSL') . '">' . tep_draw_button(IMAGE_BUTTON_PAYMENT, 'link', null, 'primary') . '</a>';?></p>
           </div>
</div>
<?php
  require(DIR_WS_INCLUDES . 'template_bottom.php');
  require(DIR_WS_INCLUDES . 'application_bottom.php');
?>