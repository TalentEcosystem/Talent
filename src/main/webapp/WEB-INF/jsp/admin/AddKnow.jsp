<%--
  Created by IntelliJ IDEA.
  User: junlong
  Date: 2019-11-13
  Time: 22:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<html>
<head>
	<%
		String path=request.getContextPath();
	%>
	<meta charset="utf-8">
	<title>新增知识库</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/layui/css/layui.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/layui/layui.js"></script>
</head>
<body>
<input type="hidden" id="path" value="<%=path%>">
<form class="layui-form" action="">
	<div class="layui-form-item">
		<label class="layui-form-label">名称</label>
		<div class="layui-input-block">
			<input type="text" name="knowname" id="knowname" placeholder="请输入知识库名称" class="layui-input">
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">选择领域</label>
		<div class="layui-input-block">
			<select name="domainid" id="domainid" lay-verify="required">
				<option value="1">IT互联网</option>
				<option value="2">房地产</option>
				<option value="3">金融</option>
				<option value="4">服务业</option>
			</select>
		</div>
	</div>
	<div class="layui-form-item layui-form-text">
		<label class="layui-form-label">文本域</label>
		<div class="layui-input-block">
			<textarea name="knowintro" id="knowintro" placeholder="请填写知识库介绍" class="layui-textarea"></textarea>
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
		var knowname=$("#knowname").val();
		var knowintro=$("#knowintro").val();
		var domainid=$("#domainid").val();
		if(knowname!=null&&knowname!=""&&knowintro!=null&&knowintro!=""&&domainid!=null&&domainid!=""){
			$.ajax({
				url: path + "/admin/addKnow",
				type: 'post',
				data: {"knowname":knowname,"knowintro":knowintro,"domainid":domainid},
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