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
	<link rel="stylesheet" href=<%=path+"/css/login.css" %>>
	<script type="text/javascript" src=<%=path+"/js/front/login.js" %>></script>

	<script>
		//Demo
		// layui.use('form', function(){
		// 	var form = layui.form;
		//
		// 	//监听提交
		// 	form.on('submit(formDemo)', function(data){
		// 		layer.msg(JSON.stringify(data.field));
		// 		return false;
		// 	});
		// });

		function reg() {
			var path=$("#path").val();
			location.href=path+"/jsp/reg.jsp";
		}

		function login() {
			var account=$("#uaccount").val();
			var password=$("#upassword").val();
			var path=$("#path").val();
			if(""!=account&&null!=account&&""!=password&&null!=password){
				$.ajax({
						url: path+"/user/loginAjax",
						type: "POST",
						data: {"uaccount":account,"upassword":password},
						datatype: "text",
						success: function (msg) {
							if (msg == "success") {
								alert("登录成功");
								location.href = "${pageContext.request.contextPath}/Enterprise/path/EnterpriseManager";
							} else{
								alert("账号密码错误");
							}
						},
						error: function () {
							alert("网络繁忙！")
						}
					}
				);
			}else{
				alert("账号密码不能为空")
			}
		}
	</script>
	<style>
		.layui-form{
			margin-left: 550px;
			margin-top: 100px;
		}
	</style>
>>>>>>> 36c6a6bec3525d376f32111364ad016966cb8f1e
</head>
<body>
<input type="hidden" id="path" value="<%=path%>">
<div class="header">
	<div class="mainwarp">
		<div class="logo"><a href="index.html"><img src=<%=path+"/images/log.png" %>/></a></div>
		<div class="welcome">欢迎登录</div>
		<div class="headerright">
			<a href="loginCompany.html">企业登录</a>
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
			<div class="leftcon">
				<a href="" class="a1">手机触屏版 m.diefeirencai.com</a>
				<a href="" class="a2">Android客户端下载</a>
				<a href="" class="a3">iPhone客户端下载</a>
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
<%--					<span class="CheckBox"></span>--%>
<%--					<span>七天内自动登录</span>--%>
					<a href="password.html" class="pasd">忘记密码？</a>
				</div>
				<div class="autoLogo">
					<span class="CheckBox Yes"></span>
					<span>我已阅读并接受<a href=<%=path+"/user/registeragreement" %>>用户协议</a></span>
				</div>
				<div class="logobtn">
					<a id="but1">登  录</a>
				</div>
				<div class="zcbtn">
					<a href="zhuce.html">还没有账号？立即注册</a>
				</div>
<%--				<div class="thirdLogin">--%>
<%--					<span>使用其他账号登录：</span>--%>
<%--					<div class="third">--%>
<%--						<div class="third_con third_1">QQ</div>--%>
<%--						<div class="third_con third_2">微博</div>--%>
<%--						<div class="third_con third_3">百度</div>--%>
<%--					</div>--%>
<%--				</div>--%>
			</div>
			<div class="weixinLogin">
				<div class="weixinQr">
					<img src=<%=path+"/images/showqrcode.jpg" %> width="150" class="useHelpcon"/>
					<p>使用微信扫描上方二维码</p>
					<p class="useHelp useHelpcon">使用帮助</p>
				</div>
				<div class="zcbtn">
					<a href="zhuce.html">还没有账号？立即注册</a>
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
</html>
