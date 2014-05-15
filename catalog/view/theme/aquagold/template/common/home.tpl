<?php echo $header; ?>
    
    <!--Section Start: -->
    <section class="body_container" id="body_container">
      <div class="mid_center">
      <article class="top_left_text">
        <div class="skin_text" style="width:auto;">the perfect finishing<br>
          touch for your skin<br>
          treatments <br>
          <div id="panel"><aside class="patients_box" style="background:none;">
          <div class="patient_text" style="line-height:normal; font-weight:normal; text-transform:none;"><span style="font-size: 16px; font-weight: bold; font-style:normal;">AQUAGOLD<sup>&reg;</sup> <span style="font-family:'Segoe Script'; font-style:normal;">fine touch</span><sup>&trade;</sup></span> <br /> <br />
          
Transfers active ingredients via minute bores it creates, allowing for greater absorption of the ingredients below the epidermis. <br /> <br />
The patented microneedle technology improves the transfer efficiency of active ingredients into the skin without pain.</div>
          
          <span id="push_down" style="float:right; text-transform:none;"><a href="javascript:;" id="flip2"><img src="catalog/view/theme/aquagold/image/push_down.png" width="26" height="19" alt="img"></a> <a href="<?php echo $faq; ?>" style="margin:0 50px 0 50px;">Learn more &gt;&gt;</a></span>
          </aside> <img src="catalog/view/theme/aquagold/image/product.jpg"><br /><input type="button" class="buy-btn" value="BUY NOW" onclick="location.href='<?php echo $product; ?>'" style="float:right; margin-top:-30px;"> </div>
          <span id="push_up"><a href="javascript:;" id="flip1">Learn More...<img src="catalog/view/theme/aquagold/image/lear_more.png" width="26" height="19" alt="img"></a></span> </div>
      </article>
      </div>
      <article class="full_row">
        <aside class="patients_box" style="height:155px;">
          <div class="patient_text" style="font-style:italic; font-size:18px;">Patients</div>
          
            <div class="row_one" style="height:62px;"><span>Find/Nominate a Physician</span>
              <form action="<?php echo $search; ?>" method="post">
              <input name="zip" type="text" value="" class="zip_code" placeholder="ZIP Code" pattern="[0-9]{5}" required>
              <input type="submit" class="save_button" value="Search" style="width:60px;">
              </form>
            </div>
            <!--<div class="row_one"><span>Activate Giftcard</span>
              <form action="<?php echo $reward; ?>" method="post">
              <input name="code" type="text" value="" class="zip_code" placeholder="UIC Code" required>
              <input type="submit" class="save_button" value="GO">
              </form>
            </div>-->
            <div class="row_one"><span style="width:224px;"><!--Buy Giftcard for friends-->Giftcards by Top MD's</span> <input type="button" class="save_button" value="Buy" onclick="location.href='<?php echo $voucher; ?>';"></div>
            <a href="<?php echo $goldrush; ?>"><div class="patient_text">Learn more about the benefits of our</div>
            <div class="patient_text" style="font-size:14px; padding-top:5px;">Goldrush Loyalty Rewards Program</div></a>
          
        </aside>
        <aside class="patients_box_sec" style="height:155px;">
          <div class="patient_text" style="font-style:italic; font-size:18px;">Physicians</div>
          <form action="<?php echo $reward; ?>" method="post">
            <div class="row_one"><span>Redeem Giftcard</span>
              <input name="code" type="text" value="" class="zip_code" placeholder="Act. code" required>
              <input type="submit" class="save_button" value="GO">
            </div>
            <div class="row_one"><span style="width:224px;">AQUAGOLD<sup>&reg;</sup> <span style="font-family:'Segoe Script'; float:none;">fine touch</span><sup>&trade;</sup></span> <input type="button" class="save_button" value="Buy" onclick="location.href='<?php echo $product; ?>';"> <span style="width:224px;">Create your own giftcards</span> <input type="button" class="save_button" value="GO" onclick="location.href='<?php echo $voucher; ?>';"></div>
            <a href="<?php echo $heartofgold; ?>"><div class="patient_text">Learn more about the benefits of our</div>
            <div class="patient_text" style="font-size:14px; padding-top:5px;">Heart of Gold Rewards Program</div></a>
          </form>
        </aside>
      </article>
    </section>

<?php echo $footer; ?>