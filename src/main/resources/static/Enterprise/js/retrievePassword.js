$(function () {
	var path = $("#path").val();
	//用户名验证页面的下一步按钮
	$("#bu3").click(function () {
		var account = $("#account").val();
		var test = $("#test").val();
		$.ajax({
			url:path+"/Enterprise/findPhoneByAccount",
			async:true,
			type:"post",
			data:{"account":account,"test":test},
			datatype:"text",
			beforeSend:function () {
				if (null==account||"" == account) {
					alert("请输入用户名");
					return false;
				}
			}, success:function (msg) {
				if(msg === "1111"){
					location.href=path + "/Enterprise/path/retrievePassword_2"
				}else if (msg ==="error") {
					alert("用户名不存在！")
				}else if (msg ==="testError") {
					alert("验证码错误！")
				}
			}
			,error:function () {
				alert("网络繁忙！");
			}
		});

	});
	//手机验证页面的下一步按钮
	$("#bu4").click(function () {
		var test = $("#tsted").val();
		if (scode==test){
			location.href=path + "/Enterprise/path/retrievePassword_3"
		}else if(null ==test || ""==test){
			alert("请输入验证码");
		}else if (test != scode){
			alert("验证码错误");
		}
	});
	//设置新密码页面的下一步按钮
	$("#bu5").click(function () {
		var newPwd = $("#newPwd").val();
		var newPwd2 = $("#newPwd2").val();
		var retrieveName = $("#retrieveName").val();
		$.ajax({
			url:path+"/Enterprise/updatePwd",
			async:true,
			type:"post",
			data:{"newPwd":newPwd,"retrieveName":retrieveName},
			datatype:"text",
			beforeSend:function () {
				if (null==newPwd||"" == newPwd) {
					alert("新密码不能为空");
					return false;
				}
				if (null==newPwd2||"" === newPwd2) {
					alert("确认密码不能为空");
					return false;
				}
				if (newPwd != newPwd2) {
					alert("两次输入密码不一致");
					return false;
				}
			}, success:function (msg) {
				if (msg == "1111") {
					alert("修改成功");
					location.href=path + "/Enterprise/path/retrievePassword_4";
				}else {
					alert("网络繁忙！");
				}
			}
			,error:function () {
				alert("网络繁忙！");
			}
		});

	});

	$("#sendMsg").click(function () {
		var tel = $("#tel").val();
		$.ajax({
			url:path+"/Enterprise/sendMsg",
			async:true,
			type:"post",
			data:{"tel":tel},
			datatype:"text",
            success:function (msg) {
				scode = msg;
            }
			,error:function () {
				alert("网络繁忙！");
			}
		});

	});
	$("#bu1").click(function () {
		var code = document.getElementById("bu1");
		code.src = path + "/Enterprise/CodeServlet?"+Math.random();

	});
	$("#bu2").click(function () {
		var code = document.getElementById("bu1");
		code.src = path + "/Enterprise/CodeServlet?"+Math.random();
	});

});
var countdown=60;        //初始值
var scode = "";
function settime(val) {
	if (countdown == 0) {
		val.removeAttribute("disabled");
		val.innerHTML="获取验证码";
		countdown = 60;
		scode = "";
		return false;
	} else {
		val.setAttribute("disabled", true);
		val.innerHTML="重新发送(" + countdown + ")";
		countdown--;
	}
	setTimeout(function() {   //设置一个定时器，每秒刷新一次
		settime(val);
	},1000);
};