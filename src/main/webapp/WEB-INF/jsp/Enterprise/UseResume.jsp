<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/8
  Time: 16:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<title>用户简历</title>
	<%
		String path=request.getContextPath();
	%>
	<script src=<%=path+"/js/jquery-3.4.1.js" %>></script>
	<link rel="stylesheet" href=<%=path+"/js/layui/css/layui.css" %>>
	<script type="text/javascript" src=<%=path+"/js/layui/layui.js" %>></script>
	<script type="text/javascript" src=<%=path+"/js/json2.js" %>></script>
</head>

<body>

<div style="border: 1px black solid;width: 750px;height: 100%;margin-left: 20%">
<form >
	<label style="float: left;margin-left: 58px;margin-top: 20px">姓名：</label><input type="text" id="resname1" style="width: 120px;height: 30px;margin-left: 10px;float: left;margin-top: 20px" disabled>
	<label style="float: left;margin-left: 30px;margin-top: 20px">学校名称：</label><input type="text" id="schoolname1" style="width: 120px;height: 30px;margin-left: 10px;float: left;margin-top: 20px"  disabled>
	<label style="clear: both;float: left;margin-left: 30px;margin-top: 10px">出生年月：</label><input type="text" id="rebirth1" style="width: 120px;height: 30px;margin-left: 10px;float: left;margin-top: 10px"  disabled>
	<label style="float: left;margin-left: 58px;margin-top: 10px">专业：</label><input type="text" id="professname" style="width: 120px;height: 30px;margin-left: 10px;float: left;margin-top: 10px"  disabled>
	<label style="clear: both;float: left;margin-left: 30px;margin-top: 10px">政治面貌：</label><input type="text" id="repol"  style="width: 120px;height: 30px;margin-left: 10px;float: left;margin-top: 10px"  disabled>
	<label style="float: left;margin-left: 58px;margin-top: 10px">学历：</label><input type="text" id="degreename" style="width: 120px;height: 30px;margin-left: 10px;float: left;margin-top: 10px"  disabled>
	<label style="clear: both;float: left;margin-left: 58px;margin-top: 10px">电话：</label><input type="text" id="retel"  style="width: 120px;height: 30px;margin-left: 10px;float: left;margin-top: 10px"  disabled>
	<label style="float: left;margin-left: 58px;margin-top: 10px">住址：</label><input type="text" id="readdress" style="width: 120px;height: 30px;margin-left: 10px;float: left;margin-top: 10px"  disabled>
	<div style="float: right;width: 140px;height: 137px;margin-right: 50px;border: 1px black solid;margin-top: -110px">
		<input type="hidden" id="hidepic">
			<img src="" id="repic" style="width: 135px;height: 80px">
	</div>
	<h2 style="clear: both;float: left;margin-left: 58px">教育背景</h2>
	<table border="1px black solid" width="500px" id="aducation12" style="margin-top: 10px;clear: both;float: left;margin-left: 58px">
		<tr>
			<td>时间</td>
			<td>大学</td>
			<td>专业</td>
		</tr>

		<tr>
			<td><input type="text" id="adtime1"  disabled></td>
			<td><input type="text" id="sname1"  disabled></td>
			<td><input type="text" id="profession1"  disabled></td>
		</tr>
		<tr>
			<td><input type="text" id="adtime2"  disabled></td>
			<td><input type="text" id="sname2"  disabled></td>
			<td><input type="text" id="profession2"  disabled></td>
		</tr>

	</table>
	<h2 style="clear: both;float: left;margin-left: 58px">社会经历</h2>
	<table border="1px black solid" width="500px" id="social12" style="margin-top: 10px;clear: both;float: left;margin-left: 58px">
		<tr>
			<td>时间</td>
			<td>公司</td>
			<td>工作内容</td>
		</tr>
				<tr>
					<td><input type="text" id="socialtime1"  disabled></td>
					<td><input type="text" id="company1"  disabled></td>
					<td><input type="text" id="content1"  disabled></td>
				</tr>
		<tr>
			<td><input type="text" id="socialtime2"  disabled></td>
			<td><input type="text" id="company2"  disabled></td>
			<td><input type="text" id="content2"  disabled></td>
		</tr>
	</table>
	<h2 style="clear: both;float: left;margin-left: 58px">技能证书</h2>
	<input type="text" id="reskill12" style="clear: both;float: left;width: 500px;height: 30px;margin-left: 58px" disabled>
	<h2 style="clear: both;float: left;margin-left: 58px">自我评价</h2>
	<input type="text" id="reeva12" style="clear: both;float: left;width: 500px;height: 30px;margin-left: 58px" disabled>
</form>

</div>
<script>
$(function () {
	$("#repic").attr("src","${pageContext.request.contextPath}/"+$('#hidepic').val());
})
</script>
</body>
</html>
