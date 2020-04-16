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
	<title>新增产品包</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/layui/css/layui.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/layui/layui.js"></script>
</head>
<body>
<input type="hidden" id="path" value="<%=path%>">
<form class="layui-form" action="" onsubmit="return false">
	<div class="layui-form-item">
		<label class="layui-form-label">产品名</label>
		<div class="layui-input-inline">
			<input type="text" name="proname" id="proname" placeholder="请输入产品名" lay-verify="proname" autocomplete="off" class="layui-input">
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">领域</label>
		<div class="layui-input-inline">
			<select name="domainid" id="domainid" lay-verify="required">
				<option value="1">IT互联网</option>
				<option value="2">房地产</option>
				<option value="3">金融</option>
				<option value="4">服务业</option>
			</select>
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">学习周期</label>
		<div class="layui-input-inline">
			<input type="text" name="period" id="period" placeholder="请输入学习周期" lay-verify="period" autocomplete="off" class="layui-input">
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">讲师</label>
		<div class="layui-input-inline">
			<select name="teacherid" id="teacherid" lay-verify="required">
				<option value="1">杨老师</option>
				<option value="2">郭老师</option>
				<option value="3">李老师</option>
			</select>
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">产品描述</label>
		<div class="layui-input-inline">
			<input type="text" name="prointro" id="prointro" placeholder="请输入产品描述" lay-verify="prointro" autocomplete="off" class="layui-input">
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">产品内容</label>
		<div class="layui-input-inline">
			<input type="text" name="procontent" id="procontent" placeholder="请输入产品内容" lay-verify="procontent" autocomplete="off" class="layui-input">
		</div>
	</div>
	<div class="layui-form-item">
		<div class="layui-input-block">
			<button type="button" class="layui-btn" id="test1">
				<i class="layui-icon">&#xe67c;</i>上传图片
			</button>
		</div>
	</div>
	<div class="layui-form-item">
		<div class="layui-input-block">
			<button type="submit" id="btn" class="layui-btn" lay-submit="">立即提交</button>
			<button type="reset" class="layui-btn layui-btn-primary">重置</button>
		</div>
	</div>
</form>

<script>
	//Demo
	layui.use(['layer','form','upload','jquery'], function(){
		var form = layui.form;
		$ = layui.jquery;
		var upload = layui.upload;
		var path=$("#path").val();

		form.verify({
			proname:function(value){
				if(value.length < 1){
					return '产品名称不能为空';
				}
			}
			,period: function(value){
				if(value.length < 1){
					return '学习周期不能为空';
				}
			}
			,prointro: function(value) {
				if (value.length < 1) {
					return '产品描述不能为空';
				}
			}
			,procontent: function(value){
				if (value.length < 1) {
					return '产品内容不能为空';
				}
			}
		});

		var uploadInst = upload.render({
			elem: '#test1' //绑定元素
			,accept: 'image'
			,auto: false
			,async: false
			,bindAction: '#btn'
			,before:function () {
				this.data={
					proname:$("#proname").val(),
					domainid:$("#domainid").val(),
					period:$("#period").val(),
					teacherid:$("#teacherid").val(),
					prointro:$("#prointro").val(),
					procontent:$("#procontent").val()
				}
			}
			,url: path+"/admin/addProduct"
			,done: function(res){
				alert(res.msg);
				var index = parent.layer.getFrameIndex(window.name);
				parent.layer.close(index);//关闭弹出的子页面窗口 layer.index表示当前层
				window.parent.location.reload();//刷新父级界面
			}
			,error: function(){
				//请求异常回调
			}
		});
	});

</script>
</body>
</html>