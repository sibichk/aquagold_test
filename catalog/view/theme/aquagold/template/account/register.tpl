<?php echo $header; ?>

<!--Section Start: -->
  <section class="body_container regist_bg">
  <div class="shadow_bg">
    <?php if ($error_warning) { ?>
    <div class="warning"><?php echo $error_warning; ?></div>
    <?php } ?>
    <div class="mid_center">
      <div class="nav_bar"><?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?></div>
    </div>
    <div class="regist_center">
      <div class="registration_box">
        <div class="registation_text"><span style="color:#7c6323;">Register</span> <!--and account--></div>
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <div class="form_box1">
          <label>Name (First and Last) &#042;</label>
          <input name="firstname" type="text" class="input_regis" value="<?php echo $firstname; ?>" required>
          <?php if ($error_firstname) { ?>
          <span class="error"><?php echo $error_firstname; ?></span>
          <?php } ?>
        </div>
        <!--<div class="form_box1">
          <label>Last Name &#042;</label>
          <input name="lastname" type="text" class="input_regis" value="<?php echo $lastname; ?>" required>
          <?php if ($error_lastname) { ?>
          <span class="error"><?php echo $error_lastname; ?></span>
          <?php } ?>
        </div>-->
        <div class="form_box1">
          <label>E-mail &#042;</label>
          <input name="email" type="email" class="input_regis" value="<?php echo $email; ?>" required>
          <?php if ($error_email) { ?>
          <span class="error"><?php echo $error_email; ?></span>
          <?php } ?>
        </div>
        <!--<div class="form_box1">
          <label>Username</label>
          <input name="user_name" type="text" class="input_regis" pattern="[a-zA-Z0-9]{2,64}" required>
        </div>-->
        <div class="form_box1">
          <label>Password &#042;</label>
          <input name="password" type="password" class="input_regis" value="<?php echo $password; ?>" pattern=".{6,}" required autocomplete="off">
          <?php if ($error_password) { ?>
          <span class="error"><?php echo $error_password; ?></span>
          <?php } ?>
        </div>
        <!--<div class="form_box1" style="margin-bottom:0;">
          <label>Retype Password &#042;</label>
          <input name="confirm" type="password" class="input_regis" value="<?php echo $confirm; ?>" pattern=".{6,}" required autocomplete="off">
          <?php if ($error_confirm) { ?>
          <span class="error"><?php echo $error_confirm; ?></span>
          <?php } ?>
        </div>-->
        <!--<div class="form_box1" style="margin-bottom:0;">
          <label>Referred by
            <input name="is_referred" type="checkbox" value="1" class="check-show">
            <input name="referred_by" id="referred_by" type="text" class="small_input" placeholder="Name" style="display:none; margin-top:2px;"> <br>Account type
          </label>
        </div>-->
        <div class="form_box1">
          <label>Account type &#042;</label>
          <select class="view_input" name="customer_type" id="dropdown" style="width:300px;" required>
            <option value="">Choose</option>
            <option value="1">Heart of Gold (Physician)</option>
            <option value="2">Gold Rush (Patient)</option>
          </select>
        </div>
        <div class="form_box1" id="message1" style="display:none;" >
          <label>Licence number &#042;</label>
          <input name="license_number" id="licence_number" type="text" class="input_regis" />
        </div>
        <div class="form_box1">
          <label>Promo code</label>
          <input name="code" type="text" class="input_regis">
        </div>
        <div class="form_box1">
          <input name="register" type="submit" class="register_btn" value="register account">
        </div>
        </form>
        <div class="form_box1">
          <label>By creating an account, you agree to our <a href="<?php echo $privacy; ?>"><span style="color:#836328;">Privacy Policy</span></a> and <a href="<?php echo $terms; ?>"><span style="color:#836328;">Terms & Conditions</span></a></label>
        </div>
      </div>
    </div>
  </div>
  </section>
<script type="text/javascript"><!--
$('input[name=\'customer_group_id\']:checked').live('change', function() {
	var customer_group = [];
	
<?php foreach ($customer_groups as $customer_group) { ?>
	customer_group[<?php echo $customer_group['customer_group_id']; ?>] = [];
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['company_id_display'] = '<?php echo $customer_group['company_id_display']; ?>';
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['company_id_required'] = '<?php echo $customer_group['company_id_required']; ?>';
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['tax_id_display'] = '<?php echo $customer_group['tax_id_display']; ?>';
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['tax_id_required'] = '<?php echo $customer_group['tax_id_required']; ?>';
<?php } ?>	

	if (customer_group[this.value]) {
		if (customer_group[this.value]['company_id_display'] == '1') {
			$('#company-id-display').show();
		} else {
			$('#company-id-display').hide();
		}
		
		if (customer_group[this.value]['company_id_required'] == '1') {
			$('#company-id-required').show();
		} else {
			$('#company-id-required').hide();
		}
		
		if (customer_group[this.value]['tax_id_display'] == '1') {
			$('#tax-id-display').show();
		} else {
			$('#tax-id-display').hide();
		}
		
		if (customer_group[this.value]['tax_id_required'] == '1') {
			$('#tax-id-required').show();
		} else {
			$('#tax-id-required').hide();
		}	
	}
});

$('input[name=\'customer_group_id\']:checked').trigger('change');
//--></script> 
<script type="text/javascript"><!--
$('select[name=\'country_id\']').bind('change', function() {
	$.ajax({
		url: 'index.php?route=account/register/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('.wait').remove();
		},			
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#postcode-required').show();
			} else {
				$('#postcode-required').hide();
			}
			
			html = '<option value=""><?php echo $text_select; ?></option>';
			
			if (json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
        			html += '<option value="' + json['zone'][i]['zone_id'] + '"';
	    			
					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
	      				html += ' selected="selected"';
	    			}
	
	    			html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}
			
			$('select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'country_id\']').trigger('change');
//--></script> 
<script type="text/javascript"><!--
$(document).ready(function() {
	$('.colorbox').colorbox({
		width: 640,
		height: 480
	});
});
//--></script> 

test
<?php echo $footer; ?>