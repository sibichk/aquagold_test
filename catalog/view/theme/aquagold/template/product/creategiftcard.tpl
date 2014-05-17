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
      <div class="button_box"> 
        <input type="button" value="Create your own giftcards" class="createCardButton" onclick="location.href='<?php echo $creategiftcard; ?>';">
        <input type="button" value="Purchase your own giftcards" class="giftCardButton active" onclick="location.href='<?php echo $voucher; ?>';">
        <input type="button" value="Order AQUAGOLD for the office" class="aquaGardButton" onclick="location.href='<?php echo $product; ?>';">
      </div>
      <?php } ?>
    </div>
    <div class="mid_center" id="giftcard_info">
       <div class="create_giftcard">
		<h3>1. Set your exclusive offer<img src="catalog/view/theme/aquagold/image/question_icon.png" height="20" width="20" id="offer_dialog"/></h3>
                       

		<div class="discount">Your discount rate <span>currently at x%</span></div>
		<div class="discount_rate">5%</div>
		<div class="discount_rate">10%</div>
		<div class="discount_rate">15%</div>
		<div class="discount_rate">20%</div>
		<div class="discount">Promotion period</div>
		<div id="calendar">From <input type="text"> to<input type="text"></div>
		<h3>2. Choose your giftcard denominations<img src="catalog/view/theme/aquagold/image/question_icon.png" height="20" width="20"id="denomination_dialog"/></h3>
		<div class="discount_rate">$250</div>
		<div class="discount_rate">$500</div>
		<div class="discount_rate">$1000</div>
		<div class="discount_rate">$5000</div>
	</div>
	<div class="giftcard_img">
		<img src="catalog/view/theme/aquagold/image/Giftcard_250.jpg">
	</div>
    </div>   
    
  </div>
  </section>


<?php echo $footer; ?>