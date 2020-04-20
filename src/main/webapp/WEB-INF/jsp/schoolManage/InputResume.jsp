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
<body style="border: 1px black solid;width: 750px;height: 100%;margin-left: 15%;margin-top: 5%">
<div class="layui-form-item">
	<label class="layui-form-label">模板下载：</label>
	<div class="layui-input-block">
		<button class="layui-btn"  id="download" >下载模板</button>
		<p style="color: grey;font-size: small">请详细的填写模板，若没有相关信息填暂无</p>
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
<script>
$("#download").click(function () {
	window.location.href= "${pageContext.request.contextPath}/school/downLoadExcel";

});
layui.use(['upload','jquery'], function(){
	var upload = layui.upload,
		$=layui.jquery;

	//执行实例
	var uploadInst = upload.render({
		elem: '#test8' //绑定元素
		,url: '${pageContext.request.contextPath}/school/uploadTalent' //上传接口
		,auto: false
		,async:false
		,accept: 'file'
		,multiple:false
		,exts: 'xls|excel|xlsx' //只允许上传Excel文件
		,bindAction: '#test9'
		// ,before: function(obj){
		// 	this.data = {
		// 		bookName: $("#hideBookName").val()
		//
		// 	}
		// }
		,done: function(res){
			//上传完毕回调
			layer.msg("导入成功");
		}
		,error: function(){
			//请求异常回调
			alert("上传失败！");
		}
	});
});

</script>
</body>
</html>
