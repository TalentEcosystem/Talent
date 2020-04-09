<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/8
  Time: 16:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
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
	<label style="float: left;margin-left: 58px;margin-top: 20px">姓名：</label><input type="text" id="uname" style="width: 120px;height: 30px;margin-left: 10px;float: left;margin-top: 20px" value="试试">
	<label style="float: left;margin-left: 30px;margin-top: 20px">学校名称：</label><input type="text" id="schoolname" style="width: 120px;height: 30px;margin-left: 10px;float: left;margin-top: 20px" value="试试试试">
	<label style="clear: both;float: left;margin-left: 30px;margin-top: 10px">出生年月：</label><input type="text"  style="width: 120px;height: 30px;margin-left: 10px;float: left;margin-top: 10px" value="试试">
	<label style="float: left;margin-left: 58px;margin-top: 10px">专业：</label><input type="text" style="width: 120px;height: 30px;margin-left: 10px;float: left;margin-top: 10px" value="试试试试">
	<label style="clear: both;float: left;margin-left: 30px;margin-top: 10px">政治面貌：</label><input type="text"  style="width: 120px;height: 30px;margin-left: 10px;float: left;margin-top: 10px" value="试试">
	<label style="float: left;margin-left: 58px;margin-top: 10px">学历：</label><input type="text" style="width: 120px;height: 30px;margin-left: 10px;float: left;margin-top: 10px" value="试试试试">
	<label style="clear: both;float: left;margin-left: 58px;margin-top: 10px">电话：</label><input type="text"  style="width: 120px;height: 30px;margin-left: 10px;float: left;margin-top: 10px" value="试试">
	<label style="float: left;margin-left: 58px;margin-top: 10px">住址：</label><input type="text" style="width: 120px;height: 30px;margin-left: 10px;float: left;margin-top: 10px" value="试试试试">
	<div style="float: right;width: 140px;height: 137px;margin-right: 50px;border: 1px black solid;margin-top: -110px">
			照片
	</div>
	<h2 style="clear: both;float: left;margin-left: 58px">教育背景</h2>
	<table border="1px black solid" width="500px" style="margin-top: 10px;clear: both;float: left;margin-left: 58px">
		<tr>
			<td>时间</td>
			<td>大学</td>
			<td>专业</td>
		</tr>
		<tr>
		<td>2017.9至今</td>
		<td>福州大学</td>
		<td>XX专业</td>
		</tr>
		<tr>
			<td> </td>
			<td> </td>
			<td> </td>
		</tr>
	</table>
	<h2 style="clear: both;float: left;margin-left: 58px">社会经历</h2>
	<table border="1px black solid" width="500px" style="margin-top: 10px;clear: both;float: left;margin-left: 58px">
		<tr>
			<td>时间</td>
			<td>公司</td>
			<td>工作内容</td>
		</tr>
		<tr>
			<td>暂无</td>
			<td>暂无</td>
			<td>暂无</td>
		</tr>
		<tr>
			<td> </td>
			<td> </td>
			<td> </td>
		</tr>
	</table>
	<h2 style="clear: both;float: left;margin-left: 58px">技能证书</h2>
	<input type="text" style="clear: both;float: left;width: 500px;height: 30px;margin-left: 58px">
	<h2 style="clear: both;float: left;margin-left: 58px">自我评价</h2>
	<input type="text" style="clear: both;float: left;width: 500px;height: 30px;margin-left: 58px">
</form>

</div>
</body>
</html>
