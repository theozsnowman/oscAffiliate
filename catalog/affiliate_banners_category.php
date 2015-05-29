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
  require(DIR_WS_LANGUAGES . $language . '/' . FILENAME_AFFILIATE_BANNERS_CATEGORY);
  $location = ' &raquo; <a href="' . tep_href_link(FILENAME_AFFILIATE_BANNERS_CATEGORY, '', 'NONSSL') . '" class="headerNavigation">' . NAVBAR_TITLE . '</a>';
 
 $affiliate_banners_values = tep_db_query("select * from " . TABLE_AFFILIATE_BANNERS . " where affiliate_category_id >'0' order by affiliate_banners_title");
  require(DIR_WS_INCLUDES . 'template_top.php');
?>
<h1><?php echo HEADING_TITLE; ?></h1>
<div class="contentContainer">
  <div class="contentText">
  <?php echo TEXT_INFORMATION; ?>
  </div>
    <div class="contentText">
<?php
  if (tep_db_num_rows($affiliate_banners_values)) {

    while ($affiliate_banners = tep_db_fetch_array($affiliate_banners_values)) {
      $affiliate_categories_query = tep_db_query("select categories_name from " . TABLE_CATEGORIES_DESCRIPTION . " where categories_id = '" . $affiliate_banners['affiliate_category_id'] . "' and language_id = '" . (int)$languages_id . "'");
      $affiliate_categories = tep_db_fetch_array($affiliate_categories_query);
      $prod_id = $affiliate_banners['affiliate_category_id'];
      $ban_id = $affiliate_banners['affiliate_banners_id'];
      switch (AFFILIATE_KIND_OF_BANNERS) {
        case 1: // Link to Categories
          if ($prod_id > 0) {
            $link = '<a href="' . HTTPS_SERVER . DIR_WS_HTTP_CATALOG . FILENAME_CATEGORIES_INFO . '?ref=' . $affiliate_id . '&cPath=' . $prod_id . '&affiliate_banner_id=' . $ban_id . '" target="_blank"><img src="' . HTTPS_SERVER . DIR_WS_HTTP_CATALOG . DIR_WS_IMAGES . $affiliate_banners['affiliate_banners_image'] . '" border="0" alt="' . $affiliate_categories['categories_name'] . '"></a>';
            $link1 = '<a href="' . HTTP_SERVER . DIR_WS_HTTP_CATALOG . FILENAME_CATEGORIES_INFO . '?ref=' . $affiliate_id . '&cPath=' . $prod_id . '&affiliate_banner_id=' . $ban_id . '" target="_blank"><img src="' . HTTP_SERVER . DIR_WS_HTTP_CATALOG . DIR_WS_IMAGES . $affiliate_banners['affiliate_banners_image'] . '" border="0" alt="' . $affiliate_categories['categories_name'] . '"></a>';
            $link2 = '<a href="' . HTTP_SERVER . DIR_WS_HTTP_CATALOG . FILENAME_CATEGORIES_INFO . '?ref=' . $affiliate_id . '&cPath=' . $prod_id . '&affiliate_banner_id=' . $ban_id . '" target="_blank">' . $affiliate_categories['categories_name'] . '</a>';
			}
          break;
        case 2: // Link to Categories
          if ($prod_id > 0) {
            $link = '<a href="' . HTTPS_SERVER . DIR_WS_HTTP_CATALOG . FILENAME_CATEGORIES_INFO . '?ref=' . $affiliate_id . '&cPath=' . $prod_id . '&affiliate_banner_id=' . $ban_id . '" target="_blank"><img src="' . HTTPS_SERVER . DIR_WS_HTTP_CATALOG . FILENAME_AFFILIATE_SHOW_BANNER . '?ref=' . $affiliate_id . '&affiliate_banner_id=' . $ban_id . '" border="0" alt="' . $affiliate_categories['categories_name'] . '"></a>';
            $link1 = '<a href="' . HTTP_SERVER . DIR_WS_HTTP_CATALOG . FILENAME_CATEGORIES_INFO . '?ref=' . $affiliate_id . '&cPath=' . $prod_id . '&affiliate_banner_id=' . $ban_id . '" target="_blank"><img src="' . HTTP_SERVER . DIR_WS_HTTP_CATALOG . FILENAME_AFFILIATE_SHOW_BANNER . '?ref=' . $affiliate_id . '&affiliate_banner_id=' . $ban_id . '" border="0" alt="' . $affiliate_categories['categories_name'] . '"></a>';
            $link2 = '<a href="' . HTTP_SERVER . DIR_WS_HTTP_CATALOG . FILENAME_CATEGORIES_INFO . '?ref=' . $affiliate_id . '&cPath=' . $prod_id . '&affiliate_banner_id=' . $ban_id . '" target="_blank">' . $affiliate_categories['categories_name'] . '</a>';
			}
          break;
      }

          if ($prod_id > 0) {
?>
  <div class="contentText">

            <p><?php echo TEXT_AFFILIATE_NAME; ?>&nbsp;<?php echo $affiliate_banners['affiliate_banners_title']; ?></p>
            <p><?php echo $link; ?></p>
            <p><?php echo TEXT_AFFILIATE_INFO; ?></p>
             <p><textarea cols="60" rows="4" class="boxText"><?php echo $link1; ?></textarea></p>
            <p><strong>Text Version:</strong> <?php echo $link2; ?></p>

            <p><?php echo TEXT_AFFILIATE_INFO; ?></p>
            <p><textarea cols="60" rows="3" class="boxText"><?php echo $link2; ?></textarea></p>

</div>
<?php
    }
  }
}
?>
</div>
</div>
<?php
  require(DIR_WS_INCLUDES . 'template_bottom.php');
  require(DIR_WS_INCLUDES . 'application_bottom.php');
?>
