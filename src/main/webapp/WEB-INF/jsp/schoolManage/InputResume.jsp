<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/15
  Time: 9:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>人才批量导入</title>
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
<div class="layui-form-item">
	<label class="layui-form-label">模板下载：</label>
	<div class="layui-input-block">
		<button class="layui-btn"  lay-filter="formDemo" id="submit" >下载模板</button>
	</div>
</div>
<div class="layui-form-item">
	<label class="layui-form-label">文件上传：</label>
	<div class="layui-input-block">
		<div class="layui-upload">
			<button type="button" class="layui-btn layui-btn-normal" id="test8">选择文件</button>
		</div>
		<div class="layui-upload">
			<button type="button" class="layui-btn layui-btn-normal" id="test9">保存</button>
		</div>
	</div>
</div>
</body>
</html>
