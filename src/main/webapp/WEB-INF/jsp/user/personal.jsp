<%--
  Created by IntelliJ IDEA.
  User: Minzg
  Date: 2020/4/13
  Time: 16:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>个人中心-个人信息</title>
	<%
		String path=request.getContextPath();
		String uname = (String) session.getAttribute("uname");
		String uaccount = (String) session.getAttribute("uaccount");
		String utel = (String) session.getAttribute("utel");
		String phone = utel.substring(0,3)+"****"+utel.substring(7,11);
		String uaddress = (String) session.getAttribute("uaddress");
		String uhead = (String) session.getAttribute("uhead");
		String usex = (String) session.getAttribute("usex");
		String uage = (String) session.getAttribute("uage");
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
		<div class="Account">
			<div class="Left">
				<div class="Info">
					<font>[28421947]</font>
					<input type="button">
					<div id="InfoPopup">
						<ul>
							<li><a href="personal_updatepsd.html">修改密码</a></li>
							<li><a href="personal_updatenum.html">修改手机</a></li>
							<li><a href="personal_renzheng.html">修改邮箱</a></li>
							<li><a href="index.html">退出</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="Left">
				<a class="Mobile" href="">手机版</a>
			</div>
			<div class="Left">
				<div class="Weixin">微信
					<div id="WeixinPopup">
						<img src=<%=path+"/images/showqrcode.jpg" %> width="120" height="120">
						<p>扫一扫完成绑定<br>求职信息接收及时，<br>不再错过好工作！</p>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
<div class="navTop">
	<div class="navTopmain">
		<div class="logo"><a href="index.html"><img src=<%=path+"/images/logo_1.png" %>/><img src=<%=path+"/images/logo_2.png" %> /></a></div>
		<div class="nav">
			<div class="navItem"><a href=<%=path+"/user/index" %>>首页</a></div>
			<div class="navItem"><a href="searchJob.html">职位搜索</a></div>
			<div class="navItem"><a href="meetingJob.html">招聘会</a></div>
			<div class="navItem"><a href="">政府招考</a></div>
			<div class="navItem"><a href="">校园招聘</a></div>
			<div class="navItem other">
				<div style="position:relative;">
					<span>更多</span>
					<div id="TopNavMorePopup">
						<ul>
							<li><a href="jobnews.html">就业资讯</a></li>
							<li><a href="download.html">文档下载</a></li>
							<li><a href="helpJob.html">求职互助</a></li>
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
		<div class="navLeftBottom">
			<span class="sys">扫一扫绑定微信</span><br />
			<img src=<%=path+"/images/showqrcode.jpg" %> />
			<span class="Notice">蝶飞人才网<br>找工作更靠谱</span>
		</div>
	</div>
	<div class="perRightcon">
		<div class="perRpart1">
			<div class="perRpart1_l">
				<img src=<%=path+"/"+uhead%> width="80" height="100" />
			</div>
			<div class="perRpart1_r">
				<div class="PaName"><%=uname%></div>
				<div class="clear"></div>
				<div class="PaCon">
					<span class="span1">用户名：<%=uaccount%>  <a href=<%=path+"/user/updatepsd" %> class="a2">修改密码</a></span>
					<span class="span3">手机号：<%=phone%>  <a href=<%=path+"/user/updatenum" %> class="a2">修改</a></span>
				</div>
		</div>
		<div class="clear"></div>
	</div>
		<div class="layui-upload">
		<button type="button" class="layui-btn" id="chooseFile">
			<i class="layui-icon" >&#xe67c;</i>上传头像
		</button>
		<button type="button" class="layui-btn" id="save"><i class="layui-icon">&#x1005;</i>保存头像</button>
		</div>
		<form class="layui-form" action="">
		<div class="layui-form-item">
			<label class="layui-form-label">昵称</label>
			<div class="layui-input-block">
				<input type="text" id="uname" name="uname" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input" value="<%=uname%>">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">性别</label>
			<div class="layui-input-block">
				<c:set var="salary" scope="session" value="<%=usex%>"/>
				<input type="radio" class="usex" name="usex" value="男" title="男" <c:if test="${salary=='男'}">checked="checked"</c:if>>
				<input type="radio" class="usex" name="usex" value="女" title="女" <c:if test="${salary=='女'}">checked="checked"</c:if>>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">年龄</label>
			<div class="layui-input-block">
				<input type="text" id="uage" name="uage" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input" value="<%=uage%>">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">通讯地址</label>
			<div class="layui-input-block">
				<input type="text" id="uaddress" name="uaddress" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input" value="<%=uaddress%>">
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class="layui-btn" lay-submit lay-filter="formDemo">保存</button>
			</div>
		</div>
		</form>
	</div>
		<div class="adBox" >
			<img style="margin-left: 15px;margin-top: 10px" src=<%=path+"/images/perAD.jpg" %> width="814" />
		</div>
	</div>
