<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>日志查看</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/layui/css/layui.css">
	<script charset="UTF-8" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
	<script charset="UTF-8" src="${pageContext.request.contextPath}/js/layui/layui.js" media="all"></script>
	<%
		String path=request.getContextPath();
	%>
</head>
<body>
<input type="hidden" id="path" value="<%=path%>">
<!-- 增加搜索条件 -->
<div class="demoTable" style="margin-top: 10px">
	&nbsp;&nbsp;<label>日志时间:</label>&nbsp;&nbsp;
	<div class="layui-input-inline">
		<input type="date" name="beginTime" id="beginTime" class="layui-input">
	</div>
	&nbsp;&nbsp;<label>至</label>&nbsp;&nbsp;
	<div class="layui-input-inline">
		<input type="date" name="endTime" id="endTime" class="layui-input">
	</div>
	<button class="layui-btn" data-type="reload">查询</button>
</div>

<table id="demo" lay-filter="test"></table>
<script type="text/html" id="zizeng">
	{{d.LAY_TABLE_INDEX+1}}
</script>

<script charset="UTF-8">
	layui.use('table', function(){
		var table = layui.table;
		$ = layui.jquery;
		var path=$("#path").val();
		//第一个实例
		table.render({
			elem: '#demo'
			,height: 500
			,url: path+"/admin/logManager" //数据接口
			,page: true //开启分页
			,id: 'demotable'
			,cols: [[ //表头
				{field: 'zizeng', title: '序号', width:100, sort: true, fixed: 'left',templet:'#zizeng'}
				,{field: 'logname', title: '操作人', width:200}
				,{field: 'logdate', title: '操作时间', width:300,templet:"<div> {{layui.util.toDateString(d.logdate,'yyyy-MM-dd HH:mm:ss')}}</div>"}
				,{field: 'logtype', title: '操作事项', width:200}
			]]
		});
		$('.layui-btn').on('click', function(){
			var type = $(this).data('type');
			if(type == 'reload'){
				//执行重载
				table.reload('demotable', {
					url: path+"/admin/logManager" ,//数据接口
					page: {
						curr: 1 //重新从第 1 页开始
					}
					,
					where: {
						beginTime: $("#beginTime").val(),
						endTime: $("#endTime").val()
					}
				});
			}
		});
	});

	//将表单转为js对象数据
	function serializeObject($, array){
		var obj=new Object();
		$.each(array, function(index,param){
			if(!(param.name in obj)){
				obj[param.name]=param.value;
			}
		});
		return obj;
	};

</script>
</body>
</html>