<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/10
  Time: 14:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
	<%
		String path=request.getContextPath();
	%>
	<title>人才推荐</title>
	<script src=<%=path+"/js/jquery-3.4.1.js" %>></script>
	<link rel="stylesheet" href=<%=path+"/js/layui/css/layui.css" %>>
	<script type="text/javascript" src=<%=path+"/js/layui/layui.js" %>></script>
	<script type="text/javascript" src=<%=path+"/js/json2.js" %>></script>
</head>
<<body class="layui-layout-body">
<div class="layui-form-item">
	<input type="hidden" name="cid" id="cid" style="margin-top: 60px">
	<input type="hidden" name="positionid" id="positionid">
	<label class="layui-form-label" style="margin-left: 60px;margin-top: 60px">起始时间:</label>
	<div class="layui-input-inline">
		<input type="date" name="mindate" id="mindate" required  lay-verify="required"  autocomplete="off" class="layui-input" style="margin-top: 60px">
	</div>
	<label class="layui-form-label" style="margin-top: 60px">终止时间:</label>
	<div class="layui-input-inline">
		<input type="date" name="maxdate" id="maxdate" required  lay-verify="required"  autocomplete="off" class="layui-input" style=";margin-top: 60px">
	</div>
	<button class="layui-btn" data-type="reload" lay-filter="formDemo" style="float: left;margin-left: 60px;margin-bottom: 10px;margin-top: 60px">搜索</button>
	<label class="layui-form-label" style="clear: both;float: left;margin-top: 15px;margin-left: 60px">高校名称:</label>
	<div class="layui-input-inline">
		<input type="text" name="schoolname" id="schoolname" style="margin-top: 15px" placeholder="请输入高校名称" required  lay-verify="required"  autocomplete="off" class="layui-input">
	</div>
	<label class="layui-form-label" style="margin-top: 15px">专业:</label>
	<div class="layui-input-inline">
		<input type="text" name="pro" id="pro" style="margin-top: 15px" placeholder="请输入专业名称" required  lay-verify="required"  autocomplete="off" class="layui-input">
	</div>
	<button data-type="flush" class="layui-btn"  style="float: left;margin-left: 60px;margin-bottom: 10px">推荐</button>

</div>
<table id="demo" lay-filter="demotest" style="margin-left: 40px"></table>

<script>
	layui.use('table', function(){
		var table = layui.table,
			$=layui.jquery;
		$('table.layui-table thead tr th:eq(1)').addClass('layui-hide');
		//第一个实例
		table.render({
			elem: '#demo'
			,height: 300
			,url: "${pageContext.request.contextPath}/school/findTalentByState" //数据接口
			,page: true //开启分页
			,dataType : "json"
			,limit:5
			,id:'demotable'
			,cols: [[ //表头
				{type:'checkbox'},
				{field: 'uid', title: 'id', width:160,hide: true },
				{field: 'uaccount', title: '账号', width:160},
				{field: 'resname', title: '姓名', width:160},
				{field: 'schoolname', title: '学校名称', width:160},
				{field: 'professname', title: '专业', width:160},
				{
					field: 'reemploy', title: '是否就业', width: 160

				},

			]]

		});
		$('.layui-btn').on('click',function () {
			var type=$(this).data('type');//指改按钮的类型

			if(type=='reload'){
				table.reload('demotable',{//上面设置的表格的特殊标识
					page:{
						curr:1//设置当前页为1
					}
					,where:{
						mindate:$("#mindate").val(),//获取文本框的值
						maxdate:$("#maxdate").val(),
						schoolname:$("#schoolname").val(),
						pro:$("#pro").val()
					}
				});
			}else if(type=='flush'){
				var statechange=confirm("是否确认推荐");
				if(statechange ===true) {
					var checkStatus = table.checkStatus('demotable');
					var ids = [];
					$(checkStatus.data).each(function (i, o) {//o即为表格中一行的数据
						if(o.reemploy=='否'){
							ids.push(o.uid);
						}

					});

					if (ids.length < 1) {
						layer.msg('无选中项或选中用户已就业');
						return false;
					}
					// ids = ids.join(",");
					console.log(ids);
					$.ajax({
						url:'${pageContext.request.contextPath}/school/recommend',
						type:'post',
						data: {"ids":ids,"cid":$("#cid").val(),"positionid":$("#positionid").val()},
						traditional: true,
						dataType:'json',
						success:function(msg){
						layer.msg(msg);
						},error:function (err) {
							console.log(err);

						}


					});


				}else{
					layer.msg("您已取消操作");
				}
			}

		});







	})


</script>
</body>
</html>
