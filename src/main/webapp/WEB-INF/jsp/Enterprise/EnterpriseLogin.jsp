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
	<script src=<%=path+"/js/jquery-3.4.1.js" %>></script>
	<link rel="stylesheet" href=<%=path+"/css/Logins.css" %>>
	<link rel="stylesheet" href=<%=path+"/js/layui/css/layui.css" %>>
	<script charset="UTF-8" src="<%=path+"/js/layui/layui.js"%>"></script>
</head>
<body>
<input type="hidden" id="path" value="<%=path%>">
<div class="header">
	<div class="mainwarp">
		<div class="logo"><a href="index.html"><img src=<%=path+"/images/log.png" %>/></a></div>
		<div class="welcome">欢迎登录</div>
		<div class="headerright">
			<a href="${pageContext.request.contextPath}/user/login">用户登录</a>
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
				<form class="layui-form">
				<div class="username">
					<span></span>
					<input id="account"  type="text" name="account"
						   lay-verType="tips" lay-verify="required" autocomplete="off" value="" placeholder="请输入账号">
				</div>
				<div class="password">
					<span></span>
					<input id="password"  type="password" name="password"
						   lay-verType="tips"  lay-verify="required" autocomplete="off" value="" placeholder="输入密码">
				</div>
				<div class="password">
					<span></span>
					<input id="code" name="code" type="text" placeholder="请输入验证码"
						   lay-verType="tips" lay-verify="required" autocomplete="off" value="" placeholder="输入验证码">
				</div>
				<div class="autoLogo">
					<img title="点击切换验证码" type="button" class="codeInput"
						 src=<%=path+"/Enterprise/CodeServlet"%> id="verifyCode">
				</div>
				<div class="autoLogo">
	            <a href=<%=path+"/Enterprise/path/retrievePassword_1"%>>忘记密码？点击找回</a>
				</div>
				<div class="logobtn">
					<button id="submitLogin" type="submit" class="layui-btn" lay-submit style="margin-top: 10px;width: 288px;height: 42px;font-size: 20px;border-radius: 4px;line-height: 42px; text-align:center"
							lay-filter="login">登录
					</button>
				</div>
				<div class="zcbtn">
					<a href=<%=path+"/Enterprise/path/EnterpriseRegister"%>>若没有账号？点击注册</a>
				</div>
				</form>
			</div>
			<div class="weixinLogin">
				<div class="weixinQr">
					<img src=<%=path+"/images/showqrcode.jpg" %> width="150" class="useHelpcon"/>
					<p>使用微信扫描上方二维码</p>
					<p class="useHelp useHelpcon">使用帮助</p>
				</div>
				<div class="zcbtn">
				<a href=<%=path+"/Enterprise/path/EnterpriseRegister"%>>若没有账号？点击注册</a>
				</div>
				<img src=<%=path+"/images/log16.png" %> class="usehelpimg"/>
			</div>
		</div>
	</div>
</div>

<div class="clear"></div>
<div class="footer">
	<p><a href="">**人才</a>旗下<img src=<%=path+"/images/logo_foot.gif" %> />蝶飞人才网版权所有 <a href="">京ICP证0******9号</a><a href=""></a>本网站所有招聘信息，未经书面授权不得转载 投诉电话：400-8**-****</p>
</div>
</body>
<%-- 登录js   --%>
<script type="text/javascript">
	var path = $("#path").val();
	$('#verifyCode').on('click', function () {
		$('#verifyCode').attr('src', path + '/Enterprise/CodeServlet?' + Math.random());
	})

	layui.use(['jquery', 'form', 'layer'], function () {
		var $ = layui.jquery
				, form = layui.form
				, layer = layui.layer;

		form.on('submit(login)',function (data) {
			$.ajax({
				type: "POST",
				url:  path + "/Enterprise/adminLogin",
				dataType: "text",
				data: data.field,
				success: function (msg){
					console.log(msg);
					if (msg == 'success'){
						layer.msg('<a style =color:black >登录成功</a>', {icon: 1});
						$("#account").val('');
						$("#password").val('');
						$("#code").val('');
						$('#verifyCode').attr('src',  path + '/Enterprise/CodeServlet?' + Math.random());
						window.location.href = path + '/Enterprise/path/EnterpriseManager';
					}else if (msg == 'noCode'){
						layer.msg('<a style =color:black >验证码不正确，请重新输入</a>', {icon: 2});
					}else if (msg == 'noAccount'){
						layer.msg('<a style =color:black >账号不存在，请重新输入</a>', {icon: 2});
					}else if(msg == "error"){
						layer.msg('<a style =color:black >密码输入不正确，请重新输入</a>', {icon: 2});
					}else if(msg == 'forbidden'){
						layer.msg('<a style =color:black >该账号已被禁用，请联系管理员</a>', {icon: 2});
					}else if(msg == 'delete'){
						layer.msg('<a style =color:black >该账号已被删除，请重新注册或联系管理员</a>', {icon: 2});
					}
					$("#code").val('');
					$('#verifyCode').attr('src',  path + '/Enterprise/CodeServlet?' + Math.random());
				},
				error:function () {
					layer.msg("服务器繁忙")
				}
			})
			return false;
		})
	})

</script>
</html>
