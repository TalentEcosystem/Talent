<%--
  Created by IntelliJ IDEA.
  User: junlong
  Date: 2019-11-13
  Time: 22:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<%
		String path=request.getContextPath();
	%>
	<meta charset="utf-8">
	<title>修改岗位</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/layui/css/layui.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/layui/layui.js"></script>
</head>
<body>
<input type="hidden" id="path" value="<%=path%>">
<input type="hidden" id="postid" name="postid">
<form class="layui-form" action="">
	<div class="layui-form-item">
		<label class="layui-form-label">岗位名称</label>
		<div class="layui-input-block">
			<input type="text" name="postname" id="postname" placeholder="请输入岗位名称" class="layui-input">
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">选择行业</label>
		<div class="layui-input-block">
			<select name="industryid" id="industryid" lay-verify="required">
				<c:if test="${not empty industryList}">
					<c:forEach items="${industryList}" var="industry">
						<option value="${industry.industryid}">${industry.indname}</option>
					</c:forEach>
				</c:if>
			</select>
		</div>
	</div>
	<div class="layui-form-item">
		<div class="layui-input-block">
			<button class="layui-btn" lay-submit lay-filter="formDemo" onclick="s()">立即提交</button>
			<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		</div>
	</div>
</form>

<script>
	//Demo
	layui.use(['layer','form'], function(){
		var form = layui.form;
		$ = layui.jquery;
	});

	function s() {
		var path=$("#path").val();
		var postname=$("#postname").val();
		var industryid=$("#industryid").val();
		var postid=$("#postid").val();
		if(postname!=null&&postname!=""&&industryid!=null&&industryid!=""&&postid!=null&&postid!=""){
			$.ajax({
				url: path + "/admin/updatePost",
				async: false,
				type: 'post',
				data: {"postname":postname,"industryid":industryid,"postid":postid},
				datatype:"text",
				success: function (msg) {
						alert(msg);
						var index = parent.layer.getFrameIndex(window.name);
						parent.layer.close(index);//关闭弹出的子页面窗口 layer.index表示当前层
						window.parent.location.reload();//刷新父级界面
				}, error: function (err) {
					console.log(err);
				}
			});
		}else{
			alert("请将信息填写完整!")
		}

	}

</script>
</body>
</html>