<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/9
  Time: 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>高校简介</title>
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
	<form id="form1" action="${pageContext.request.contextPath}/school/updateSchoolInfo" method="post"  enctype="multipart/form-data" accept-charset="UTF-8">
	<input type="text"  style="margin-left: 40%;font-size: large" id="schoolname" name="schoolname" value="${school.schoolname}">
	<div>
	<img style="margin-left: 23%;width: auto;height: 250px"  src="${pageContext.request.contextPath}/${school.schoolpic}">
</div>
	<textarea rows="7" cols="100" style="resize:none;margin-left: 5%" id="schoolinfo" name="schoolinfo">
		${school.schoolinfo}
	</textarea>
		<br/>
		<label>选择图片：</label><input type="file" id="fileaot" value="${school.schoolpic}" name="fileaot">
		<input type="submit" id="update" value="确定修改">
	</form>
</div>
<script>
	$(function(){
		/** 验证文件是否导入成功 */
		$("#form1").ajaxForm(function(data){
			alert(data);
			if(data=="修改成功"){
				window.location.reload();
			}
		});
	});
</script>
</body>
</html>
