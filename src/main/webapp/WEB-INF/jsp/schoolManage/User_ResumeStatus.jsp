<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/14
  Time: 10:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<title>用户情况</title>
	<%
		String path=request.getContextPath();
	%>
	<script src=<%=path+"/js/jquery-3.4.1.js" %>></script>
	<script src=<%=path+"/js/jquery-form.js" %>></script>
	<link rel="stylesheet" href=<%=path+"/js/layui/css/layui.css" %>>
	<script type="text/javascript" src=<%=path+"/js/layui/layui.js" %>></script>
	<script type="text/javascript" src=<%=path+"/js/json2.js" %>></script>
</head>
<body class="layui-layout-body">
<table id="demo" lay-filter="demotest" style="margin-left: 40px"></table>
<script type="text/html" id="zizeng">
	{{d.LAY_TABLE_INDEX+1}}
</script>
<script>
	layui.use('table', function(){
		var table = layui.table,
			$=layui.jquery;
		$('table.layui-table thead tr th:eq(1)').addClass('layui-hide');
		//第一个实例
		table.render({
			elem: '#demo'
			,height: 320
			,url: "${pageContext.request.contextPath}/school/userResumeStatus" //数据接口
			,page: true //开启分页
			,dataType : "json"
			,limit:3
			,id:'demotable'
			,cols: [[ //表头
				{field: 'zizeng', title: '序列', width:80, sort: true, fixed: 'left',templet:'#zizeng'},
				{field: 'interviewid', title: 'id', width:120,hide: true },
				{field: 'positionname', title: '岗位名称', width:120},
				{field: 'companyname', title: '公司名称', width:120},
				{field: 'companynature', title: '企业性质', width:120},
				// {fixed: 'right', title: '操作', width: 80, align:'center', toolbar: '#barDemo'}
				]]

		});
	})
</script>
</body>
</html>
