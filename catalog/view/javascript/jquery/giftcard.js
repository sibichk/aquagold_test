/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$('document').ready(function(){
		var image = $('.giftcard_img span');
                var denomination = $('.denomination');
		$('.discount_rate').click(function(){
			$('.active1').css('background-color','#A2741C').removeClass('active1');
			$(this).addClass('active1').css('background-color','#43230B');

		})
                $('.discount_rate').hover(function(){
                    $(this).css('cursor','pointer')
                })
		denomination.mouseover(function(){
			
				$(this).css({'background-color':'#43230B','opacity':'1','cursor':'pointer'});
				var a = $('.create_giftcard .denomination').index(this)
				if(a==0){
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
		})
                denomination.mouseout(function(){
                    if($(this).hasClass('active2')){
                        
                    }else{
                    $(this).css({'background-color':'#A2741C','opacity':'0.7','cursor':'auto'});
                }
                    image.html('<img src="catalog/view/theme/aquagold/image/giftcard(1).png">');
                    
                })
                denomination.click(function(){
                    	if($(this).hasClass('active2')){
                            $(this).css('background-color','#A2741C').removeClass('active2');
                        }
                        else{
                            $(this).css('background-color','#43230B').addClass('active2');
                        }

                    })
 
                
		
	})

