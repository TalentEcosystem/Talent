<%--
  Created by IntelliJ IDEA.
  User: Minzg
  Date: 2020/4/10
  Time: 17:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>忘记密码-完成</title>
	<%
		String path=request.getContextPath();
	%>
	<script src=<%=path+"/js/jquery-3.4.1.js" %>></script>
	<link rel="stylesheet" href=<%=path+"/css/login.css" %>>
	<script type="text/javascript" src=<%=path+"/Enterprise/js/retrievePassword.js" %>></script>
</head>
<body>
<input type="hidden" id="path" value="<%=path%>">
<div class="header">
	<div class="mainwarp">
		<div class="logo"><a href=<%=path+"/user/index" %>><img src=<%=path+"/images/log.png" %> /></a></div>
		<div class="welcome">重置密码</div>
		<div class="headerright">
			<a href=<%=path+"/Enterprise/path/EnterpriseLogin" %>>后台登录 </a>
			<span>|</span>
			<a href="zhuceCompany.html">企业注册 </a>
			<span>|</span>
			<a href=<%=path+"/user/index" %>>返回首页</a>
		</div>
	</div>
</div>
<div class="passdBox">
	<div class="passpart1">
		<div class="TitleNotice">忘记密码了？根据收到的短信验证码进行验证身份，通过验证后重置密码，您就可以登录了。</div>
		<div class="StepsBox">
			<div class="Step Active stepfirst">
				<span class="StepNo">1</span>
				<span class="StepName">确认账户</span>
			</div>
			<div class="Step Active">
				<span class="StepNo">2</span>
				<span class="StepName">安全认证</span>
			</div>
			<div class="Step Active">
				<span class="StepNo">3</span>
				<span class="StepName">重置密码</span>
			</div>
			<div class="Step steplast Active">
				<span class="StepNo"></span>
				<span class="StepName">完成</span>
			</div>
		</div>
		<div class="clear"></div>
		<div class="restInfo2">
			<div class="SucTitle">恭喜您，您的密码设置成功！</div>
			<p>您的用户名是：HEB5_14@your_email.com</p>
			<p>您可以使用新密码登录人才网<a href=<%=path+"/Enterprise/path/EnterpriseLogin" %>>立即登录</a></p>
		</div>
	</div>
</div>
<div class="clear"></div>
<div class="footer">
	<p><a href="">**人才</a>旗下<img src=<%=path+"/images/logo_foot.gif" %> />蝶飞人才网版权所有 <a href="">京ICP证0******9号</a><a href=""></a>本网站所有招聘信息，未经书面授权不得转载 投诉电话：400-8**-****</p>
</div>
</body>
</html>
