$(function(){
	$(".selectBox .imitationSelect").on("click",function(){
		$(this).parent().next().toggle();
		$(this).next().toggleClass("fa-caret-up")
		if (event.stopPropagation) {   
			event.stopPropagation();   
		}else if (window.event) {  
			window.event.cancelBubble = true;   
		}		
	});
	$(".selectUl li").click(function(event){
		$(this).addClass("actived_li").siblings().removeClass("actived_li");
		var oliName = $(this).attr("value");
		var oliId = $(this).attr("oliId");
		$(this).parent().prev().children().val(oliName);
		$(this).parent().prev().children().attr("value",oliName);
		$(this).parent().prev().children().attr("oliId",oliId);
	});
	$(document).click(function(event){
		$(".selectUl").hide();
	});
});
$(document).ready(function(){
    $("#iform").hide();
    $('#sc').on('keyup',function(){
        var text = $.trim($(this).val()).toString();
        if(text.length > 0){
            $.ajax({
                url:'findCityName',
                data:{'cityname': text ,'time': new Date()},
                type:'POST',
                dataType:'json',
                success:function(data){
                    $('#iform').empty();
                    $('#iform').show();
                    for(var i = 0;i < data.length;i++){
                        $('#iform').append("<li cityname= "+data[i].name +">" + data[i].name + "</li>");
                    }
                    $("#iform").css("cursor","pointer");
                    $("#iform li").click(function(){
                        var a = $(this).attr("cityname");
                        var b = $(this).html;
                        var r = $("#sc").val();
                        if(r != ""){
                            $("#sc").val(a);
                            $("#iform").hide();
                        }else{
                            $("sc").val(a);
                            $("#iform").hide();
                        }
                    });
                }
            });
        }
    });
});
var mySwiper2 = new Swiper('#swiper',{
	loop: true,
  pagination : '.pagination',
  paginationClickable :true,
	effect : 'fade',
  fadeEffect: {
    crossFade: true,
  },
	autoplay : 4500,
	mousewheel: true,
	speed : 600,
	autoplayDisableOnInteraction : false
});
var mySwiper1 = new Swiper('#swiper1',{
	loop: true,
  pagination : '.pagination',
  paginationClickable :true,
	effect : 'fade',
  fadeEffect: {
    crossFade: true,
  },
  spaceBetween: 30,
	autoplay : 4500,
	speed : 600,
	autoplayDisableOnInteraction : false
});

//前进后退按钮
$(".left").click(function(){
	mySwiper1.slidePrev();
	mySwiper2.slidePrev();
})
$(".right").click(function(){
	mySwiper1.slideNext();
	mySwiper2.slideNext();
});
$(function(){
  $('form').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
      valid: 'glyphicon glyphicon-ok',
      invalid: 'glyphicon glyphicon-remove',
      validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
      userName: {
        message: '用户名验证失败',
        validators: {
          notEmpty: {
            message: '用户名不能为空'
           },
        stringLength: {
          min: 8,
            max: 18,
            message: '用户名长度必须在8到18位之间'
        },
        threshold: 8,
        remote:{
        	 url:"userCheck",
        	 message:'用户名已存在，请重新输入',
			 delay: 1500,
			 type: 'POST',
			 data:function(validator){
			 	return{
			 		userName : $("input[name=userName]").val(),
			 	}
			 }
        },
        regexp: {
            regexp: /^[a-zA-Z0-9]+$/,
            message: '用户名只能包含大写、小写、数字'
        }
        }
    },
      pwd: {
        validators: {
          notEmpty: {
          message: '密码不能为空'
          },
          stringLength: {
          min: 6,
            max: 18,
            message: '密码长度必须在6到18位之间'
        },
        regexp: {
            regexp: /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]+$/,
            message: '密码至少包含一个字母和一个数字'
          }
        }
      },
      pwd1:{
        validators:{
          notEmpty: {
          message: '密码不能为空'
          },
          identical: {
            field: 'pwd',
            message: '两次输入的密码不相符'
          }
        }
      },
      Code:{
      	validators:{
      		notEmpty:{
      			message:'工作地点不能为空'
      		}
      	}
      }
    }
  });
});
