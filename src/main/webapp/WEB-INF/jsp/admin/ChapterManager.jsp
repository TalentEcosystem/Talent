<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>章节管理</title>
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
	&nbsp;&nbsp;<label>知识库</label>&nbsp;&nbsp;
	<select id="knowledgeid" name="knowledgeid" style="height: 35px">
		<option value="0">全部</option>
		<c:if test="${not empty chapKnowList}">
			<c:forEach items="${chapKnowList}" var="know">
				<option value="${know.knowledgeid}">${know.knowname}</option>
			</c:forEach>
		</c:if>
	</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<label>章节名称</label>&nbsp;&nbsp;
	<div class="layui-input-inline">
		<input type="text" name="chname" id="chname" required lay-verify="required" placeholder="请输入章节名称" autocomplete="off" class="layui-input">
	</div>
	<button class="layui-btn" data-type="reload">查询</button>
	<button class="layui-btn" data-type="add">增加</button>
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
			,url: path+"/admin/chapterManager" //数据接口
			,page: true //开启分页
			,id: 'demotable'
			,cols: [[ //表头
				{field: 'zizeng', title: '序号', width:100, sort: true, fixed: 'left',templet:'#zizeng'}
				,{field: 'knowname', title: '所属知识库', width:150}
				,{field: 'chname', title: '章节名称', width:150}
				,{field: 'chintro', title: '章节描述', width:400}
				,{field: 'chaptime', title: '学习课时', width:100}
				,{field: 'right', title: '操作', width:200, align:'center', toolbar:'#barDemo'}
			]]
		});
		$('.layui-btn').on('click', function(){
			var type = $(this).data('type');
			if(type == 'reload'){
				//执行重载
				table.reload('demotable', {
					url: path+"/admin/chapterManager" ,//数据接口
					page: {
						curr: 1 //重新从第 1 页开始
					}
					,
					where: {
						knowledgeid: $("#knowledgeid").val(),
						chname: $("#chname").val()
					}
				});
			}else if(type == 'add'){
				layer.open({
					type:2
					,title:"新增章节"
					,area:['600px','400px']
					,shadeClose: true //点击遮罩不会关闭
					,content:path+"/admin/path/AddChapter"
					,success : function(layero, index) {

					}
				});
			}
		});

		table.on('tool(test)',function(obj){
			var data = obj.data;
			if(obj.event === 'update'){
				layer.confirm('确认修改章节?', function(index){
					layer.close(index);
					//向服务端发送修改指令
					layer.open({
						type:2
						,title:"修改"
						,area:['600px','400px']
						,shadeClose: true //点击遮罩不会关闭
						,content:path+"/admin/path/UpdateChapter"
						,success : function(layero, index) {
							var body = layer.getChildFrame('body',index);
							body.find("#knowledgeid").val(data.knowledgeid);
							body.find("#chname").val(data.chname);
							body.find("#chintro").val(data.chintro);
							body.find("#chaptime").val(data.chaptime);
							body.find("#chapterid").val(data.chapterid);
						}
					});
				});
			}else if(obj.event === 'delete'){ //删除
				layer.confirm('确认删除章节?', function(index){
					layer.close(index);
					//向服务端发送删除指令
					$.ajax({
						url: path + "/admin/deleteChapter?chapterid="+data.chapterid,
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