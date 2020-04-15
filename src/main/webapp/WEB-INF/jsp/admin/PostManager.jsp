<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>岗位管理</title>
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
	&nbsp;&nbsp;<label>行业</label>&nbsp;&nbsp;
	<select id="industryid" name="industryid" style="height: 35px">
		<option value="0">全部</option>
		<c:if test="${not empty industryList}">
			<c:forEach items="${industryList}" var="industry">
				<option value="${industry.industryid}">${industry.indname}</option>
			</c:forEach>
		</c:if>
	</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<button class="layui-btn" data-type="reload">搜索</button>
	<button class="layui-btn" data-type="add">添加岗位</button>
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
			,url: path+"/admin/postManager" //数据接口
			,page: true //开启分页
			,id: 'demotable'
			,cols: [[ //表头
				{field: 'zizeng', title: '序号', width:100, sort: true, fixed: 'left',templet:'#zizeng'}
				,{field: 'postname', title: '岗位名称', width:200}
				,{field: 'indname', title: '上级行业', width:200}
				,{field: 'right', title: '操作', width:200, align:'center', toolbar:'#barDemo'}
			]]
		});
		$('.layui-btn').on('click', function(){
			var type = $(this).data('type');
			if(type == 'reload'){
				//执行重载
				table.reload('demotable', {
					url: path+"/admin/postManager" ,//数据接口
					page: {
						curr: 1 //重新从第 1 页开始
					}
					,
					where: {
						industryid: $("#industryid").val(),
					}
				});
			}else if(type == 'add'){
				layer.open({
					type: 2,
					title:"新增知识库",
					area: ['500px', '300px'],
					content: path + "/admin/path/AddPost" //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
					, success: function (layero, index) {
					}
				});
			}
		});

		table.on('tool(test)',function(obj){
			var data = obj.data;
			if(obj.event === 'update'){
				layer.open({
					type:2
					,title:"修改"
					,area:['500px','300px']
					,shadeClose: true //点击遮罩不会关闭
					,content:path+"/admin/path/UpdatePost"
					,success : function(layero, index) {
						var body = layer.getChildFrame('body',index);
						body.find("#postname").val(data.postname);
						body.find("#industryid").val(data.industryid);
						body.find("#postid").val(data.postid);
					}
				});
			}else if(obj.event === 'delete'){ //删除
				layer.confirm('确认删除?', function(index){
					// obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
					layer.close(index);
					//向服务端发送启用指令
					$.ajax({
						url: path + "/admin/deletePost?postid="+data.postid,
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