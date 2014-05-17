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
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
    <div class="full_border_box">
      <div class="mid_center">
        <div class="gift_container">
            <h2>GIFT CARD PURCHASE</h2>
          
          <div class="gift_form">
            <?php if ($type != 1) { ?>
            <div class="form_box2">
              <label>Recipient's Name&#042;</label>
              <input name="to_name" type="text" class="gift_input" value="<?php echo $to_name; ?>" required>
              <?php if ($error_to_name) { ?>
              <span class="error"><?php echo $error_to_name; ?></span>
              <?php } ?>
            </div>
            <div class="form_box2">
              <label style="height:105px; font-size:12px; line-height:normal;">Recipient's E-mail<i>How will you like it delivered?</i>&#042;</label>
              <input name="is_mail" type="checkbox" value="1" class="check-show1"> Mail giftcard to <br />
              <textarea name="shipping_address" id="shipping_address" class="messagebox small_input1" placeholder="Shipping Address" style="display:none; width:200px; height:50px;"><?php echo $shipping_address; ?></textarea> <br />
              <i>Shipping cost of $8.95 for ANY amount</i> <br /><br />
              <input name="is_email" type="checkbox" value="1" class="check-show2"> Email activation code to <br />
              <input name="to_email" id="to_email" type="email" class="gift_input small_input2" placeholder="Email address" value="<?php echo $to_email; ?>" style="display:none;"> <br />
              <i>Free</i>
              <?php if ($error_to_email) { ?>
              <span class="error"><?php echo $error_to_email; ?></span>
              <?php } ?>
            </div>
            <?php } else { ?>
            <input type="hidden" name="to_name" value="<?php echo $from_name; ?>" />
            <input type="hidden" name="shipping_address" value="" />
            <input type="hidden" name="to_email" value="" />
            <?php } ?>
            <div class="form_box2">
              <label>Your Name&#042;</label>
              <input name="from_name" type="text" class="gift_input" value="<?php echo $from_name; ?>" required>
              <?php if ($error_from_name) { ?>
              <span class="error"><?php echo $error_from_name; ?></span>
              <?php } ?>
            </div>
            <div class="form_box2">
              <label>Your E-mail&#042;</label>
              <input name="from_email" type="email" class="gift_input" value="<?php echo $from_email; ?>" required>
              <?php if ($error_from_email) { ?>
              <span class="error"><?php echo $error_from_email; ?></span>
              <?php } ?>
            </div>
            <div class="form_box2">
              <input type="hidden" name="voucher_theme_id" value="8" />
              <label>Gift Card Theme&#042;</label>
              <span>
              <?php foreach ($voucher_themes as $voucher_theme) { ?>
              <?php if ($voucher_theme['voucher_theme_id'] == $voucher_theme_id) { ?>
              <input type="radio" name="voucher_theme_id" value="<?php echo $voucher_theme['voucher_theme_id']; ?>" id="voucher-<?php echo $voucher_theme['voucher_theme_id']; ?>" checked="checked" />
              <?php echo $voucher_theme['name']; ?>
              <?php } else { ?>
              <input type="radio" name="voucher_theme_id" value="<?php echo $voucher_theme['voucher_theme_id']; ?>" id="voucher-<?php echo $voucher_theme['voucher_theme_id']; ?>" />
              <?php echo $voucher_theme['name']; ?>
              <?php } ?>
              <?php } ?>
              </span>
              <?php if ($error_theme) { ?>
              <span class="error"><?php echo $error_theme; ?></span>
              <?php } ?> </div>
            <?php if ($type != 1) { ?>
            <div class="form_box2">
              <label>Message</label>
              <textarea name="message" cols="" rows="" class="messagebox"><?php echo $message; ?></textarea>
            </div>
            <div class="form_box2" id="search">
              <label>Doctor's name&#042;</label>
              <input name="doctor_name" type="text" class="gift_input" value="<?php echo $doctor_name; ?>" onClick="this.value = '';" onKeyDown="this.style.color = '#000000';" autocomplete="off" required>
              <span style="margin-left:5px; display:block; float:left; font-style:italic;"><a href="<?php echo $search; ?>" style="color: #5a5a5a">Don't have a doctor? <br>
              Find one here!Nominate a physician</a></span> </div>
            <?php } else { ?>
            <input type="hidden" name="message" value="" />
            <input type="hidden" name="doctor_name" value="" />
            <?php } ?>
            <div class="form_box2">
              <label>Denomination&#042; <?php if ($type == 1) { ?><br /> Exclusive Offer 0% <br /> <a href="<?php echo $discount; ?>" style="color: #FF0000;">Set exclusive offer&#042;</a><?php } ?></label>
              <span>
              <input name="amount" type="radio" value="0.01" checked>
              $0.01
              </span>
              <span>
              <input name="amount" type="radio" value="250" checked>
              $250
              <input name="amount" type="radio" value="500" <?php if($amount == 500) echo 'checked'; ?>>
              $500
              <input name="amount" type="radio" value="1000" <?php if($amount == 1000) echo 'checked'; ?>>
              $1000
              <input name="amount" type="radio" value="5000" <?php if($amount == 5000) echo 'checked'; ?>>
              $5000</span><?php if ($error_amount) { ?>
              <span class="error"><?php echo $error_amount; ?></span>
              <?php } ?> </div>
              <?php if ($type == 1) { ?>
              <div class="form_box2">
              <label>Exclusive Offer</label>	
              <?php if ($discount_rate) { ?> Currently at <?php echo (int)$discount_rate; ?>% <?php } else echo 'You have not set up your exclusive offer yet'; ?> &nbsp;	<a href="<?php echo ($discount_rate) ? $discount : $discount.'/insert'; ?>" style="color: #FF0000;">Set exclusive offer&#042;</a>
              </div>
              <?php } ?>
          </div>
          <div class="gift_form" style="width:auto; float:right;">
          <img src="catalog/view/theme/aquagold/image/Giftcard_250_print.jpg" width="300" alt="img">
          </div>
        </div>
      </div>
    </div>
    <div class="mid_center">
      <div class="addtocart_button" >
        <input type="submit" class="register_btn" value="add to cart" <?php if ($type == 1 && !$discount_rate) { ?>onclick="alert('You have not set up your discount rate yet'); return false;"<?php } ?>>
        <span class="space">
        <?php if ($agree) { ?>
        <input type="checkbox" name="agree" value="1" checked="checked" />
        <?php } else { ?>
        <input type="checkbox" name="agree" value="1" />
        <?php } ?>
        I have read  and approved the gift cards <a href="<?php echo $terms; ?>" class="colorbox cboxElement">Terms & Conditions</a></span></div>
    </div>
    </form>
  </div>
  </section>

<script type="text/javascript"><!--
$('.colorbox').colorbox({
	width: 640,
	height: 480
});
//--></script>
<?php echo $footer; ?>