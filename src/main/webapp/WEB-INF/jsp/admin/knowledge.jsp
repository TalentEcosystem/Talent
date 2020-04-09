<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>知识库管理</title>
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
	<label>名称</label>&nbsp;&nbsp;
	<div class="layui-input-inline">
		<input type="text" name="knowname" id="knowname" required lay-verify="required" placeholder="请输入知识库名称" autocomplete="off" class="layui-input">
	</div>
	<button class="layui-btn" data-type="reload">查询</button>
	<button data-method="dialog" class="layui-btn">增加</button>
</div>

<table id="demo" lay-filter="test"></table>
<script type="text/html" id="barDemo">
	<div class="layui-btn-group">
		<button type="button" class="layui-btn layui-btn-sm" lay-event="edit">修改</button>
		<button type="button" class="layui-btn layui-btn-sm" lay-event="del">删除</button>
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
			,url: path+"/admin/findKnow" //数据接口
			,page: true //开启分页
			,id: 'demotable'
			,cols: [[ //表头
				{field: 'zizeng', title: '序号', width:100, sort: true, fixed: 'left',templet:'#zizeng'}
				,{field: 'domainname', title: '领域', width:100}
				,{field: 'knowname', title: '名称', width:100}
				,{field: 'knowintro', title: '详情介绍', width:400}
				,{field: 'right', title: '操作', width:200, align:'center', toolbar:'#barDemo'}
			]]
		});
		$('.layui-btn').on('click', function(){
			var type = $(this).data('type');
			if(type == 'reload'){
				//执行重载
				table.reload('demotable', {
					url: path+"/admin/findKnow" ,//数据接口
					page: {
						curr: 1 //重新从第 1 页开始
					}
					,
					where: {
						knowname: $("#knowname").val(),
						domainid: $("#domainid").val()
					}
				});
			}
		});

		table.on('tool(test)',function(obj){
			var data = obj.data;
			if(obj.event === 'edit'){
				layer.open({
					type:2
					,title:"修改"
					,area:['800px','400px']
					,shadeClose: true //点击遮罩不会关闭
					,content:path+"/admin/path/UpdateKnow"
					,success : function(layero, index) {
						var body = layer.getChildFrame('body',index);
						body.find("#knowname").val(data.knowname);
						body.find("#knowintro").val(data.knowintro);
						body.find("#domainid").val(data.domainid);
						body.find("#knowledgeid").val(data.knowledgeid);
					}
				});
			}else if(obj.event === 'del'){ //删除
				layer.confirm('确认删除?', function(index){
					obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
					layer.close(index);
					//向服务端发送删除指令
					$.ajax({
						url: path + "/admin/deleteKnow?knowledgeid="+data.knowledgeid,
						async: true,
						type: "POST",
						success: function (msg) {
							layer.msg(msg);
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

	layui.use(['layer','form','table'], function(){
		var layer = layui.layer, $ = layui.jquery;
		var table = layui.table;
		var path=$("#path").val();
		$('.layui-btn').on('click', function(){

			var othis = $(this), //othis当前button对象
				method = othis.data('method');//data-method="dialog"中的值

			if(method == "dialog") {
				layer.open({
					type: 2,
					title:"新增知识库",
					area: ['800px', '400px'],
					content: path + "/admin/path/AddKnow" //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
					, success: function (layero, index) {
					}
				});
			}
		});


	});

</script>
</body>
</html>