// JavaScript Document

$(document).ready(function () {
    //扫码登录或是用户密码登录切换
	$('.logtype').click(function(){
	   if($(this).attr("class")=="logtype on"){
	      $(this).removeClass('on');
		  $('.normalLogin').css('display','block');
		  $('.weixinLogin').css('display','none');
	   }else
	   {
		  $(this).addClass('on');
		  $('.normalLogin').css('display','none');
		  $('.weixinLogin').css('display','block');
	   }
	});
//
// 	//自动登录
// 	$('.CheckBox').click(function(){
// 	   if($(this).attr("class")=="CheckBox Yes"){
// 	      $(this).removeClass('Yes');
// 	   }else
// 	   {
// 		  $(this).addClass('Yes');
// 	   }
// 	})
//
//
//
// 	//使用帮助
// 	 var _nTimer = 0;
//      $('.useHelpcon').mouseover(function () {
//        clearTimeout(_nTimer);
//        $(".usehelpimg").css("display", "block").stop().animate({ marginLeft: "-100px", opacity: 1 },500, "swing");
//      }).mouseout(_back);
// 	  function _back() {
//        _nTimer = setTimeout(function () {
//         $(".usehelpimg").stop().animate({ marginLeft: "+30px", opacity: 0 }, "400", "swing", function () {
//            $(".usehelpimg").hide();
//          });
//        }, 100);
//      }
// 	/*
// 	$('.useHelp').mouseover(function(){
// 	   $(".usehelpimg").css("display", "block").animate({opacity:"1",marginLeft:"-88px"},500);
// 	})*/
//
//
//
// 	//注册选项卡
//   var oLihot = document.getElementById("tabzc").getElementsByTagName("li");
//   var oUlhot = document.getElementById("contentzc").getElementsByTagName("ul");
//   for(var i = 0; i < oLihot.length; i++)
//   {
// 		oLihot[i].index = i;
// 		oLihot[i].onclick = function ()
//         {
//            for(var n = 0; n < oLihot.length; n++)
// 	          oLihot[n].className="";
// 			  this.className = "currentzc";
// 			  for(var n = 0; n < oUlhot.length; n++)
// 				 oUlhot[n].style.display = "none";
// 				 oUlhot[this.index].style.display = "block";
// 				 if(oUlhot[this.index].title == ""){
// 					 $.parser.parse(oUlhot[this.index]);
// 					 oUlhot[this.index].title = "parsed";
// 				 }
// 	   }
//    }


});
layui.use(['layer'], function () {

	$('#but1').click(function(){
	    var path = $("#path").val();
		var uaccount = $("#uaccount").val();
		var upassword = $("#upassword").val();
		var test = $("#code").val();
		var User ={"uaccount":uaccount,"upassword":upassword,"test":test};
		User = JSON.stringify(User);
		$.ajax({
			url:path+"/user/userLogin",
			async:true,
			type:"post",
			data:"User="+User,
			datatype:"text",
			success:function(msg)
			{
				if(msg === "1111")
				{
					location.href=path+"/user/index";
				}else if (msg === "stateError"){
					layer.alert("该账号已被冻结!",{icon:2});
				} else if (msg === "userError"){
					layer.alert("用户名或密码错误!",{icon:2});
				}else if (msg === "testError"){
					layer.alert("验证码错误!",{icon:2});
				}
			}, error: function () {
				layer.alert("网络繁忙!",{icon:2});
			}
		})
    });

	$("#bu1").click(function () {
		var path = $("#path").val();
		var code = document.getElementById("bu2");
		code.src = path + "/user/loginCode?"+Math.random();

	});
	$("#bu2").click(function () {
		var path = $("#path").val();
		var code = document.getElementById("bu2");
		code.src = path + "/user/loginCode?"+Math.random();
	});

});
