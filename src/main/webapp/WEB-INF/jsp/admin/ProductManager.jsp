<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>产品包管理</title>
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
	&nbsp;&nbsp;<label>领域</label>&nbsp;&nbsp;
	<select id="domainid" name="domainid" style="height: 35px">
		<option value="0">全部</option>
		<option value="1">IT互联网</option>
		<option value="2">房地产</option>
		<option value="3">金融</option>
		<option value="4">服务业</option>
	</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<label>状态</label>&nbsp;&nbsp;
	<select id="prostate" name="prostate" style="height: 35px">
		<option value="全部">全部</option>
		<option value="启用">启用</option>
		<option value="禁用">禁用</option>
	</select>
	<button class="layui-btn" data-type="reload">搜索</button>
	<button class="layui-btn" data-type="add">增加</button>
</div>

<table id="demo" lay-filter="test"></table>
<script type="text/html" id="barDemo">
	<div class="layui-btn-group">
		<button type="button" class="layui-btn layui-btn-sm" lay-event="edit">配置</button>
		<button type="button" class="layui-btn layui-btn-sm" lay-event="update">修改</button>
		<button type="button" class="layui-btn layui-btn-sm" lay-event="open">启用</button>
		<button type="button" class="layui-btn layui-btn-sm" lay-event="delete">停用</button>
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
			,url: path+"/admin/productManager" //数据接口
			,page: true //开启分页
			,id: 'demotable'
			,cols: [[ //表头
				{field: 'zizeng', title: '序号', width:100, sort: true, fixed: 'left',templet:'#zizeng'}
				,{field: 'proname', title: '产品名', width:150}
				,{field: 'starttime', title: '发布时间', width:200}
				,{field: 'endtime', title: '结束时间', width:200}
				,{field: 'period', title: '学习周期', width:150}
				,{field: 'teachername', title: '讲师', width:100}
				,{field: 'right', title: '操作', width:300, align:'center', toolbar:'#barDemo'}
			]]
		});
		$('.layui-btn').on('click', function(){
			var type = $(this).data('type');
			if(type == 'reload'){
				//执行重载
				table.reload('demotable', {
					url: path+"/admin/productManager" ,//数据接口
					page: {
						curr: 1 //重新从第 1 页开始
					}
					,
					where: {
						domainid: $("#domainid").val(),
						prostate: $("#prostate").val()
					}
				});
			}else if(type == 'add'){
				layer.open({
					type:2
					,title:"新增产品包"
					,area:['600px','500px']
					,shadeClose: true //点击遮罩不会关闭
					,content:path+"/admin/path/AddProduct"
					,success : function(layero, index) {

					}
				});
			}
		});

		table.on('tool(test)',function(obj){
			var data = obj.data;
			if(obj.event === 'update'){
				layer.confirm('确认修改产品包?', function(index){
					layer.close(index);
					//向服务端发送修改指令
					layer.open({
						type:2
						,title:"修改"
						,area:['600px','500px']
						,shadeClose: true //点击遮罩不会关闭
						,content:path+"/admin/path/UpdateProduct"
						,success : function(layero, index) {
							var body = layer.getChildFrame('body',index);
							body.find("#proname").val(data.proname);
							body.find("#domainid").val(data.domainid);
							body.find("#period").val(data.period);
							body.find("#teacherid").val(data.teacherid);
							body.find("#prointro").val(data.prointro);
							body.find("#procontent").val(data.procontent);
							body.find("#productid").val(data.productid);
						}
					});
				});
			}else if(obj.event === 'delete'){
				layer.confirm('确认停用产品包?', function(index){
					layer.close(index);
					//向服务端发送停用指令
					$.ajax({
						url: path + "/admin/deleteProduct?productid="+data.productid,
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
			}else if(obj.event === 'open'){
				layer.confirm('确认启用产品包?', function(index){
					layer.close(index);
					//向服务端发送启用指令
					$.ajax({
						url: path + "/admin/openProduct?productid="+data.productid,
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
			}else if(obj.event === 'edit'){
				layer.open({
					type:2
					,title:"配置章节"
					,area:['600px','600px']
					,shadeClose: true //点击遮罩不会关闭
					,content:path+"/admin/path/ChapterConfig"
					,success : function(layero, index) {
						var body = layer.getChildFrame('body',index);
						body.find("#domainid").val(data.domainid);
						body.find("#productid").val(data.productid);
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