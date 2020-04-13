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
    <title>反馈情况</title>
    <%String path = request.getContextPath();%>
    <link rel="stylesheet" href=<%=path+"/js/layui/css/layui.css" %>>
    <script src="<%=path+"/js/jquery-3.4.1.js"%>"></script>
    <script charset="UTF-8" src="<%=path+"/js/layui/layui.js"%>"></script>
</head>
<body>
<input type="hidden" id="path" value="<%=path%>">
<form class="layui-form" lay-filter="component-form-group" id="search_submits" onsubmit="return false">
<h1  style="background-color: #d2d2d2;font-weight:bold;text-align:center;margin-top: 15px">反馈情况</h1>
    <div class="layui-inline">
        <button class="layui-btn" lay-submit="search_submits" lay-filter="check">已查看</button>
        <button class="layui-btn" lay-submit="search_submits" lay-filter="invate">已邀请</button>
        <button class="layui-btn" lay-submit="search_submits" lay-filter="interstate">已面试</button>
        <button class="layui-btn" lay-submit="search_submits" lay-filter="employ">已录用</button>
    </div>
</form>
<table id="demo" lay-filter="test"></table>
<script type="text/html" id="barDemo">
    <button lay-event="detail" type="button" class="layui-btn layui-btn-xs layui-btn-radius">
        查看简历
    </button>
    <button lay-event="update" type="button" class="layui-btn layui-btn-xs layui-btn-radius">
        应聘
    </button>
</script>
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
            ,url: path+"/Enterprise/findFeedbackInfo" //数据接口
            ,page: true //开启分页
            ,limit:5
            ,limits:[5,10,20,50,100]
            ,cols: [[ //表头
                {field: 'interviewid', title: 'ID', width: 80,hide:true}
                ,{field: 'industryid', title: '行业ID', width: 80,hide:true}
                ,{field: 'positionid', title: '岗位ID', width:150,hide:true}
                ,{field: 'uid', title: '应聘者', width:200,hide:true}
                ,{field: 'uname', title: '应聘者', width:150}
                ,{field: 'intertime', title: '应聘时间', width:200,hide:true}
                ,{field: 'professname', title: '专业', width:100}
                ,{field: 'invate', title: '是否邀请', width:150}
                ,{field: 'check', title: '是否查看', width:200}
                ,{field: 'interstate', title: '是否面试', width:200}
                ,{field: 'employ', title: '是否录用', width:200}
                ,{field: 'schoolname', title: '高校名称', width:150}
                ,{field: 'endtime', title: '反馈时间', width:200}
                ,{fixed: 'right',title:'操作', width: 200, align:'center', toolbar: '#barDemo'}
            ]]
        })
        form.on('submit(check)',function (obj) {
            var data =obj.data;
            var check = data.check;
            console.log(check);
        })
        form.on('submit(invate)',function (obj) {
            var data =obj.data;
            var invate =data.invate;
            console.log(invate);
        })
        form.on('submit(interstate)',function (obj) {
            var data =obj.data;
            var interstate =data.interstate;
            console.log(interstate);
        })
        form.on('submit(employ)',function (obj) {
            var data =obj.data;
            var employ =data.employ;
            console.log(employ);
        })

    })
</script>

</html>
