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
	<title>个人中心-个人信息</title>
	<%
		String path=request.getContextPath();
		String uname = (String) session.getAttribute("uname");
		String uaccount = (String) session.getAttribute("uaccount");
		String utel = (String) session.getAttribute("utel");
		String phone = utel.substring(0,3)+"****"+utel.substring(7,11);
		String uaddress = (String) session.getAttribute("uaddress");
		String uhead = (String) session.getAttribute("uhead");
		String usex = (String) session.getAttribute("usex");
		String uage = (String) session.getAttribute("uage");
	%>
	<link rel="stylesheet" href=<%=path+"/js/layui/css/layui.css"%>>
	<link rel="stylesheet" href=<%=path+"/css/personal.css"%>>
	<script src=<%=path+"/js/jquery-3.4.1.js" %>></script>
	<script type="text/javascript" src=<%=path+"/js/front/personals.js" %>></script>
	<script src=<%=path+"/js/layui/layui.js" %>></script>
</head>
<body>
<input type="hidden" id="path" value="<%=path%>">
<div class="header">
	<div class="headerMain">
		<div class="Notice">
			<span>公告：</span>
			<a href="">有实力就不怕平庸 如何离高薪更进一步</a>
		</div>
		<div class="Account">
			<div class="Left">
				<div class="Info">
					<font>[28421947]</font>
					<input type="button">
					<div id="InfoPopup">
						<ul>
							<li><a href="personal_updatepsd.html">修改密码</a></li>
							<li><a href="personal_updatenum.html">修改手机</a></li>
							<li><a href="personal_renzheng.html">修改邮箱</a></li>
							<li><a href="index.html">退出</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="Left">
				<a class="Mobile" href="">手机版</a>
			</div>
			<div class="Left">
				<div class="Weixin">微信
					<div id="WeixinPopup">
						<img src=<%=path+"/images/showqrcode.jpg" %> width="120" height="120">
						<p>扫一扫完成绑定<br>求职信息接收及时，<br>不再错过好工作！</p>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
<div class="navTop">
	<div class="navTopmain">
		<div class="logo"><a href="index.html"><img src=<%=path+"/images/logo_1.png" %>/><img src=<%=path+"/images/logo_2.png" %> /></a></div>
		<div class="nav">
			<div class="navItem"><a href=<%=path+"/user/index" %>>首页</a></div>
			<div class="navItem"><a href="searchJob.html">职位搜索</a></div>
			<div class="navItem"><a href="meetingJob.html">招聘会</a></div>
			<div class="navItem"><a href="">政府招考</a></div>
			<div class="navItem"><a href="">校园招聘</a></div>
			<div class="navItem other">
				<div style="position:relative;">
					<span>更多</span>
					<div id="TopNavMorePopup">
						<ul>
							<li><a href="jobnews.html">就业资讯</a></li>
							<li><a href="download.html">文档下载</a></li>
							<li><a href="helpJob.html">求职互助</a></li>
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
				<a href="personal_jl.html" class="a2">我的简历</a>
			</div>
			<div class="NavLeftBox">
				<a href=<%=path+"/user/study"%> class="a3">学习记录</a>
			</div>
			<div class="NavLeftBox">
				<a href=<%=path+"/user/collection"%> class="a5">我的收藏</a>
			</div>
			<div class="NavLeftBox active">
				<a href=<%=path+"/user/requestFeedback" %> class="a6">求职反馈</a>
			</div>
			<div class="NavLeftBox">
				<a href="personal_help.html" class="a8">帮助中心</a>
			</div>
		</div>
		<div class="navLeftBottom">
			<span class="sys">扫一扫绑定微信</span><br />
			<img src=<%=path+"/images/showqrcode.jpg" %> />
			<span class="Notice">蝶飞人才网<br>找工作更靠谱</span>
		</div>
	</div>
	<div class="perRightcon">
		<div class="commonTit">
			<h1 class="fl">求职反馈</h1>
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
			, url: path + '/user/myRequestFeedback' //数据接口
			, page: true //开启分页
			, id: 'searchTable'
			, limit: 5
			, limits: [5, 10, 15, 20]
			, cols: [[ //表头
				{field: 'xuhao', title: '序号', width: 63, sort: true, fixed: 'left', align: 'center',type:'numbers'}
				, {field: 'indname', title: '行业', width: 120, sort: true, fixed: 'left', align: 'center'}
				, {field: 'positionname', title: '岗位', width: 150, align: 'center'}
				, {field: 'companyname', title: '企业', width: 180, sort: true, align: 'center'}
				, {field: 'companyphone', title: '联系方式', width: 164, sort: true, align: 'center'}
				, {field: 'invate', title: '状态', width: 130, align: 'center'}
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


		//删除
		//注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
		table.on('tool(test)', function(obj){
			var data = obj.data; //获得当前行数据
			var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
			var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
			var path1 = $("#path").val();
			if(layEvent === 'delete'){ //查看
				$.ajax({
					async:true,
					method : "POST",
					url :path1+'/user/deleteDocumentInf',
					data: data,
					dataType : "text",
					success:function(data){
						if ("success"==data){
							layer.alert("删除成功",{icon:6},function () {
								window.parent.location.reload();
							});
						}else {
							layer.alert("删除失败",{icon:2});
						}
					}
				})
			}
		});
	});
</script>
</body>
</html>

