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
	</div>&nbsp;&nbsp;
	<label>用户昵称</label>&nbsp;&nbsp;
	<div class="layui-input-inline">
		<input type="text" name="uname" id="uname" placeholder="请输入用户昵称" class="layui-input">
	</div>&nbsp;&nbsp;
	<label>手机号</label>&nbsp;&nbsp;
	<div class="layui-input-inline">
		<input type="text" name="utel" id="utel" placeholder="请输入手机号" class="layui-input">
	</div>
	<button class="layui-btn" data-type="reload">查询</button>
</div>

<table id="demo" lay-filter="test"></table>
<script type="text/html" id="barDemo">
	<div class="layui-btn-group">
		<button type="button" class="layui-btn layui-btn-sm" lay-event="forbid">禁用</button>
		<button type="button" class="layui-btn layui-btn-sm" lay-event="enable">启用</button>
		<button type="button" class="layui-btn layui-btn-sm" lay-event="see">查看简历</button>
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
			,url: path+"/admin/userManager" //数据接口
			,page: true //开启分页
			,id: 'demotable'
			,cols: [[ //表头
				{field: 'zizeng', title: '序号', width:100, sort: true, fixed: 'left',templet:'#zizeng'}
				,{field: 'uname', title: '用户名', width:150}
				,{field: 'utel', title: '联系方式', width:200}
				,{field: 'schoolname', title: '学校名称', width:250}
				,{field: 'udate', title: '注册时间', width:250,templet:"<div> {{layui.util.toDateString(d.udate,'yyyy-MM-dd HH:mm:ss')}}</div>"}
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
						schoolname: $("#schoolname").val(),
						uname: $("#uname").val(),
						utel: $("#utel").val()
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
			}else if(obj.event === 'see'){
				var uid={'uid':data.uid};
				uid=JSON.stringify(uid);
				$.ajax({
					url:'${pageContext.request.contextPath}/school/findResume',
					type:'post',
					data:'uid='+uid,
					dataType:'text',
					success:function(msg){
						resume=JSON.parse(msg.split("%")[0]);
						if(JSON.parse(msg.split("%")[1]).length!=0){
							if(JSON.parse(msg.split("%")[1]).length>1){
								social2=JSON.parse(msg.split("%")[1])[1];
							}
							social1=JSON.parse(msg.split("%")[1])[0];
						}
						if(JSON.parse(msg.split("%")[2]).length!=0){
							aducation2=JSON.parse(msg.split("%")[2])[0];
							if(JSON.parse(msg.split("%")[2]).length>1){
								aducation2=JSON.parse(msg.split("%")[2])[1];
							}
						}
						layer.open({
							type: 2,
							area: ['90%', '90%'],
							offset: ['10%', '10%'],
							btn: ['返回'],
							btn1: function(index, layero){
								layer.close(index);
							},
							content: path+'/school/useResume' //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
							,success: function(layero, index){
								console.log(social1.length);
								var form=layui.form;
								var body=layer.getChildFrame('body',index);
								body.find("input[id=resname1]").empty();
								body.find("input[id=schoolname1]").empty();
								body.find("input[id=rebirth1]").empty();
								body.find("input[id=professname]").empty();
								body.find("input[id=repol]").empty();
								body.find("input[id=degreename]").empty();
								body.find("input[id=retel]").empty();
								body.find("input[id=readdress]").empty();
								body.find("input[id=hidepic]").empty();
								body.find("input[id=reskill12]").empty();
								body.find("input[id=reeva12]").empty();
								body.find("input[id=resname1]").val(resume.resname);
								body.find("input[id=schoolname1]").val(resume.schoolname);
								body.find("input[id=rebirth1]").val(resume.rebirth);
								body.find("input[id=professname]").val(resume.professname);
								body.find("input[id=repol]").val(resume.repol);
								body.find("input[id=degreename]").val(resume.degreename);
								body.find("input[id=retel]").val(resume.retel);
								body.find("input[id=readdress]").val(resume.readdress);
								body.find("input[id=hidepic]").val(resume.repic);
								body.find("input[id=reskill12]").val(resume.reskill);
								body.find("input[id=reeva12]").val(resume.reeva);
								if(social1!=null){
									body.find("input[id=socialtime1]").val(social1.socialtime);
									body.find("input[id=company1]").val(social1.company);
									body.find("input[id=content1]").val(social1.content);
									if(social2!=null){
										body.find("input[id=socialtime2]").val(social2.socialtime);
										body.find("input[id=company2]").val(social2.company);
										body.find("input[id=content2]").val(social2.content);
									}else{
										body.find("input[id=socialtime2]").val("");
										body.find("input[id=company2]").val("");
										body.find("input[id=content2]").val("");
									}
								}else{
									body.find("input[id=socialtime1]").val("");
									body.find("input[id=company1]").val("");
									body.find("input[id=content1]").val("");
								}
								if(aducation1!=null){
									body.find("input[id=adtime1]").val(aducation1.adtime);
									body.find("input[id=sname1]").val(aducation1.sname);
									body.find("input[id=profession1]").val(aducation1.profession);
									if(aducation2!=null){
										body.find("input[id=adtime2]").val(aducation2.adtime);
										body.find("input[id=sname2]").val(aducation2.sname);
										body.find("input[id=profession2]").val(aducation2.profession);
									}else{
										body.find("input[id=adtime2]").val("");
										body.find("input[id=sname2]").val("");
										body.find("input[id=profession2]").val("");
									}
								}else{
									body.find("input[id=adtime1]").val("");
									body.find("input[id=sname1]").val("");
									body.find("input[id=profession1]").val("");
								}
							}
						});
					},error:function (err) {
						console.log(err);
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