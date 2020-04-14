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
	<title>修改参数</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/layui/css/layui.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/layui/layui.js"></script>
</head>
<body>
<input type="hidden" id="path" value="<%=path%>">
<input type="hidden" id="paraid">
<form class="layui-form" action="">
	<div class="layui-form-item">
		<label class="layui-form-label">参数名称</label>
		<div class="layui-input-inline">
			<input type="text" name="paraname" id="paraname" placeholder="请输入参数名称" class="layui-input">
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">参数类型</label>
		<div class="layui-input-inline">
			<select name="paratype" id="paratype" lay-verify="required">
				<option value="用户参数">用户参数</option>
				<option value="企业参数">企业参数</option>
				<option value="高校参数">高校参数</option>
				<option value="系统参数">系统参数</option>
			</select>
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">参数值</label>
		<div class="layui-input-inline">
			<input type="text" name="paravalue" id="paravalue" placeholder="请输入参数值" class="layui-input">
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
		var paraname=$("#paraname").val();
		var paratype=$("#paratype").val();
		var paravalue=$("#paravalue").val();
		var paraid=$("#paraid").val();
		if(paraname!=null&&paraname!=""&&paratype!=null&&paratype!=""&&paravalue!=null&&paravalue!=""){
			$.ajax({
				url: path + "/admin/updatePara",
				type: 'post',
				async: false,
				data: {"paraname":paraname,"paratype":paratype,"paravalue":paravalue,"paraid":paraid},
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