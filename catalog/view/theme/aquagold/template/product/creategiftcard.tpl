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
        <input type="button" value="Create your own giftcards" class="createCardButton active" onclick="location.href='<?php echo $creategiftcard; ?>';">
        <input type="button" value="Purchase your own giftcards" class="giftCardButton" onclick="location.href='<?php echo $voucher; ?>';">
        <input type="button" value="Order AQUAGOLD for the office" class="aquaGardButton" onclick="location.href='<?php echo $product; ?>';">
      </div>
      <?php } ?>
    </div>
    <div class="mid_center" id="giftcard_info">
       <div class="create_giftcard">
           <span style="font-size:19px">1. Set your exclusive offer</span><img src="catalog/view/theme/aquagold/image/question_icon.png" height="20" width="20" title="Attract more customers by offering them discount when they use the giftcard" />
                       

		<div class="discount">Your discount rate <span>currently at x%</span></div>
		<div class="discount_rate">5%</div>
		<div class="discount_rate">10%</div>
		<div class="discount_rate">15%</div>
		<div class="discount_rate">20%</div>
		<div class="discount">Promotion period</div>
                <div id="calendar">From <input type="text" class="datepicker" readonly>&nbsp;&nbsp;&nbsp;&nbsp; to<input type="text" class="datepicker" readonly></div>
                <span style="font-size:19px">2. Choose your giftcard denominations</span><img src="catalog/view/theme/aquagold/image/question_icon.png" height="20" width="20" title="These are the giftcard denomination you are offering your patients to redeem for AQUAGOLD treatment" />
                <div class="discount">Choose all that apply</div>
		<div class="denomination">$250</div>
		<div class="denomination">$500</div>
		<div class="denomination">$1000</div>
		<div class="denomination">$5000</div>
	</div>
	<div class="giftcard_img">
            <span><img src="catalog/view/theme/aquagold/image/giftcard(1).png" height="400"></span>
                <div class="giftcard_buttons">
		<input type="button" value="Save"><input type="button" value="Purchase your own giftcards >>">
                </div>
	</div>
        
    </div>   
    
  </div>
  </section>
<script>
  $(function() {
    $( ".datepicker" ).datepicker();
  });
  </script>

<?php echo $footer; ?>