<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/11
  Time: 19:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
	<title>用户端的简历</title>
	<%
		String path=request.getContextPath();
	%>
	<script src=<%=path+"/js/jquery-3.4.1.js" %>></script>
	<script src=<%=path+"/js/jquery-form.js" %>></script>
	<link rel="stylesheet" href=<%=path+"/css/personal.css"%>>
	<link rel="stylesheet" href=<%=path+"/js/layui/css/layui.css" %>>
	<script type="text/javascript" src=<%=path+"/js/layui/layui.js" %>></script>
	<script type="text/javascript" src=<%=path+"/js/json2.js" %>></script>
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
			<div class="NavLeftBox">
				<a href=<%=path+"/user/personal" %> class="a7">个人信息</a>
			</div>
			<div class="NavLeftBox active">
				<a href=<%=path+"/school/findUserResume" %> class="a2">我的简历</a>
			</div>
			<div class="NavLeftBox">
				<a href=<%=path+"/user/study"%> class="a3">学习记录</a>
			</div>
			<div class="NavLeftBox">
				<a href=<%=path+"/user/collection" %> class="a5">我的收藏</a>
			</div>
			<div class="NavLeftBox twoNav">
				<a href=<%=path+"/user/requestFeedback" %> class="a6">求职反馈</a>
			</div>
			<div class="NavLeftBox">
				<a href="personal_help.html" class="a8">帮助中心</a>
			</div>
		</div>
		<div class="navLeftBottom">
			<span class="sys">扫一扫绑定微信</span><br />
			<img src=<%=path+"/images/showqrcode.jpg" %> />
			<span class="Notice">蝶飞人才网<br>找工作更靠谱</span>
		</div>
	</div>
	<div class="perRightcon">
		<div class="commonTit">
			<h1 class="fl">我的简历</h1>
		</div>
		<div class="clear"></div>
		<div style="border: 1px black solid;width: 750px;height: 100%;margin-left: 6%">
			<form action="${pageContext.request.contextPath}/school/updateResume"  id="form2" method="post"  enctype="multipart/form-data" accept-charset="UTF-8">
				<label style="float: left;margin-left: 58px;margin-top: 20px">姓名：</label><input type="text" name="resname" style="width: 120px;height: 30px;margin-left: 10px;float: left;margin-top: 16px" value="${resume.resname}" >
				<label style="float: left;margin-left: 30px;margin-top: 20px">学校名称：</label><input type="text" id="schoolname" name="schoolname" style="width: 120px;height: 30px;margin-left: 10px;float: left;margin-top: 16px" value="${resume.schoolname}" >
				<label style="clear: both;float: left;margin-left: 30px;margin-top: 10px">出生年月：</label><input type="text"  style="width: 120px;height: 30px;margin-left: 10px;float: left;margin-top: 6px" placeholder="xx年xx月" name="rebirth" value="${resume.rebirth}" >
				<label style="float: left;margin-left: 58px;margin-top: 10px">专业：</label><input type="text" style="width: 120px;height: 30px;margin-left: 10px;float: left;margin-top: 6px" name="professname" value="${resume.professname}" >
				<label style="clear: both;float: left;margin-left: 30px;margin-top: 10px">政治面貌：</label><input type="text"  style="width: 120px;height: 30px;margin-left: 10px;float: left;margin-top: 6px" name="repol" value="${resume.repol}" >
				<label style="float: left;margin-left: 58px;margin-top: 10px">学历：</label><input type="text" style="width: 120px;height: 30px;margin-left: 10px;float: left;margin-top: 6px" name="degreename" value="${resume.degreename}" >
				<label style="clear: both;float: left;margin-left: 58px;margin-top: 10px">电话：</label><input type="text"  style="width: 120px;height: 30px;margin-left: 10px;float: left;margin-top: 6px" name="retel" value="${resume.retel}" >
				<label style="float: left;margin-left: 58px;margin-top: 10px">住址：</label><input type="text" style="width: 120px;height: 30px;margin-left: 10px;float: left;margin-top: 6px" name="readdress" value="${resume.readdress}" >
				<div style="float: right;width: 140px;height: 137px;margin-right: 50px;border: 1px black solid;margin-top: -97px">
					<img src="${pageContext.request.contextPath}/${resume.repic}" name="repic" style="width: 135px;height: 80px">
					<%--			<label style="clear: both;float: left">选择图片：</label><input type="file" name="filea">--%>
				</div>
				<h2 style="clear: both;float: left;margin-left: 58px">教育背景</h2>
				<table border="1px black solid" width="500px" style="margin-top: 10px;clear: both;float: left;margin-left: 58px">
					<tr>
						<td>时间</td>
						<td>大学</td>
						<td>专业</td>
					</tr>
					<c:choose>
						<c:when test="${not empty aducationals}">
							<c:forEach items="${aducationals}" var="i">
								<tr>
									<td hidden="hidden"><input type="hidden" name="aducationid" value="${i.aducationid}"></td>
									<td><input type="text" name="adtime" value="${i.adtime}"></td>
									<td><input type="text" name="sname" value="${i.sname}"></td>
									<td><input type="text" name="profession" value="${i.profession}"></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td><input type="text" name="adtime" value="暂无"></td>
								<td><input type="text" name="sname" value="暂无"></td>
								<td><input type="text" name="profession" value="暂无"></td>
							</tr>
						</c:otherwise>
					</c:choose>
					<tr>
						<td><input type="text" name="adtime" value=""></td>
						<td><input type="text" name="sname" value=""></td>
						<td><input type="text" name="profession" value=""></td>
					</tr>
					<%--			<c:if test="${not empty aducationals}">--%>
					<%--				<c:forEach items="${aducationals}" var="i">--%>
					<%--					<tr>--%>
					<%--						<td><input type="text" value="${i.adtime}"></td>--%>
					<%--						<td><input type="text" value="${i.schoolname}"></td>--%>
					<%--						<td><input type="text" value="${i.profession}"></td>--%>
					<%--					</tr>--%>
					<%--				</c:forEach>--%>
					<%--			</c:if>--%>
				</table>
				<h2 style="clear: both;float: left;margin-left: 58px">社会经历</h2>
				<table border="1px black solid" width="500px" style="margin-top: 10px;clear: both;float: left;margin-left: 58px">
					<tr>
						<td>时间</td>
						<td>公司</td>
						<td>工作内容</td>
					</tr>
					<c:choose>
						<c:when test="${not empty socials}">
							<c:forEach items="${socials}" var="j">
								<tr>
									<td hidden="hidden"><input type="hidden" name="socialid" value="${j.socialid}"></td>
									<td><input type="text" name="socialtime" value="${j.socialtime}"></td>
									<td><input type="text" name="company" value="${j.company}"></td>
									<td><input type="text" name="content" value="${j.content}"></td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td><input type="text" name="socialtime" value="暂无"></td>
								<td><input type="text" name="company" value="暂无"></td>
								<td><input type="text" name="content" value="暂无"></td>
							</tr>
						</c:otherwise>
					</c:choose>
					<tr>
						<td><input type="text" name="socialtime" value=""></td>
						<td><input type="text" name="company" value=""></td>
						<td><input type="text" name="content" value=""></td>
					</tr>
					<%--			<c:if test="${not empty socials}">--%>
					<%--				<c:forEach items="${socials}" var="j">--%>
					<%--					<tr>--%>
					<%--						<td><input type="text" value="${j.socialtime}"></td>--%>
					<%--						<td><input type="text" value="${j.company}"></td>--%>
					<%--						<td><input type="text" value="${j.content}"></td>--%>
					<%--					</tr>--%>
					<%--				</c:forEach>--%>
					<%--			</c:if>--%>
				</table>
				<h2 style="clear: both;float: left;margin-left: 58px">技能证书</h2>
				<input type="text" value="${resume.reskill}" style="clear: both;float: left;width: 500px;height: 30px;margin-left: 58px" name="reskill">
				<h2 style="clear: both;float: left;margin-left: 58px">自我评价</h2>
				<input type="text" value="${resume.reeva}" name="reeva" style="clear: both;float: left;width: 500px;height: 30px;margin-left: 58px">
				<input type="submit" value="保存" style="lear: both;float: left;width: 120px;height: 35px;margin-left: 45%">
			</form>
		</div>
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

	$(function(){
		/** 验证文件是否导入成功 */
		$("#form2").ajaxForm(function(data){
			alert(data);
			if(data=="保存成功"){
				window.location.reload();
			}
		});
	});
	layui.use(['form','upload','jquery'], function(){
		var form = layui.form;
		var layer=layui.layer,
			upload = layui.upload;
		var formData = serializeObject($, $('.layui-form').serializeArray());
		form.render();
		form.verify({
			resname: function(value){
				if(value.length < 2&&value.length>4){
					return '请输入2至4位的用户名';
				}
			}

		});

		function serializeObject($, array){
			var obj=new Object();
			$.each(array, function(index,param){
				if(!(param.name in obj)){
					obj[param.name]=param.value;
				}
			});
			return obj;
		}
		var uploadInst = upload.render({
			elem: '#test8' //绑定元素
			,url: '${pageContext.request.contextPath}/school/updateResume' //上传接口
			,auto:false
			,async:false
			,multiple:false
			,accept:'images'
			,method:'POST'
			,enctype:'multipart/form-data'
			,bindAction: '#save12'
			,before:function (obj) {
				this.data = {
					formData
				}
			}
			,choose: function(obj){
				//预读本地文件示例，不支持ie8
				obj.preview(function(index, file, result){
					$('#img_upload').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img" style="width: 135px;height: 80px">');
				});
			}
			,done: function(res){
				//上传完毕回调
				layer.msg(res);
			}
			,error: function(){
				//请求异常回调
				alert("上传失败！");
			}
		});

	});
</script>
</body>
</html>
