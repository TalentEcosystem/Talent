$(function () {

    $("#bu1").click(function () {
    	var path = $("#path").val();
    	var uaccount = $("#username").val();
	    var upassword = $("#upassword").val();
	    var usex = $("#sex").val();
	    var uage = $("#uage").val();
	    var utel = $("#uphone").val();
	    var uaddress = $("#uaddress").val();
	    var User ={"uaccount":uaccount,"upassword":upassword,"usex":usex,"uage":uage,"utel":utel,"uaddress":uaddress};
	    User = JSON.stringify(User);
	    $.ajax({
		    url:path+"/user/userReg",
		    async:true,
		    type:"post",
		    data:"User="+User,
		    datatype:"text",
		    beforeSend:function () {
			    var cpassword = $("#cpassword").val();
			    var number = /^\d{1,3}$/;
			    var number1 = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
			    var number2 = /^.{0,30}$/;
			    if (null==uaccount||"" == uaccount) {
				    $("#usernameText").html("用户名不能为空");
				    return false;
			    }
			    if (null==upassword||"" === upassword) {
				    $("#upasswordText").html("密码不能为空");
				    return false;
			    }
			    if (upassword != cpassword) {
				    $("#cpasswordText").html("与密码不一致");
				    return false;
			    }else if (null==cpassword||"" === cpassword) {
				    $("#cpasswordText").html("确认密码不能为空");
				    return false;
			    }
			    if (null==uage||"" === uage) {
				    $("#uageText").html("年龄不能为空");
				    return false;
			    }else if (!number.test(uage)){
				    $("#uageText").html("请输入1-3位的数字");
				    return false;
			    }
			    if (null==utel||"" === utel) {
				    $("#uphoneText").html("手机号不能为空");
				    return false;
			    }else if (!number1.test(utel)){
				    $("#uphoneText").html("请输入正确格式的手机号");
				    return false;
			    }
			    if (null==uaddress||"" === uaddress) {
				    $("#uaddressText").html("通讯地址不能为空");
				    return false;
			    }else if (!number2.test(uaddress)){
				    $("#uaddressText").html("请输入30个字符以内的通讯地址");
				    return false;
			    }
		    },
		    success:function(msg)
		    {
			    if(msg === "1111"){
				    alert("注册成功！");
				    location.href=path+"/user/login";
			    }else if (msg === "error"){
				    alert("网络繁忙！")
			    } else if (msg === "UserAlreadyExists"){
				    alert("用户名已存在")
			    }
		    }, error: function () {
			    alert("网络繁忙！");
		    }
	    })
	});
    //用户名
	//设置获得焦点事件
	$("#username").focus(function () {
		$("#usernameText").html("请输入用户名");
	});
	//设置失去焦点事件
	$("#username").blur(function () {
		var username = $("#username").val();
		if ("" === username) {
			$("#usernameText").html("用户名不能为空");
		}else {
			$("#usernameText").html("");
		}
	});

    //密码
	//设置获得焦点事件
	$("#upassword").focus(function () {
		$("#upasswordText").html("请输入密码");
	});
	//设置失去焦点事件
	$("#upassword").blur(function () {
		var upassword = $("#upassword").val();
		if ("" === upassword) {
			$("#upasswordText").html("密码不能为空");
		}else {
			$("#upasswordText").html("");
		}
	});

    //确认密码
	//设置获得焦点事件
	$("#cpassword").focus(function () {
		$("#cpasswordText").html("请再次输入密码");
	});
	//设置失去焦点事件
	$("#cpassword").blur(function () {
		var cpassword = $("#cpassword").val();
		var upassword = $("#upassword").val();
		if (upassword != cpassword) {
			$("#cpasswordText").html("与密码不一致");
		}else {
			$("#cpasswordText").html("");
		}
	});

    //年龄
	//设置获得焦点事件
	$("#uage").focus(function () {
		$("#uageText").html("请输入年龄");
	});
	//设置失去焦点事件
	$("#uage").blur(function () {
		var uage = $("#uage").val();
		var number = /^\d{1,3}$/;
		if ("" === uage) {
			$("#uageText").html("年龄不能为空");
		}else if (!number.test(uage)){
			$("#uageText").html("请输入1-3位的数字");
	    }else {
			$("#uageText").html("");
		}
	});

    //手机号
	//设置获得焦点事件
	$("#uphone").focus(function () {
		$("#uphoneText").html("请输入手机号");
	});
	//设置失去焦点事件
	$("#uphone").blur(function () {
		var uphone = $("#uphone").val();
		var number = /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])\d{8}$/;
		if ("" === uphone) {
			$("#uphoneText").html("手机号不能为空");
		}else if (!number.test(uphone)){
			$("#uphoneText").html("请输入正确格式的手机号");
		}else {
			$("#uphoneText").html("");
		}
	});

	//通讯地址
	//设置获得焦点事件
	$("#uaddress").focus(function () {
		$("#uaddressText").html("请输入通讯地址");
	});
	//设置失去焦点事件
	$("#uaddress").blur(function () {
		var uaddress = $("#uaddress").val();
		var number = /^.{0,30}$/;
		if ("" === uaddress) {
			$("#uaddressText").html("通讯地址不能为空");
		}else if (!number.test(uaddress)){
			$("#uaddressText").html("请输入30个字符以内的通讯地址");
		}else {
			$("#uaddressText").html("");
		}
	});

	$("#protocol").click(function () {
		var checkbox = document.getElementById("protocol");//选中checkbox的id；
		if(checkbox.checked==true){//按钮已选中
			$("#bu1").attr("disabled", false);
		}else{
			$("#bu1").attr("disabled", true);
		}
	});
});
