<?php echo $header; ?>

<!--Section Start: -->
  <section class="body_container regist_bg">
  <div class="shadow_bg">
    <?php if ($error_warning) { ?>
    <div class="warning"><?php echo $error_warning; ?></div>
    <?php } ?>
    <div class="mid_center">
      <div class="nav_bar">
      <?php foreach ($breadcrumbs as $breadcrumb) { ?>
      <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
      <?php } ?>
      </div>
      <?php if ($type == 1) { ?>
      <h1><!--PURCHASE-->Let's get started</h1>
      <div class="button_box" style="margin-top:-50px; margin-left:180px;"> 
        <input type="button" value="Create your own giftcards" class="createCardButton" onclick="location.href='<?php echo $creategiftcard; ?>';">
        <input type="button" value="Purchase your own giftcards" class="giftCardButton active" onclick="location.href='<?php echo $voucher; ?>';">
        <input type="button" value="Order AQUAGOLD for the office" class="aquaGardButton" onclick="location.href='<?php echo $product; ?>';">
      </div>
      <?php } ?>
    </div>
    
  </div>
  </section>


<?php echo $footer; ?>