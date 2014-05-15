<?php echo $header; ?>
<!--Section Start: -->
<section class="body_container regist_bg">
<div class="shadow_bg"><?php echo $content_top; ?>
  <div class="mid_center">
    <div class="nav_bar"><?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?></div>
  
  <h1><?php echo $heading_title; ?></h1>
  <?php echo $text_message; ?>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
  </div>
  <?php echo $content_bottom; ?></div></div></section>
<?php echo $footer; ?>