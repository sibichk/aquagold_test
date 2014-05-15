<?php echo $header; ?>

<!--Section Start: -->
  <section class="body_container regist_bg">
  <div class="shadow_bg">
    <!--<?php if ($error_warning) { ?>
    <div class="warning"><?php echo $error_warning; ?></div>
    <?php } ?>-->
    <div class="mid_center">
      <div class="nav_bar"><?php foreach ($breadcrumbs as $breadcrumb) { ?>
      <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
      <?php } ?></div>
    </div>
    <div class="full_border_box">
        <div class="mid_center">
          <div class="gift_container">
            <h2>your account <span class="small_right"><a href="<?php echo $goldrush; ?>">Gold Rush Loyalty Program</a> | <a href="<?php echo $resources; ?>">Media Kit</a></span></h2>
            <div class="account_box">
              <div class="credit_box">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="170px" bgcolor="#836328"><table width="170" border="0" cellspacing="0" cellpadding="0" style="color:#ffffff; text-align:center;" class="reward_padding">
                        <tr>
                          <td class="white">My Credit</td>
                        </tr>
                        <tr>
                          <td class="white" style="font-size:30px;"><a href="<?php echo $transaction; ?>" style="font-size:30px; color:#FFFFFF;"><?php echo $credit; ?></a></td>
                        </tr>
                      </table></td>
                  </tr>
                </table>
              </div>
              <div class="earnPointBox1">
                <table width="270" border="0" cellpadding="0" cellspacing="0" style="height:73px;">
                  <tr>
                    <td width="170px" bgcolor="#836328"><table width="170" border="0" cellspacing="0" cellpadding="0" style="color:#ffffff; text-align:center;" class="reward_padding">
                        <tr>
                          <td class="white">My Reward Points</td>
                        </tr>
                        <tr>
                          <td class="white" style="font-size:30px;"><?php echo $points; ?></td>
                        </tr>
                      </table></td>
                    <td width="100px" valign="top"><table width="100" border="0" cellpadding="0" cellspacing="0" class="reward_padding">
                        <tr>
                          <td bgcolor="#c7c7cb"><a href="<?php echo $goldrush; ?>">Earn more<br>
                            <img src="catalog/view/theme/aquagold/image/plus.jpg" width="14" height="13" alt="img"></a></td>
                        </tr>
                        <tr>
                          <td bgcolor="#949494"><a href="<?php echo $reward; ?>">Details</a></td>
                        </tr>
                      </table></td>
                  </tr>
                </table>
              </div>
              <div class="earnPointBox1" style="margin-right:0px;">
                <table width="270" border="0" cellpadding="0" cellspacing="0" style="height:73px;">
                  <tr>
                    <td width="170px" bgcolor="#836328"><table width="170" border="0" cellspacing="0" cellpadding="0" style="color:#ffffff; text-align:center;" class="reward_padding">
                        <tr>
                          <td class="white">My Giftcard</td>
                        </tr>
                        <tr>
                          <td class="white" style="font-size:30px;"><?php echo $total; ?></td>
                        </tr>
                      </table></td>
                    <td width="100px" valign="top"><table width="100" border="0" cellpadding="0" cellspacing="0" class="reward_padding">
                        <tr>
                          <td bgcolor="#c7c7cb"><a href="<?php echo $voucher; ?>">Buy more<br>
                            <img src="catalog/view/theme/aquagold/image/plus.jpg" width="14" height="13" alt="img"></a></td>
                        </tr>
                        <tr>
                          <td bgcolor="#949494"><a href="<?php echo $order; ?>">Details</a></td>
                        </tr>
                      </table></td>
                  </tr>
                </table>
              </div>
              <div class="validate_gift_card">
                <!--<div class="row_one" style="float:right; width:auto;"><span>Validate Giftcard</span>
                  <form action="<?php echo $reward; ?>" method="post">
                  <input name="code" type="text" value="" class="zip_code" placeholder="Act. code" required>
                  </form>
                </div>-->
                <div class="gift_text">Gain more points<br>
                  with our <a href="<?php echo $referralPatient; ?>">Referral Program!</a></div>
              </div>
            </div>
            <div class="activation_row">
              <div class="org_btn">
                <!--<input name="" type="button" value="Your gift card has been activated!" class="act_button">-->
              </div>
              <!--<div class="accText">To use your redeemed giftcard, please visit your giftcard account to see the <a href="<?php echo $order; ?>">activation code</a></div>-->
            </div>
            <div class="activity_box">
              <table width="100%" border="0" cellspacing="0" cellpadding="0" class="activity_box">
                <tr>
                  <td width="740px">Orders </td>
                  <td width="100px">Date</td>
                  <td width="110px">Price</td>
                </tr>
                <?php if ($orders) { ?>
                <?php foreach ($orders  as $order) { ?>
                <tr>
                  <td width="740px" valign="top">#<?php echo $order['order_id']; ?>&nbsp;&nbsp;<a href="<?php echo $order['href']; ?>"><img src="catalog/view/theme/default/image/info.png" alt="<?php echo $button_view; ?>" title="<?php echo $button_view; ?>" /></a><!--&nbsp;&nbsp;<a href="<?php echo $order['reorder']; ?>"><img src="catalog/view/theme/default/image/reorder.png" alt="<?php echo $button_reorder; ?>" title="<?php echo $button_reorder; ?>" /></a>--> </td>
                  <td width="100px"><?php echo $order['date_added']; ?></td>
                  <td width="110px"><?php echo $order['total']; ?></td>
                </tr>
                <?php } ?>
                <?php } ?>
              </table>
            </div>
            <?php if ($orders) { ?>
            <div class="pagination"><?php echo $pagination; ?></div>
            <?php } else { ?>
            <div class="row_100">No recent activity up to date</div>
            <?php } ?>
          </div>
        </div>
      </div>
  </div>
  </section>
<?php echo $footer; ?>