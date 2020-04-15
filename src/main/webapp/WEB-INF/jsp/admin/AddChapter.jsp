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
	<title>新增章节</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/layui/css/layui.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/layui/layui.js"></script>
</head>
<body>
<input type="hidden" id="path" value="<%=path%>">
<form class="layui-form" action="" onsubmit="return false">
	<div class="layui-form-item">
		<label class="layui-form-label">所属知识库</label>
		<div class="layui-input-inline">
			<select name="knowledgeid" id="knowledgeid" lay-verify="required">
				<c:if test="${not empty chapKnowList}">
					<c:forEach items="${chapKnowList}" var="know">
						<option value="${know.knowledgeid}">${know.knowname}</option>
					</c:forEach>
				</c:if>
			</select>
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">章节名称</label>
		<div class="layui-input-inline">
			<input type="text" name="chname" id="chname" placeholder="请输入章节名称" lay-verify="chname" autocomplete="off" class="layui-input">
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">章节描述</label>
		<div class="layui-input-inline">
			<input type="text" name="chintro" id="chintro" placeholder="请输入章节描述" lay-verify="chintro" autocomplete="off" class="layui-input">
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">课程时长</label>
		<div class="layui-input-inline">
			<input type="text" name="chaptime" id="chaptime" placeholder="请输入课程时长" lay-verify="chaptime" autocomplete="off" class="layui-input">
		</div>
	</div>
	<div class="layui-form-item">
		<div class="layui-input-block">
			<button type="button" class="layui-btn" id="test1">
				<i class="layui-icon">&#xe67c;</i>上传视频
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
			chname: function(value){
				if(value.length < 1){
					return '章节名称不能为空';
				}
			}
			,chintro: function(value) {
				if (value.length < 1) {
					return '章节描述不能为空';
				}
			}
			,chaptime: function(value){
				if (value.length < 1) {
					return '课程时长不能为空';
				}
			}
		});

		var uploadInst = upload.render({
			elem: '#test1' //绑定元素
			,accept: 'video'
			,auto: false
			,async: false
			,bindAction: '#btn'
			,before:function () {
				this.data={
					knowledgeid:$("#knowledgeid").val(),
					chname:$("#chname").val(),
					chintro:$("#chintro").val(),
					chaptime:$("#chaptime").val()
				}
			}
			,url: path+"/admin/addChapter"
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