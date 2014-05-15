<?php echo $header; ?>

<!--Section Start: -->
<section class="body_container">
<div class="shadow_bg">
  <div class="mid_center">
  <div class="nav_bar">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h1><?php echo $heading_title; ?></h1>
  <?php echo $description; ?>
  <div class="buttons">
    <div class="right"><a href="javascript: history.go(-1);" class="button"><?php echo $button_continue; ?></a></div>
  </div>
  </div>
</div>
</section>
    
<?php echo $footer; ?>