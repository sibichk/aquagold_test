/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$('document').ready(function(){
		image = $('.giftcard_img')
		$('.discount_rate').click(function(){
			$('.active1').css('background-color','#A2741C').removeClass('active1');
			$(this).addClass('active1').css('background-color','#43230B');

		})
		$('.denomination').click(function(){
			if($(this).hasClass('active2')){
				$(this).css('background-color','#A2741C').removeClass('active2');

			}
			else{
				$(this).addClass('active2').css('background-color','#43230B');
				var a = $('.create_giftcard .denomination').index(this)
				console.log(a);
				if($('.denomination').not(this).hasClass('active2')){
					image.html('<img src="catalog/view/theme/aquagold/image/giftcard.png">');
				}
				else if(a==0){
					image.html('<img src="catalog/view/theme/aquagold/image/Giftcard_250.jpg">');
				}
				else if(a==1){
					image.html('<img src="catalog/view/theme/aquagold/image/Giftcard_500.jpg">');
				}
				else if(a==2){
					image.html('<img src="catalog/view/theme/aquagold/image/Giftcard_1000.jpg">');
				}
				else if(a==3){
					image.html('<img src="catalog/view/theme/aquagold/image/Giftcard_5000.jpg">');
				}
			}

		})
		
	})

