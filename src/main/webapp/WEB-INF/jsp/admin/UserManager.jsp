<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>用户管理</title>
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
	&nbsp;&nbsp;<label>状态</label>&nbsp;&nbsp;
	<select id="ustate" name="ustate" style="height: 35px">
		<option value="全部">全部</option>
		<option value="启用">启用</option>
		<option value="禁用">禁用</option>
	</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<label>高校名称</label>&nbsp;&nbsp;
	<div class="layui-input-inline">
		<input type="text" name="schoolname" id="schoolname" placeholder="请输入高校名称" class="layui-input">
	</div>
	<button class="layui-btn" data-type="reload">查询</button>
</div>

<table id="demo" lay-filter="test"></table>
<script type="text/html" id="barDemo">
	<div class="layui-btn-group">
		<button type="button" class="layui-btn layui-btn-sm" lay-event="forbid">禁用</button>
		<button type="button" class="layui-btn layui-btn-sm" lay-event="enable">启用</button>
	</div>
</script>
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
			,height: 600
			,url: path+"/admin/userManager" //数据接口
			,page: true //开启分页
			,id: 'demotable'
			,cols: [[ //表头
				{field: 'zizeng', title: '序号', width:100, sort: true, fixed: 'left',templet:'#zizeng'}
				,{field: 'uname', title: '用户名', width:100}
				,{field: 'utel', title: '联系方式', width:250}
				,{field: 'schoolname', title: '学校名称', width:250}
				,{field: 'udate', title: '注册时间', width:250}
				,{field: 'ustate', title: '帐号状态', width:100}
				,{field: 'right', title: '操作', width:200, align:'center', toolbar:'#barDemo'}
			]]
		});
		$('.layui-btn').on('click', function(){
			var type = $(this).data('type');
			if(type == 'reload'){
				//执行重载
				table.reload('demotable', {
					url: path+"/admin/userManager" ,//数据接口
					page: {
						curr: 1 //重新从第 1 页开始
					}
					,
					where: {
						ustate: $("#ustate").val(),
						schoolname: $("#schoolname").val()
					}
				});
			}
		});

		table.on('tool(test)',function(obj){
			var data = obj.data;
			if(obj.event === 'forbid'){
				layer.confirm('确认禁用?', function(index){
					// obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
					layer.close(index);
					//向服务端发送禁用指令
					$.ajax({
						url: path + "/admin/userForbid?uid="+data.uid,
						async: true,
						type: "POST",
						success: function (msg) {
							layer.msg(msg);
							window.location.reload();
						},
						error: function () {
							alert("网络繁忙！")
						}
					})
				});
			}else if(obj.event === 'enable'){ //删除
				layer.confirm('确认启用?', function(index){
					// obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
					layer.close(index);
					//向服务端发送启用指令
					$.ajax({
						url: path + "/admin/userEnable?uid="+data.uid,
						async: true,
						type: "POST",
						success: function (msg) {
							layer.msg(msg);
							window.location.reload();
						},
						error: function () {
							alert("网络繁忙！")
						}
					})
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