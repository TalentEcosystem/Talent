<%--
  Created by IntelliJ IDEA.
  User: chen
  Date: 2020/4/13
  Time: 20:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>求职进度查看</title>
    <%String path = request.getContextPath();%>
    <link rel="stylesheet" href=<%=path+"/js/layui/css/layui.css" %>>
    <script src="<%=path+"/js/jquery-3.4.1.js"%>"></script>
    <script charset="UTF-8" src="<%=path+"/js/layui/layui.js"%>"></script>
</head>
<body>
<input type="hidden" id="path" value="<%=path%>">
<input type="hidden" id="interviewid" >
<table id="tables" lay-filter="tests"></table>
<div class="layui-inline">
    <button class="layui-btn" lay-submit="backs_submits" lay-filter="backs" onclick="backs()">返回</button>
</div>

</body>
<script>
    var path=$('#path').val();
    layui.use(['form', 'layer', 'jquery','table'], function(){
        var form = layui.form;
        var layer = layui.layer;
        var $ = layui.jquery;
        var table = layui.table;
        var interviewid = $("#interviewid").val()
        var tableinfs = table.render({
            elem: '#tables'
            ,height: 300
            //设置查询刷新的ID
            ,id:'table1'
            ,url: path+"/admin/jobProgress?interviewid="+interviewid //数据接口
            ,cols: [[ //表头
                {field: 'check', title: '是否查看', width:200}
                ,{field: 'invate', title: '是否邀请', width:150}
                ,{field: 'interstate', title: '是否面试', width:200}
                ,{field: 'employ', title: '是否录用', width:200}
            ]]
        })

    })
    function backs() {
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);//关闭弹出的子页面窗口 layer.index表示当前层
        window.parent.location.reload();//刷新父级界面
    }
</script>
</html>
