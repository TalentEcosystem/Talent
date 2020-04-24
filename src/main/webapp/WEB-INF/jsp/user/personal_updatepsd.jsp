<%--
  Created by IntelliJ IDEA.
  User: Minzg
  Date: 2020/4/14
  Time: 10:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>个人中心-修改密码</title>
	<%
		String path=request.getContextPath();
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
			<span>修改密码</span>
		</div>
		<div class="AccountMain">
			<div class="updatePsd">
				<div class="boxDiv">
					<span class="nametxt">原密码：</span>
					<input id="upsd" type="password"/>
				</div>
				<div class="boxDiv">
					<span class="nametxt">新密码：</span>
					<input id="cpsd" type="password"/>
					<span class="SpNotice">请输入6-20个字符</span>
				</div>
				<div class="boxDiv">
					<span class="nametxt">确认新密码：</span>
					<input id="epsd" type="password"/>
				</div>
				<div class="boxDiv">
					<a id="updateBtn" class="updateBtn">确认修改</a>
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
	$(function () {
		$("#updateBtn").click(function () {
			var path = $("#path").val();
			var upsd = $("#upsd").val();//原密码
			var cpsd = $("#cpsd").val();//新密码
			var epsd = $("#epsd").val();//确认新密码
			$.ajax({
				url:path+"/user/updatePsd",
				async:true,
				type:"post",
				data:{"upsd":upsd,"cpsd":cpsd},
				datatype:"text",
				beforeSend:function () {
					if (null==upsd||"" == upsd) {
						layer.alert("原密码不能为空",{icon:2});
						return false;
					}
					if (null==cpsd||"" === cpsd) {
						layer.alert("新密码不能为空",{icon:2});
						return false;
					}
					if (epsd != cpsd) {
						layer.alert("两次输入的新密码不一致",{icon:2});
						return false;
					}
				}, success:function(msg)
				{
					if(msg === "1111")
					{
						layer.alert("密码修改成功！",{icon:6},function () {
							location.href=path+"/user/personal";
						});
					}else if (msg === "error"){
						layer.alert("密码修改失败！",{icon:2});
					} else if (msg === "upsdError"){
						layer.alert("原密码错误！",{icon:2});
					}
				}, error: function () {
					layer.alert("网络繁忙！",{icon:2});
				}
			})
		});
	})
 });
</script>
</body>
</html>