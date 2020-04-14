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
	<form action="${pageContext.request.contextPath}/school/updateResume"  id="form2" method="post"  enctype="multipart/form-data" accept-charset="UTF-8">
		<label style="float: left;margin-left: 58px;margin-top: 20px">姓名：</label><input type="text" name="resname" style="width: 120px;height: 30px;margin-left: 10px;float: left;margin-top: 20px" value="${resume.resname}" >
		<label style="float: left;margin-left: 30px;margin-top: 20px">学校名称：</label><input type="text" id="schoolname" name="schoolname" style="width: 120px;height: 30px;margin-left: 10px;float: left;margin-top: 20px" value="${resume.schoolname}" >
		<label style="clear: both;float: left;margin-left: 30px;margin-top: 10px">出生年月：</label><input type="text"  style="width: 120px;height: 30px;margin-left: 10px;float: left;margin-top: 10px" placeholder="xx年xx月" name="rebirth" value="${resume.rebirth}" >
		<label style="float: left;margin-left: 58px;margin-top: 10px">专业：</label><input type="text" style="width: 120px;height: 30px;margin-left: 10px;float: left;margin-top: 10px" name="professname" value="${resume.professname}" >
		<label style="clear: both;float: left;margin-left: 30px;margin-top: 10px">政治面貌：</label><input type="text"  style="width: 120px;height: 30px;margin-left: 10px;float: left;margin-top: 10px" name="repol" value="${resume.repol}" >
		<label style="float: left;margin-left: 58px;margin-top: 10px">学历：</label><input type="text" style="width: 120px;height: 30px;margin-left: 10px;float: left;margin-top: 10px" name="degreename" value="${resume.degreename}" >
		<label style="clear: both;float: left;margin-left: 58px;margin-top: 10px">电话：</label><input type="text"  style="width: 120px;height: 30px;margin-left: 10px;float: left;margin-top: 10px" name="retel" value="${resume.retel}" >
		<label style="float: left;margin-left: 58px;margin-top: 10px">住址：</label><input type="text" style="width: 120px;height: 30px;margin-left: 10px;float: left;margin-top: 10px" name="readdress" value="${resume.readdress}" >
		<div style="float: right;width: 140px;height: 137px;margin-right: 50px;border: 1px black solid;margin-top: -110px">
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
</script>
</body>
</html>
