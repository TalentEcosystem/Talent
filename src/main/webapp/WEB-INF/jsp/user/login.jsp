<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/3/9
  Time: 19:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
	<title>登录页面</title>
	<%
		String path=request.getContextPath();
	%>
	<link rel="stylesheet" href=<%=path+"/js/layui/css/layui.css"%>>
	<script src=<%=path+"/js/layui/layui.js" %>></script>
	<script src=<%=path+"/js/jquery-3.4.1.js" %>></script>
	<link rel="stylesheet" href=<%=path+"/css/login.css" %>>
	<script type="text/javascript" src=<%=path+"/js/front/login.js" %>></script>
</head>
<body>
<input type="hidden" id="path" value="<%=path%>">
<div class="header">
	<div class="mainwarp">
		<div class="logo"><a href="${pageContext.request.contextPath}/HomePage/index"><img src=<%=path+"/images/log.png" %>/></a></div>
		<div class="welcome">欢迎登录</div>
		<div class="headerright">
			<a href=<%=path+"/Enterprise/path/EnterpriseRegister"%>>企业登录</a>
			<span>|</span>
			<a href="${pageContext.request.contextPath}/HomePage/index">返回首页</a>
		</div>
	</div>
</div>
<div class="content">
	<div class="logtype"></div>
	<div class="clear"></div>
	<div class="logoDiv">
		<div class="logoLeft">
			<div class="leftimg">
				<img src=<%=path+"/images/log1.gif" %> />
			</div>
		</div>
		<div class="logoRight">
			<div class="normalLogin">
				<div class="username">
					<span></span>
					<input id="uaccount" type="text" placeholder="请输入用户名"/>
				</div>
				<div class="password">
					<span></span>
					<input id="upassword" type="password" placeholder="请输入密码"/>
				</div>
				<div class="password">
					<span></span>
					<input id="code" type="text" placeholder="请输入验证码"/>
				</div>
				<div class="autoLogo">
					<img id="bu2" src=<%=path+"/user/loginCode" %> >
					<a id="bu1" class="pasd">看不清，换一张</a>
				</div>
				<div class="autoLogo">
					<a href=<%=path+"/user/rpassword" %> class="pasd">忘记密码？</a>
				</div>
				<div class="autoLogo">
					<span class="CheckBox Yes"></span>
					<span>我已阅读并接受<a href=<%=path+"/user/registeragreement" %>>用户协议</a></span>
				</div>
				<div class="logobtn">
					<a id="but1">登  录</a>
				</div>
				<div class="zcbtn">
					<a href=<%=path+"/user/registered" %>>还没有账号？立即注册</a>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="clear"></div>
<div class="footer">
	<p><a href="">**人才</a>旗下<img src=<%=path+"/images/logo_foot.gif" %> />蝶飞人才网版权所有 <a href="">京ICP证0******9号</a><a href=""></a>本网站所有招聘信息，未经书面授权不得转载 投诉电话：400-8**-****</p>
</div>
</body>
</html>