<div class="clear"></div>
<div class="footer">
	<p><a href="">**人才</a>旗下<img src=<%=path+"/images/logo_foot.gif" %> />蝶飞人才网版权所有 <a href="">京ICP证0******9号</a><a href=""></a>本网站所有招聘信息，未经书面授权不得转载 投诉电话：400-8**-****</p>
</div>
<script>
	//JavaScript代码区域
	layui.use(['upload', 'form'], function(){
		var form = layui.form;
		var layer=layui.layer;
		form.render();
		var upload = layui.upload;
		var path = $("#path").val();
		//监听提交
		form.on('submit(formDemo)', function(data){
			var path = $("#path").val();
			var userTAT =JSON.stringify(data.field);
			$.ajax({
				url: path + "/user/updatePersonal",
				async: true,
				type: "post",
				data: "userTAT="+userTAT,
				datatype: "text",
				beforeSend:function () {
					var uname = $("#uname").val();
					var uage = $("#uage").val();
					var uaddress = $("#uaddress").val();
					var number = /^\d{1,3}$/;
					var number2 = /^.{0,30}$/;
					if (null==uname||"" == uname) {
						layer.alert("昵称不能为空！", {icon: 2});
						return false;
					}
					if (null==uage||"" === uage) {
						layer.alert("年龄不能为空！", {icon: 2});
						return false;
					}else if (!number.test(uage)){
						layer.alert("请输入1-3位数字！", {icon: 2});
						return false;
					}
					if (null==uaddress||"" === uaddress) {
						layer.alert("通讯地址不能为空！", {icon: 2});
						return false;
					}else if (!number2.test(uaddress)){
						layer.alert("请输入30个字符以内的通讯地址！", {icon: 2});
						return false;
					}
				},
				success: function (msg) {
					if(msg == "1111"){
						layer.alert("修改成功",{icon:6},function () {
							location.href=path+"/user/personal"
						});
					}else {
						layer.alert("修改失败！", {icon: 2});
					}
				}, error: function () {
					layer.alert("网络繁忙！", {icon: 2});
				}
			});
			return false;
		});
		//执行实例
		var uploadInst = upload.render({
			elem: '#chooseFile' //绑定元素
			, url: path + '/user/uheadUpLoad' //上传接口
			, auto: false
			, acceptMime: 'image/*'
			, multiple: true
			, accept: 'images'//设置成可以上传所有类型文件
			, bindAction: '#save'//设置按钮触发上传
			, before: function () {

			}
			, done: function (res) {
				//上传完毕回调
				if (res.code == 0) {
					layer.alert("上传成功！", {icon: 6}, function () {
						window.parent.location.reload();
					});
				} else if (res.code == 1) {
					layer.alert("上传失败！", {icon: 2});
				} else if (res.code == 3) {
					layer.alert("文件为空！", {icon: 2});
				}
			}
			, error: function () {
				//请求异常回调
				layer.alert("上传失败！", {icon: 2});
			}
		})
	});
</script>
</body>
</html>
