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
	var resouseCode='jianli';
	var suffix='xlsx';
	loadTemplate(resouseCode, suffix);
});

/**
 * 模板下载
 */
function loadTemplate(resouseCode, suffix) {
	//文件名+后缀名
	var fileName = resouseCode + '.' + suffix;

	var templatediv = '<div id="templatediv" style="width:400px;height:200px;">'+
		'</div>';
	if (window.top.$('#templatediv').length == 0) {
		window.top.$("body").append(templatediv);
	}
	var templistspan = "";
	templistspan +='<div class="download-list">';
	templistspan += '<span><a id="downloadBtn" href="${pageContext.request.contextPath}/school/fileHandle/downloadtemplate.do?fileName='+encodeURI(encodeURI(fileName))+'">'+fileName+'</a></span>';
	templistspan +='</div>';
	window.top.$("#templatediv").html(templistspan);
	//弹出下载模板
	window.top.$("#templatediv").dialog({
		title:"下载模板",
		modal:true
	});
	//下载模板完了就关闭对话框
	window.top.$("#downloadBtn").click(function() {
		window.top.$("#templatediv").dialog('close');
	});
}
</script>
</body>
</html>
