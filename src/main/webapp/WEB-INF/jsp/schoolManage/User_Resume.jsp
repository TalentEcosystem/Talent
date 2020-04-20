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
	<link rel="stylesheet" href=<%=path+"/js/layui/css/layui.css" %>>
	<script type="text/javascript" src=<%=path+"/js/layui/layui.js" %>></script>
	<script type="text/javascript" src=<%=path+"/js/json2.js" %>></script>
</head>
<body>
<div style="border: 1px black solid;width: 750px;height: 100%;margin-left: 20%">
	<form action="${pageContext.request.contextPath}/school/updateResume" class="layui-form"  id="form2" method="post"  enctype="multipart/form-data" accept-charset="UTF-8">
		<label style="float: left;margin-left: 58px;margin-top: 20px">姓名：</label><input type="text" name="resname" style="width: 120px;height: 30px;margin-left: 10px;float: left;margin-top: 20px" value="${resume.resname}" >
		<label style="float: left;margin-left: 30px;margin-top: 20px">学校名称：</label><input type="text" id="schoolname" name="schoolname" style="width: 120px;height: 30px;margin-left: 10px;float: left;margin-top: 20px" value="${resume.schoolname}" >
		<label style="clear: both;float: left;margin-left: 30px;margin-top: 10px">出生年月：</label><input type="text"  style="width: 120px;height: 30px;margin-left: 10px;float: left;margin-top: 10px" placeholder="xx年xx月" name="rebirth" id="rebirth" value="${resume.rebirth}" >
		<label style="float: left;margin-left: 58px;margin-top: 10px">专业：</label><input type="text" style="width: 120px;height: 30px;margin-left: 10px;float: left;margin-top: 10px" name="professname" id="professname" value="${resume.professname}" >
		<label style="clear: both;float: left;margin-left: 30px;margin-top: 10px">政治面貌：</label><input type="text"  style="width: 120px;height: 30px;margin-left: 10px;float: left;margin-top: 10px" name="repol" id="repol" value="${resume.repol}" >
		<label style="float: left;margin-left: 58px;margin-top: 10px">学历：</label><input type="text" style="width: 120px;height: 30px;margin-left: 10px;float: left;margin-top: 10px" name="degreename" id="degreename" value="${resume.degreename}" >
		<label style="clear: both;float: left;margin-left: 58px;margin-top: 10px">电话：</label><input type="text"  style="width: 120px;height: 30px;margin-left: 10px;float: left;margin-top: 10px" name="retel" id="retel" value="${resume.retel}" >
		<label style="float: left;margin-left: 58px;margin-top: 10px">住址：</label><input type="text" style="width: 120px;height: 30px;margin-left: 10px;float: left;margin-top: 10px" name="readdress" id="readdress" value="${resume.readdress}" >
		<div style="float: right;width: 140px;height: 137px;margin-right: 50px;border: 1px black solid;margin-top: -110px">
			<img src="${pageContext.request.contextPath}/${resume.repic}" name="repic" style="width: 135px;height: 80px">
			<div class="layui-upload-inline">
			<div class="layui-upload-list" id="img_upload"></div>
			<button type="button" class="layui-btn" id="test8">
				<i class="layui-icon">&#xe67c;</i>上传图片
			</button><%--			上传绑定按钮--%>
			<button id="hideupload1" type="button" style="display:none;"></button>
		</div>
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
							<td><input type="text" name="adtime" id="adtime" value="${i.adtime}"></td>
							<td><input type="text" name="sname" id="sname" value="${i.sname}"></td>
							<td><input type="text" name="profession" id="profession" value="${i.profession}"></td>
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

		</table>
		<h2 style="clear: both;float: left;margin-left: 58px">技能证书</h2>
		<input type="text" value="${resume.reskill}" id="reskill" style="clear: both;float: left;width: 500px;height: 30px;margin-left: 58px" name="reskill">
		<h2 style="clear: both;float: left;margin-left: 58px">自我评价</h2>
		<input type="text" value="${resume.reeva}" id="reeva" name="reeva" style="clear: both;float: left;width: 500px;height: 30px;margin-left: 58px">
		<input type="submit" value="保存" id="save12" style="lear: both;float: left;width: 120px;height: 35px;margin-left: 45%">
	</form>
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
