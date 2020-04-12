<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/10
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>权限管理</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/layui/css/layui.css">
	<script charset="UTF-8" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
	<script charset="UTF-8" src="${pageContext.request.contextPath}/js/layui/layui.js" media="all"></script>
</head>
<body>
<div id="test1"></div>
<script>
	layui.use('transfer', function(){
		var transfer = layui.transfer;

		//渲染
		transfer.render({
			elem: '#test1'  //绑定元素
			,data: [
				{"value": "1", "title": "李白", "disabled": "", "checked": ""}
				,{"value": "2", "title": "杜甫", "disabled": "", "checked": ""}
				,{"value": "3", "title": "贤心", "disabled": "", "checked": ""}
			]
			,id: 'demo1' //定义索引
		});
	});
</script>
</body>
</html>
