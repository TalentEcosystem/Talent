<%--
  Created by IntelliJ IDEA.
  User: Minzg
  Date: 2020/4/8
  Time: 20:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>注册</title>
	<%
		String path=request.getContextPath();
	%>
	<script src=<%=path+"/js/jquery-3.4.1.js" %>></script>
	<link rel="stylesheet" href=<%=path+"/css/login.css" %>>
	<script type="text/javascript" src=<%=path+"/js/front/userRegistered.js" %>></script>
<body style="background:#fff">
<input type="hidden" id="path" value="<%=path%>">
<div class="headerCom">
	<div class="mainwarp">
		<div class="logo"><a href="index.html"><img src=<%=path+"/images/log.png" %> /></a></div>
		<div class="welcome">会员中心</div>
		<div class="headerright">
			<div class="r1">手机触屏版<a href="">m.diefeirencai.com</a></div>
			<div class="r2"><a href="">Android客户端下载</a></div>
			<div class="r3"><a href=<%=path+"/user/login" %>>用户登录</a></div>
			<div class="r4"><a href="index.html">返回首页</a></div>
		</div>
	</div>
</div>
<div class="CpRegister">
	<div class="mainwarp">
		<div class="regist1">
			<div class="registL">
				<span>注册会员</span>
				<p>专业人才招聘网站</p>
			</div>
			<div class="registR">
				<img src=<%=path+"/images/log1.jpg" %> width="516" height="177"/>
			</div>
			<div class="clear"></div>
		</div>
		<div class="regist2">
			<div class="registdiv">
				<div class="registtxt"><span>*</span>用 户 名</div>
				<div class="registinput"><input id="username" type="text" value="" style="height: 34px;"/></div>
				<div class="registsub"><span id="usernameText"></span></div>
				<div class="clear"></div>
			</div>
			<div class="registdiv">
				<div class="registtxt"><span>*</span>密   码</div>
				<div class="registinput"><input id="upassword" type="password" value="" style="height: 34px;"/></div>
				<div class="registsub"><span id="upasswordText"></span></div>
				<div class="clear"></div>
			</div>
			<div class="registdiv">
				<div class="registtxt"><span>*</span>确认密码</div>
				<div class="registinput"><input id="cpassword" type="password" value="" style="height: 34px;"/></div>
				<div class="registsub"><span id="cpasswordText"></span></div>
				<div class="clear"></div>
			</div>
			<div class="registdiv">
				<div class="registtxt"><span>*</span>性别</div>
				<div class="registinput">
					<select id="sex" STYLE="float:left;width: 80px;height: 34px;padding: 10px 5px;border: 1px #CCCCCC solid;font-size: 10px;">
						<option>男</option>
						<option>女</option>
					</select>
				</div>
				<div class="clear"></div>
			</div>
			<div class="registdiv">
				<div class="registtxt"><span>*</span>年龄</div>
				<div class="registinput"><input id="uage" type="text"  value="" style="height: 34px;"/></div>
				<div class="registsub" style="padding-top:9px"><span id="uageText"></span></div>
				<div class="clear"></div>
			</div>
			<div class="registdiv">
				<div class="registtxt"><span>*</span>手 机 号</div>
				<div class="registinput"><input id="uphone" type="text" value="" style="height: 34px;"/></div>
				<div class="registsub"><span id="uphoneText"></span></div>
				<div class="clear"></div>
			</div>
			<div class="registdiv">
				<div class="registtxt">通讯地址</div>
				<div class="registinput"><input id="uaddress" type="text" value="" style="height: 34px;"/></div>
				<div class="registsub"><span id="uaddressText"></span></div>
				<div class="clear"></div>
			</div>
			<div class="registdiv0">
				<input id="protocol" type="checkbox" checked="checked" value="同意用户协议" /><span>我已阅读并接受<a id="aaa" href=<%=path+"/user/registeragreement" %>>用户协议</a></span>
			</div>
			<div class="registdivbtn">
				<input id="bu1" type="button"/>
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
