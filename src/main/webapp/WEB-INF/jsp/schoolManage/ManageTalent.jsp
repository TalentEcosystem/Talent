<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/8
  Time: 8:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
	<title>人才中心</title>
	<%
		String path=request.getContextPath();
	%>
	<script src=<%=path+"/js/jquery-3.4.1.js" %>></script>
	<link rel="stylesheet" href=<%=path+"/js/layui/css/layui.css" %>>
	<script type="text/javascript" src=<%=path+"/js/layui/layui.js" %>></script>
	<script type="text/javascript" src=<%=path+"/js/json2.js" %>></script>
</head>
<body class="layui-layout-body">
<button class="layui-btn" data-type="reload" lay-filter="formDemo" style="margin-left: 10%;margin-bottom: 10px">搜索</button>
<button data-type="flush" class="layui-btn"  style="margin-left: 60px;margin-bottom: 10px">刷新</button>
<div class="layui-form-item">
	<label class="layui-form-label" style="margin-left: 60px">起始时间:</label>
	<div class="layui-input-inline">
		<input type="date" name="mindate" id="mindate" required  lay-verify="required"  autocomplete="off" class="layui-input">
	</div>
	<label class="layui-form-label">终止时间:</label>
	<div class="layui-input-inline">
		<input type="date" name="maxdate" id="maxdate" required  lay-verify="required"  autocomplete="off" class="layui-input">
	</div>
	<button class="layui-btn" data-type="inputfild" id="inputfild" style="margin-left: 60px;float: left">导入人才</button>
	<label class="layui-form-label" style="clear: both;float: left;margin-top: 15px;margin-left: 60px">高校名称:</label>
	<div class="layui-input-inline">
		<input type="text" name="schoolname" id="schoolname" style="margin-top: 15px" placeholder="请输入高校名称" required  lay-verify="required"  autocomplete="off" class="layui-input">
	</div>
	<label class="layui-form-label" style="margin-top: 15px">专业:</label>
	<div class="layui-input-inline">
		<input type="text" name="pro" id="pro" style="margin-top: 15px" placeholder="请输入专业名称" required  lay-verify="required"  autocomplete="off" class="layui-input">
	</div>
	<button class="layui-btn" data-type="outputfild" id="outputfild" style="margin-left: 60px;float: left;margin-top: 15px">导出人才</button>

</div>
<table id="demo" lay-filter="demotest" style="margin-left: 40px"></table>

<script type="text/html" id="barDemo">
	<a class="layui-btn layui-btn-xs" lay-event="edit">查看</a>
</script>
<script type="text/html" id="zizeng">
	{{d.LAY_TABLE_INDEX+1}}
</script>
<script>
	layui.use('table', function(){
		var table = layui.table,
			$=layui.jquery;
		$('table.layui-table thead tr th:eq(1)').addClass('layui-hide');
		//第一个实例
		table.render({
			elem: '#demo'
			,height: 320
			,url: "${pageContext.request.contextPath}/school/showTalent" //数据接口
			,page: true //开启分页
			,dataType : "json"
			,limit:3
			,id:'demotable'
			,cols: [[ //表头
				{field: 'zizeng', title: '序列', width:80, sort: true, fixed: 'left',templet:'#zizeng'},
				{field: 'uid', title: 'id', width:120,hide: true },
				{field: 'uaccount', title: '账号', width:120},
				{field: 'resname', title: '姓名', width:80},
				{field: 'chname', title: '当前学习', width:120},
				{field: 'professname', title: '专业', width:80},
				{
					field: 'reemploy', title: '是否就业', width: 120,
				},
				{fixed: 'right', title: '操作', width: 80, align:'center', toolbar: '#barDemo'}
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
				window.location.reload();
			}else if(type=='inputfild'){
				layer.open({
					type: 2,
					area: ['1000px', '100%'],
					btn: ['返回'],
					btn1: function(index, layero){
						layer.close(index);
					},
					content: 'inputResumePage' //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
					,success: function(layero, index){
						layer.msg('导出人才');
					}
				});
			}

		});
		var resume="";
		var social1="";
		var aducation1="";
		var social2="";
		var aducation2="";
		table.on('tool(demotest)', function(obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
			console.log("按钮的方法");
			var data = obj.data //获得当前行数据
				, layEvent = obj.event; //获得 lay-event 对应的值
			if(layEvent === 'edit'){
				var uid={'uid':data.uid};
				uid=JSON.stringify(uid);
				layer.msg('查看操作');
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
							 aducation1=JSON.parse(msg.split("%")[2])[0];
							 if(JSON.parse(msg.split("%")[2]).length>1){
								 aducation2=JSON.parse(msg.split("%")[2])[1];
							 }
						 }
					},error:function (err) {
						console.log(err);
					}
				});
				layer.open({
					type: 2,
					area: ['1000px', '100%'],
					btn: ['返回'],
					btn1: function(index, layero){
						layer.close(index);
					},
					content: 'useResume' //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
					,success: function(layero, index){
						console.log(social1.length);
						var form=layui.form;
						var body=layer.getChildFrame('body',index);
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
							}
						}
						if(aducation1!=null){
							body.find("input[id=adtime1]").val(aducation1.adtime);
							body.find("input[id=sname1]").val(aducation1.sname);
							body.find("input[id=profession1]").val(aducation1.profession);
							if(aducation2!=null){
								body.find("input[id=adtime2]").val(aducation2.adtime);
								body.find("input[id=sname2]").val(aducation2.sname);
								body.find("input[id=profession2]").val(aducation2.profession);
							}
						}




					}
				});




			}
		})
	})


</script>
</body>
</html>
