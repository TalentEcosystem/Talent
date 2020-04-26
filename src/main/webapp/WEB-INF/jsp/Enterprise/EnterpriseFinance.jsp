<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>企业订单</title>
    <%String path = request.getContextPath();%>
    <link rel="stylesheet" href=<%=path+"/js/layui/css/layui.css" %>>
    <script src="<%=path+"/js/jquery-3.4.1.js"%>"></script>
    <script charset="UTF-8" src="<%=path+"/js/layui/layui.js"%>"></script>

</head>
<body>
<input type="hidden" id="path" value="<%=path%>">
<form class="layui-form" action="" onsubmit="return false;">
    <div class="layui-form-item login-div"id="demotable" style="margin-top: 2%">
        <label class="layui-form-label username-lable">订单号:</label>
        <div class="layui-input-inline">
            <input type="text" name="tradeno" id="tradeno" placeholder="请输入订单号" class="layui-input">
        </div>
        <label class="layui-form-label doctime1-lable">文档时间：</label>
        <div class="layui-input-inline">
            <input type="date" name="startTime" id="startTime" placeholder="请输入起始时间" class="layui-input">
        </div>
        <div class="layui-input-inline">
            <input type="date" name="endTime" id="endTime" placeholder="请输入最终时间" class="layui-input">
        </div>
        <div>
        <button class="layui-btn" lay-submit lay-filter="subForm">查询</button>
        </div>
        <label class="layui-form-label username-lable" style="width: 200px">公司当前余额: ${money}</label>

    </div>
</form>
   <table class="layui-table" id="demo" lay-filter="demoTest"></table>
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
            ,id:'test'
            ,height: 400
            ,url:path+"/Enterprise/findFinances" //数据接口
            ,page: true //开启分页
            ,cols: [[ //表头
                {field: 'financeid', title: '订单id', width:80,sort: true,fixed: 'left'}
                ,{field: 'cid', title: '公司id', width:80,sort: true,hide:true}
                ,{field:'companyname',title:'公司', width:150, sort: true}
                ,{field:'price',title:'交易金额', width:150, sort: true}
                ,{field:'financetype',title:'事件', width:100, sort: true}
                ,{field:'financetime',title:'时间', width:200, sort: true,templet:"<div> {{layui.util.toDateString(d.financetime,'yyyy-MM-dd HH:mm:ss')}}</div>"}
                ,{field:'tradeno',title:'订单编号', width:200, sort: true}
                ,{field:'financestate',title:'订单状态', width:150, sort: true}
            ]]
        });
        form.on('submit(subForm)',function (data) {
            var tradeno = $("#tradeno").val();
            var startTime = $("#startTime").val();
            var endTime = $("#endTime").val();
            console.log("tradeno="+tradeno+" startTim="+startTime+" endTime="+endTime);
            tableinf.reload({
                url:path+"/Enterprise/findFinances",
                page: {
                    curr: 1 //重新从第 1 页开始
                },
                where:{
                    tradeno:tradeno,
                    startTime:startTime,
                    endTime:endTime,
                }
            });
        });

    })
</script>
</html>
