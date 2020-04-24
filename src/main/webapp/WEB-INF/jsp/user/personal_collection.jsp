<%--
  Created by IntelliJ IDEA.
  User: Minzg
  Date: 2020/4/13
  Time: 16:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>个人中心-我的收藏</title>
	<%
		String path=request.getContextPath();
	%>
	<link rel="stylesheet" href=<%=path+"/js/layui/css/layui.css"%>>
	<script src=<%=path+"/js/layui/layui.js" %>></script>
	<link rel="stylesheet" href=<%=path+"/css/personal.css"%>>
	<script src=<%=path+"/js/jquery-3.4.1.js" %>></script>
	<script type="text/javascript" src=<%=path+"/js/front/personals.js" %>></script>
</head>
<body>
<input type="hidden" id="path" value="<%=path%>">
<div class="header">
	<div class="headerMain">
		<div class="Notice">
			<span>公告：</span>
			<a href="">有实力就不怕平庸 如何离高薪更进一步</a>
		</div>
	</div>
</div>
<div class="navTop">
	<div class="navTopmain">
		<div class="logo"><a href="index.html"><img src=<%=path+"/images/logo_1.png" %>/><img src=<%=path+"/images/logo_2.png" %> /></a></div>
		<div class="nav">
			<div class="navItem"><a href=<%=path+"/user/index" %>>首页</a></div>
			<div class="navItem"><a href=<%=path+"/HomePage/searchJob" %>>职位搜索</a></div>
			<div class="navItem"><a href="">招聘会</a></div>
			<div class="navItem"><a href="">政府招考</a></div>
			<div class="navItem"><a href="">校园招聘</a></div>
			<div class="navItem other">
				<div style="position:relative;">
					<span>更多</span>
					<div id="TopNavMorePopup">
						<ul>
							<li><a href="">敬请期待</a></li>
							<li><a href="">敬请期待</a></li>
							<li><a href="">敬请期待</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="personalBody" id="searchTable">
	<div class="perLeftnav">
		<div class="NavLeftTop">个人中心</div>
		<div class="NavLeftMain">
			<div class="NavLeftBox">
				<a href=<%=path+"/user/personal" %> class="a7">个人信息</a>
			</div>
			<div class="NavLeftBox">
				<a href=<%=path+"/school/findUserResume" %> class="a2">我的简历</a>
			</div>
			<div class="NavLeftBox">
				<a href=<%=path+"/user/study"%> class="a3">学习记录</a>
			</div>
			<div class="NavLeftBox active">
				<a href=<%=path+"/user/collection"%> class="a5">我的收藏</a>
			</div>
			<div class="NavLeftBox">
				<a href=<%=path+"/user/requestFeedback" %> class="a6">求职反馈</a>
			</div>
			<div class="NavLeftBox">
				<a href=<%=path+"/user/help" %> class="a8">帮助中心</a>
			</div>
		</div>
	</div>
	<div class="perRightcon">
		<div class="commonTit">
			<h1 class="fl">我的收藏</h1>
		</div>
		<div class="clear"></div>
		<div class="demoTable">
			行业：
			<div class="layui-inline">
				<input class="layui-input" name="id" id="indname" autocomplete="off">
			</div>
			岗位：
			<div class="layui-inline">
				<input class="layui-input" name="id" id="positionname" autocomplete="off">
			</div>
			<button class="layui-btn" data-type="reload">搜索</button>
		</div>
		<div class="layui-anim layui-anim-scale">
			<table id="dataTable" lay-filter="test"></table>
		</div>
		<script type="text/html" id="butdiv">
			<button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="check" ><i class="layui-icon">&#xe615;</i>查看详情</button>
		</script>
	</div>
	<div class="adBox" >
		<img style="margin-left: 15px;margin-top: 10px" src=<%=path+"/images/perAD.jpg" %> width="814" />
	</div>
</div>
<div class="clear"></div>
<div class="footer">
	<p><a href="">**人才</a>旗下<img src=<%=path+"/images/logo_foot.gif" %> />蝶飞人才网版权所有 <a href="">京ICP证0******9号</a><a href=""></a>本网站所有招聘信息，未经书面授权不得转载 投诉电话：400-8**-****</p>
</div>
<script>
	//JavaScript代码区域
	layui.use(['upload', 'jquery', 'layer','table','laydate'], function () { //导入模块
		$ = layui.jquery;
		var form = layui.form;
		var table = layui.table;
		var path = $("#path").val();
		//第一个实例
		table.render({
			elem: '#dataTable'
			, height: 280
			, url: path + '/user/myCollection' //数据接口
			, page: true //开启分页
			, id: 'searchTable'
			, limit: 5
			, limits: [5, 10, 15, 20]
			, cols: [[ //表头
				{field: 'xuhao', title: '序号', width: 63, sort: true, fixed: 'left', align: 'center',type:'numbers'}
				, {field: 'indname', title: '行业', width: 120, sort: true, fixed: 'left', align: 'center'}
				, {field: 'companyname', title: '发布者', width: 150, align: 'center'}
				, {field: 'positionname', title: '岗位', width: 180, sort: true, align: 'center'}
				, {field: 'positiontime', title: '发布时间', width: 164, sort: true, align: 'center',
					// templet:function (data) {
					// 	var positiontime1 = new Date(data.positiontime).toJSON();
					// 	var positiontime = new Date(+new Date(positiontime1)+8*3600*1000).toISOString().replace(/T/g,' ').replace(/\.[\d]{3}Z/,'');
					// 	return positiontime;
					// }
					templet : "<div> {{layui.util.toDateString(d.positiontime,'yyyy-MM-dd HH:mm:ss')}}</div>"
					}
				, {field: '', title: '操作', toolbar: "#butdiv", width: 130, align: 'center'}
			]]
		});

		$('#searchTable .layui-btn').on('click', function () {
			var type = $(this).data('type');
			if (type == 'reload') {
				//执行重载
				table.reload('searchTable', {
					page: {
						curr: 1 //重新从第 1 页开始
					}
					, where: {
						positionname: $("#positionname").val(),
						indname: $("#indname").val(),
					}
				});
			}
		});


		//查看详情
		//注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
		table.on('tool(test)', function(obj){
			var positiontime =layui.util.toDateString(obj.data.positiontime,'yyyy-MM-dd HH:mm:ss');
			var indname = obj.data.indname;
			var companyname = obj.data.companyname;
			var positionname = obj.data.positionname;
			var path1 = $("#path").val();
			var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
			if(layEvent === 'check'){ //查看
				$.ajax({
					async:true,
					method : "POST",
					url :path1+'/user/checkJob',
					data: {"positiontime":positiontime,"indname":indname,"companyname":companyname,"positionname":positionname},
					dataType : "text",
					success:function(msg){
						if ("1111"==msg){
							location.href=path1+"/user/jobDetails"
						}else {
							layer.alert("网络繁忙",{icon:2});
						}
					}
				})
			}
		 });
	});
</script>
</body>
</html>

