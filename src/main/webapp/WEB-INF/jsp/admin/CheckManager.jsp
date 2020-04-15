<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>企业资质审核</title>
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
	<select id="state" name="state" style="height: 35px">
		<option value="全部">全部</option>
		<option value="启用">审核通过</option>
		<option value="禁用">审核不通过</option>
	</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<label>企业名称</label>&nbsp;&nbsp;
	<div class="layui-input-inline">
		<input type="text" name="companyname" id="companyname" required lay-verify="required" placeholder="请输入企业名称" autocomplete="off" class="layui-input">
	</div>
	<button class="layui-btn" data-type="reload">查询</button>
</div>

<table id="demo" lay-filter="test"></table>
<script type="text/html" id="barDemo">
	<div class="layui-btn-group">
		<button type="button" class="layui-btn layui-btn-sm" lay-event="confirm">审核通过</button>
		<button type="button" class="layui-btn layui-btn-sm" lay-event="refuse">审核不通过</button>
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
			,url: path+"/admin/checkManager" //数据接口
			,page: true //开启分页
			,id: 'demotable'
			,cols: [[ //表头
				{field: 'zizeng', title: '序号', width:100, sort: true, fixed: 'left',templet:'#zizeng'}
				,{field: 'companyname', title: '企业名称', width:150}
				,{field: 'tel', title: '联系方式', width:150}
				,{field: 'name', title: '申请人', width:100}
				,{field: 'date', title: '申请时间', width:200}
				,{field: 'state', title: '申请状态', width:150, templet: function (d) {
						return d.state == '启用' ? '审核通过' : '审核不通过';
					}}
				,{field: 'right', title: '操作', width:200, align:'center', toolbar:'#barDemo'}
			]]
		});
		$('.layui-btn').on('click', function(){
			var type = $(this).data('type');
			if(type == 'reload'){
				//执行重载
				table.reload('demotable', {
					url: path+"/admin/checkManager" ,//数据接口
					page: {
						curr: 1 //重新从第 1 页开始
					}
					,
					where: {
						state: $("#state").val(),
						companyname: $("#companyname").val()
					}
				});
			}
		});

		table.on('tool(test)',function(obj){
			var data = obj.data;
			if(obj.event === 'confirm'){
				layer.confirm('确认审核通过?', function(index){
					layer.close(index);
					//向服务端发送通过指令
					$.ajax({
						url: path + "/admin/checkConfirm?aid="+data.aid,
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
			}else if(obj.event === 'refuse'){ //删除
				layer.confirm('确认审核不通过?', function(index){
					layer.close(index);
					//向服务端发送不通过指令
					$.ajax({
						url: path + "/admin/checkRefuse?aid="+data.aid,
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