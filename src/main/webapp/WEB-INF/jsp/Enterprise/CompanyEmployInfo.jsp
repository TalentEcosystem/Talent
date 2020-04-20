<%--
  Created by IntelliJ IDEA.
  User: chen
  Date: 2020/4/13
  Time: 21:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>已录用人员信息</title>
    <%String path = request.getContextPath();%>
    <link rel="stylesheet" href=<%=path+"/js/layui/css/layui.css" %>>
    <script src="<%=path+"/js/jquery-3.4.1.js"%>"></script>
    <script charset="UTF-8" src="<%=path+"/js/layui/layui.js"%>"></script>
</head>
<body>
<input type="hidden" id="path" value="<%=path%>">
<h1  style="background-color: #d2d2d2;font-weight:bold;text-align:center;margin-top: 15px">已录用人员信息</h1>
<table id="demo" lay-filter="test"></table>
<span>
	<button type="button" class="layui-btn layui-btn-primary layui-btn-radius" style="right: auto">
		<a href="javascript:history.back(-1)">返回</a>
	</button>
</span>
</body>
<script>
    var path=$('#path').val();
    layui.use(['form', 'layer', 'jquery','table'], function(){
        var form = layui.form;
        var layer = layui.layer;
        var $ = layui.jquery;
        var table = layui.table;

        var tableinf = table.render({
            elem: '#demo'
            ,height: 300
            //设置查询刷新的ID
            ,id:'table1'
            ,url: path+"/Enterprise/findCompanyEmployInfo" //数据接口
            ,page: true //开启分页
            ,limit:5
            ,limits:[5,10,20,50,100]
            ,cols: [[ //表头
                {field: 'interviewid', title: 'ID', width: 80,hide:true}
                ,{field: 'industryid', title: '行业ID', width: 80,hide:true}
                ,{field: 'positionid', title: '岗位ID', width:150,hide:true}
                ,{field: 'uid', title: '应聘者', width:200,hide:true}
                ,{field: 'uname', title: '应聘者', width:150}
                ,{field: 'utel', title: '手机号', width:150}
                ,{field: 'degreename', title: '学历', width:200}
                ,{field: 'professname', title: '专业', width:100}
                ,{field: 'schoolname', title: '高校名称', width:150}
                ,{field: 'endtime', title: '反馈时间', width:200,templet:"<div> {{layui.util.toDateString(d.endtime,'yyyy-MM-dd HH:mm:ss')}}</div>"}
            ]]
        })
    })
</script>

</html>
