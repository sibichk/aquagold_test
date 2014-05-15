<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<!--Section Start: -->
    <section class="body_container regist_bg">
    <div class="shadow_bg">
      <div class="mid_center">
        <div class="nav_bar"><?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
        <?php } ?></div>
      </div>
      <div class="full_border_box" style="border-bottom:0px;">
        <div class="mid_center">
          <div class="gift_container">
            <h2>Contact Us</h2>
            <div class="profile_box_row">
              <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                <?php if (isset($logged)) { ?>
                <div class="address_box1">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td>Address:</td>
                    </tr>
                    <tr>
                      <td>100 Park Avenue,</td>
                    </tr>
                    <tr>
                      <td>New York NY 10017, USA</td>
                    </tr>
                  </table>
                </div>
                <div class="address_box1">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td>Telephone:</td>
                    </tr>
                    <tr>
                      <td>1 800 55 fine touch</td>
                    </tr>
                    <tr>
                      <td>1-800-553-4638</td>
                    </tr>
                  </table>
                </div>
                <div class="address_box1" style="margin-right:0px;">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td>E-mail:</td>
                    </tr>
                    <tr>
                      <td>
                      <?php
                      if($type == 2)
                      echo '<a href="mailto:goldrush@aquagoldfinetouch.com" class="email">goldrush@aquagoldfinetouch.com</a>';
                      else
                      echo '<a href="mailto:heartofgold@aquagoldfinetouch.com" class="email">heartofgold@aquagoldfinetouch.com</a>'; 
                      ?>
                      </td>
					  <tr>
					  <td>Fax: (212) 658-9811</td>
					  </tr>
                    </tr>
                    <!--<tr>
                      <td>New York NY 10017 , USA</td>
                    </tr>-->
                  </table>
                </div>
                <div class="row_one_form">
                <!--<div class="name_box">
                  <label>First Name</label> <input name="" type="text" class="input_filed" required></div>-->
                </div>
                <?php } ?>
                
                <div class="name_box">
                  <label>First Name</label> <input name="name" type="text" class="input_filed" value="<?php echo $name; ?>" required>
                  <?php if ($error_name) { ?>
                  <span class="error"><?php echo $error_name; ?></span>
                  <?php } ?></div>
               
                
                <div class="name_box">
                  <label>Last Name</label> <input name="lname" type="text" class="input_filed" value="<?php echo $lname; ?>" required></div>
              <div class="name_box" style="margin-right:0px;">
                  <label>E-mail</label> <input name="email" type="email" class="input_filed" value="<?php echo $email; ?>" required>
                  <?php if ($error_email) { ?>
                  <span class="error"><?php echo $error_email; ?></span>
                  <?php } ?></div>
                  
                  <div class="inquery_box" style="margin-right:0px;">
                  <label>Inquiry</label>
                 <textarea name="enquiry" cols="" rows="" class="input_area" required><?php echo $enquiry; ?></textarea>
                  <?php if ($error_enquiry) { ?>
                  <span class="error"><?php echo $error_enquiry; ?></span>
                  <?php } ?></div>
                  
                  <div class="inquery_box">
                  <div class="name_box">
                 <input name="captcha" type="text" class="input_filed" value="<?php echo $captcha; ?>" placeholder="What code is in the image?" style="width:298px;" required>
                <span class="captcha"> <img src="index.php?route=information/contact/captcha" alt="" /> </span>
                <?php if ($error_captcha) { ?>
                <span class="error"><?php echo $error_captcha; ?></span>
                <?php } ?></div>
                
                <div class="name_box" style="float:right; margin-right:0px;">
                <input type="submit" class="sub_btn" value="Submit">
                </div>
                  </div>
                  
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
    </section>
<?php echo $footer; ?>