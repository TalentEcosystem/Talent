<%--
  Created by IntelliJ IDEA.
  User: Minzg
  Date: 2020/4/14
  Time: 15:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>个人中心-修改手机号</title>
	<%
		String path=request.getContextPath();
		String utel = (String) session.getAttribute("utel");
		String phone = utel.substring(0,3)+"****"+utel.substring(7,11);
	%>
	<link rel="stylesheet" href=<%=path+"/js/layui/css/layui.css"%>>
	<link rel="stylesheet" href=<%=path+"/css/personal.css"%>>
	<script src=<%=path+"/js/jquery-3.4.1.js" %>></script>
	<script type="text/javascript" src=<%=path+"/js/front/personals.js" %>></script>
	<script src=<%=path+"/js/layui/layui.js" %>></script>
</head>
<body>
<input type="hidden" id="path" value="<%=path%>">
<div class="header">
	<div class="headerMain">
		<div class="Notice">
			<span>公告：</span>
			<a href="">有实力就不怕平庸 如何离高薪更进一步</a>
		</div>
	</div>
</div>
<div class="navTop">
	<div class="navTopmain">
		<div class="logo"><a href="index.html"><img src=<%=path+"/images/logo_1.png" %>/><img src=<%=path+"/images/logo_2.png" %> /></a></div>
		<div class="nav">
			<div class="navItem"><a href=<%=path+"/user/index" %>>首页</a></div>
			<div class="navItem"><a href=<%=path+"/HomePage/searchJob" %>>职位搜索</a></div>
			<div class="navItem"><a href="">招聘会</a></div>
			<div class="navItem"><a href="">政府招考</a></div>
			<div class="navItem"><a href="">校园招聘</a></div>
			<div class="navItem other">
				<div style="position:relative;">
					<span>更多</span>
					<div id="TopNavMorePopup">
						<ul>
							<li><a href="">敬请期待</a></li>
							<li><a href="">敬请期待</a></li>
							<li><a href="">敬请期待</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="personalBody">
	<div class="perLeftnav">
		<div class="NavLeftTop">个人中心</div>
		<div class="NavLeftMain">
			<div class="NavLeftBox active">
				<a href=<%=path+"/user/personal" %> class="a7">个人信息</a>
			</div>
			<div class="NavLeftBox">
				<a href=<%=path+"/school/findUserResume" %> class="a2">我的简历</a>
			</div>
			<div class="NavLeftBox">
				<a href=<%=path+"/user/study"%> class="a3">学习记录</a>
			</div>
			<div class="NavLeftBox">
				<a href=<%=path+"/user/collection" %> class="a5">我的收藏</a>
			</div>
			<div class="NavLeftBox">
				<a href=<%=path+"/user/requestFeedback" %> class="a6">求职反馈</a>
			</div>
			<div class="NavLeftBox">
				<a href=<%=path+"/user/help" %> class="a8">帮助中心</a>
			</div>
		</div>
	</div>
	<div class="perRightcon">
		<div class="commonTit">
			<h1>用户管理</h1>
		</div>
		<div class="TopNotice">
			<span>修改手机号</span>
		</div>
		<div class="AccountMain">
			<div class="Steps">
				<div class="Step Step1 Active" style="width:50%">
					<span class="StepNo">1</span>
					<span class="StepName">确认手机号</span>
				</div>
				<div class="Step Step3" style="width:50%">
					<span class="StepNo"></span>
					<span class="StepName">完成</span>
				</div>
			</div>
			<div class="clear"></div>
			<div class="CertifInfo">
				<p class="phone0">您的手机号：<%=phone%></p>
				<div class="CerInput0">
					<span>新的手机号：</span>
					<input id="phoneNum" type="text" value=""/>
				</div>
				<div class="clear"></div>
				<div class="CerInput">
					<span>验证码：</span>
					<input id="test" type="text" />
					<button id="hqbtn" class="hqbtn" onclick="settime(this)">发送验证码</button>
				</div>
				<div class="clear"></div>
				<div class="emailrz">
					<a id="sure">确定</a>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="clear"></div>
<div class="footer">
	<p><a href="">**人才</a>旗下<img src=<%=path+"/images/logo_foot.gif" %> />蝶飞人才网版权所有 <a href="">京ICP证0******9号</a><a href=""></a>本网站所有招聘信息，未经书面授权不得转载 投诉电话：400-8**-****</p>
</div>
<script>
 layui.use(['layer'], function () {
	 var path = $("#path").val();
    $("#hqbtn").click(function () {
			var phoneNum = $("#phoneNum").val();
			$.ajax({
				url:path+"/user/sendMsg",
				async:true,
				type:"post",
				data:{"utel":phoneNum},
				datatype:"text",
				success:function (msg) {
					scode = msg;
				}
				,error:function () {
					layer.alert("网络繁忙",{icon:2});
				}
			});
		});

		$("#sure").click(function () {
			var test = $("#test").val();
			var phoneNum = $("#phoneNum").val();
			if (test!=scode) {
				layer.alert("验证码错误",{icon:2});
			}else {
				$.ajax({
					url:path+"/user/updatePhone",
					async:true,
					type:"post",
					data:{"utel":phoneNum},
					datatype:"text",
					success:function (msg) {
						if (msg=="1111"){
							location.href=path + "/user/updateComplete";
						}else {
							layer.alert("修改失败!",{icon:2});
						}
					}
					,error:function () {
						layer.alert("网络繁忙!",{icon:2});
					}
				});
			}
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
</script>
</body>
</html>
