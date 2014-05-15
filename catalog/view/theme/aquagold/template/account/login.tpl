<?php echo $header; ?>

<!--Section Start: -->
  <section class="body_container regist_bg">
  <div class="shadow_bg">
    <?php if ($success) { ?>
    <div class="success"><?php echo $success; ?></div>
    <?php } ?>
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
        <div class="registation_text"><span style="color:#7c6323;">Log in</span> </div>
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <div class="form_box1">
          <label>Email</label>
          <input name="email" type="email" class="input_regis" value="<?php echo $email; ?>" required>
        </div>
        <div class="form_box1">
          <label>Password</label>
          <input name="password" type="password" class="input_regis" value="<?php echo $password; ?>" autocomplete="off" required>
          <span><a href="<?php echo $forgotten; ?>">Forgot password?</a></span>
        </div>
        <div class="form_box1">
          <input name="login" type="submit" class="register_btn" value="login">
          <span><a href="<?php echo $register; ?>">New user?</a></span>
          <input type="button" class="register_btn" value="<?php echo $text_register; ?>" onclick="location.href='<?php echo $register; ?>';" style="margin-top:10px; background:#7d621f;">
          <?php if ($redirect) { ?>
          <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
          <?php } ?>
        </div>
        </form>
      </div>
    </div>
  </div>
  </section>
<script type="text/javascript"><!--
$('#login input').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#login').submit();
	}
});
//--></script> 
<?php echo $footer; ?>