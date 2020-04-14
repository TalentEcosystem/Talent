<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/10
  Time: 9:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
	<%
		String path=request.getContextPath();
	%>
	<title>推荐人才</title>
	<script src=<%=path+"/js/jquery-3.4.1.js" %>></script>
	<link rel="stylesheet" href=<%=path+"/js/layui/css/layui.css" %>>
	<script type="text/javascript" src=<%=path+"/js/layui/layui.js" %>></script>
	<script type="text/javascript" src=<%=path+"/js/json2.js" %>></script>
</head>
<body class="layui-layout-body">
<div class="layui-form-item">

	<label class="layui-form-label" style="clear: both;float: left;margin-top: 15px;margin-left: 60px">行业:</label>
	<div class="layui-input-inline">
		<input type="text" name="positionname" id="positionname" style="margin-top: 15px" placeholder="请输入行业" required  lay-verify="required"  autocomplete="off" class="layui-input">
	</div>
	<label class="layui-form-label" style="margin-top: 15px">岗位:</label>
	<div class="layui-input-inline">
		<input type="text" name="indname" id="indname" style="margin-top: 15px" placeholder="请输入岗位" required  lay-verify="required"  autocomplete="off" class="layui-input">
	</div>
	<button class="layui-btn" data-type="reload" lay-filter="formDemo" style="margin-left: 10%;margin-bottom: 10px">搜索</button>

</div>
<table id="demo" lay-filter="demotest" style="margin-left: 40px"></table>
<script type="text/html" id="barDemo">
	<a class="layui-btn layui-btn-xs" lay-event="edit">推荐</a>
</script>
<script type="text/html" id="zizeng">
	{{d.LAY_TABLE_INDEX+1}}
</script>
<script>
	layui.use('table', function(){
		var table = layui.table,
			$=layui.jquery;
		$('table.layui-table thead tr th:eq(1)').addClass('layui-hide');
		$('table.layui-table thead tr th:eq(2)').addClass('layui-hide');
		//第一个实例
		table.render({
			elem: '#demo'
			,height: 320
			,url: "${pageContext.request.contextPath}/school/recommendTalent" //数据接口
			,page: true //开启分页
			,dataType : "json"
			,limit:3
			,id:'demotable'
			,cols: [[ //表头

				{field: 'zizeng', title: '序列', width:80, sort: true, fixed: 'left',templet:'#zizeng'},
				{field: 'cid', title: '公司', width:120,hide: true },
				{field: 'positionid', title: '岗位id', width:120,hide: true },
				{field: 'indname', title: '行业', width:120},
				{field: 'companyname', title: '发布者', width:120},
				{field: 'positionname', title: '岗位', width:120},
				{field: 'positiontime', title: '发布时间', width:120},
				{fixed: 'right', title: '操作', width: 80, align:'center', toolbar: '#barDemo'}
			]]

		});
		$('.layui-btn').on('click',function () {
			var type=$(this).data('type');//指改按钮的类型
				table.reload('demotable', {//上面设置的表格的特殊标识
					page: {
						curr: 1//设置当前页为1
					}
					, where: {
						positionname: $("#positionname").val(),//获取文本框的值
						indname: $("#indname").val(),
					}
				});
			});
		table.on('tool(demotest)', function(obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
			console.log("按钮的方法");
			var data = obj.data //获得当前行数据
				, layEvent = obj.event; //获得 lay-event 对应的值
			if(layEvent === 'edit') {
				<%--	var uid={'uid':data.cid};--%>
				<%--	uid=JSON.stringify(uid);--%>
				<%--	layer.msg('查看操作');--%>
				<%--	$.ajax({--%>
				<%--		url:'${pageContext.request.contextPath}/school/recommend',--%>
				<%--		type:'post',--%>
				<%--		data:'uid='+uid,--%>
				<%--		dataType:'text',--%>
				<%--		success:function(msg){--%>
				<%--			layer.msg(msg);--%>
				<%--		},error:function (err) {--%>
				<%--			console.log(err);--%>
				<%--		}--%>
				<%--	});--%>
				layer.open({
					type: 2,
					area: ['1000px', '100%'],
					btn: ['返回'],
					btn1: function (index, layero) {
						layer.close(index);
					},
					content: 'findTalentByState1' //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
					, success: function (layero, index) {
						layer.msg('推荐');
						var form = layui.form;
						var body = layer.getChildFrame('body', index);
						body.find("input[name=cid]").val(data.cid);
						body.find("input[name=positionid]").val(data.positionid);


					}
				});


			}


		})
	})
</script>
</body>
</html>
