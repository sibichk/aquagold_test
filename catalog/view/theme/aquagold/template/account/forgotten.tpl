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
        <div class="registation_text"><span style="color:#7c6323;">forgot password</span> </div>
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <div class="form_box1">
          <label>Email</label>
          <input name="email" type="email" class="input_regis" required>
          <span><a href="<?php echo $back; ?>"><?php echo $button_back; ?></a></span>
        </div>
        <div class="form_box1">
          <input name="" type="submit" class="register_btn" value="submit">
        </div>
        </form>
      </div>
    </div>
  </div>
  </section>
<?php echo $footer; ?>