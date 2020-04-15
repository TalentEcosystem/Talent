<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>参数管理</title>
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
	&nbsp;&nbsp;<label>参数类型</label>&nbsp;&nbsp;
	<select id="paratype" name="paratype" style="height: 35px">
		<option value="全部">全部</option>
		<option value="用户参数">用户参数</option>
		<option value="企业参数">企业参数</option>
		<option value="高校参数">高校参数</option>
		<option value="系统参数">系统参数</option>
	</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<label>参数名称</label>&nbsp;&nbsp;
	<div class="layui-input-inline">
		<input type="text" name="paraname" id="paraname" required lay-verify="required" placeholder="请输入参数名称" autocomplete="off" class="layui-input">
	</div>
	<button class="layui-btn" data-type="reload">查询</button>
	<button class="layui-btn" data-type="add">新增</button>
</div>

<table id="demo" lay-filter="test"></table>
<script type="text/html" id="barDemo">
	<div class="layui-btn-group">
		<button type="button" class="layui-btn layui-btn-sm" lay-event="update">修改</button>
		<button type="button" class="layui-btn layui-btn-sm" lay-event="delete">删除</button>
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
			,height: 500
			,url: path+"/admin/paraManager" //数据接口
			,page: true //开启分页
			,id: 'demotable'
			,cols: [[ //表头
				{field: 'zizeng', title: '序号', width:100, sort: true, fixed: 'left',templet:'#zizeng'}
				,{field: 'paraname', title: '参数名称', width:150}
				,{field: 'paratype', title: '参数类型', width:150}
				,{field: 'paravalue', title: '参数值', width:300}
				,{field: 'right', title: '操作', width:200, align:'center', toolbar:'#barDemo'}
			]]
		});
		$('.layui-btn').on('click', function(){
			var type = $(this).data('type');
			if(type == 'reload'){
				//执行重载
				table.reload('demotable', {
					url: path+"/admin/paraManager" ,//数据接口
					page: {
						curr: 1 //重新从第 1 页开始
					}
					,
					where: {
						paratype: $("#paratype").val(),
						paraname: $("#paraname").val()
					}
				});
			}else if(type == 'add'){
				layer.open({
					type:2
					,title:"新增参数"
					,area:['500px','300px']
					,shadeClose: true //点击遮罩不会关闭
					,content:path+"/admin/path/AddPara"
					,success : function(layero, index) {

					}
				});
			}
		});

		table.on('tool(test)',function(obj){
			var data = obj.data;
			if(obj.event === 'update'){
				layer.confirm('确认修改参数?', function(index){
					layer.close(index);
					//向服务端发送修改指令
					layer.open({
						type:2
						,title:"修改参数"
						,area:['500px','300px']
						,shadeClose: true //点击遮罩不会关闭
						,content:path+"/admin/path/UpdatePara"
						,success : function(layero, index) {
							var body = layer.getChildFrame('body',index);
							body.find("#paraname").val(data.paraname);
							body.find("#paratype").val(data.paratype);
							body.find("#paravalue").val(data.paravalue);
							body.find("#paraid").val(data.paraid);
						}
					});
				});
			}else if(obj.event === 'delete'){ //删除
				layer.confirm('确认删除参数?', function(index){
					layer.close(index);
					//向服务端发送删除指令
					$.ajax({
						url: path + "/admin/deletePara?paraid="+data.paraid,
						async: true,
						type: "POST",
						success: function (msg) {
							alert(msg);
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