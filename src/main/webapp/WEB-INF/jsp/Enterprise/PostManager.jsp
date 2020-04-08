<%--
  Created by IntelliJ IDEA.
  User: chen
  Date: 2020/4/8
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>岗位管理</title>
    <%String path = request.getContextPath();%>
    <link rel="stylesheet" href=<%=path+"/js/layui/css/layui.css" %>>
    <script src="<%=path+"/js/jquery-3.4.1.js"%>"></script>
    <script charset="UTF-8" src="<%=path+"/js/layui/layui.js"%>"></script>

</head>
<body>
<input type="hidden" id="path" value="<%=path%>">
<form class="layui-form" lay-filter="component-form-group" id="search_submits" onsubmit="return false" style="margin-top: 15px">
    <div class="layui-form layui-card-header layuiadmin-card-header-auto" lay-filter="layadmin-useradmin-formlist">
        <div class="layui-inline">
            <label class="layui-form-label">招聘行业：</label>
            <div class="layui-input-inline">
                <select name="industryid" id="industryid" lay-filter="choosePosition"  >
                    <option value="0" >请选择行业</option>
                    <c:if test="${industry!=null}">
                        <c:forEach items="${industry}" begin="0" var="i">
                            <option  value="${i.industryid}">${i.indname}</option>
                        </c:forEach>
                    </c:if>
                </select>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">招聘岗位：</label>
            <div class="layui-input-block">
                <input type="text" name="positionname" id="positionname" placeholder="请输入岗位" class="layui-input">
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">学历:</label>
            <div class="layui-input-block">
                <select name="degree" id="degree" lay-filter="chooseDegree" >
                    <option value="0" >请选择学历</option>
                    <c:if test="${degree!=null}">
                        <c:forEach items="${degree}" begin="0" var="j">
                            <option  value="${j.degreeid}">${j.degreename}</option>
                        </c:forEach>
                    </c:if>
                </select>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">专业:</label>
            <div class="layui-input-block">
                <select name="profession" id="profession" lay-filter="chooseProfession">
                    <option value="0" >请选择专业</option>
                    <c:if test="${profession!=null}">
                        <c:forEach items="${profession}" begin="0" var="k">
                            <option  value="${k.professid}">${k.professname}</option>
                        </c:forEach>
                    </c:if>
                </select>
            </div>
        </div>
        <div class="layui-inline">
            <button class="layui-btn" lay-submit="search_submits" lay-filter="search">查询</button>
        </div>
    </div>
</form>
<table id="demo" lay-filter="test"></table>
</body>
<script type="text/javascript">
    var path=$('#path').val();

    layui.use(['form', 'layer', 'jquery','table','layedit', 'laydate'], function(){
        var form = layui.form;
        var layer = layui.layer;
        var $ = layui.jquery;
        var table = layui.table;
        var layedit = layui.layedit;
        var laydate = layui.laydate;

        var tableinf = table.render({
                elem: '#demo'
                ,height: 280
                //设置查询刷新的ID
                ,id:'table1'
                ,url: path+"/Enterprise/findPositions" //数据接口
                ,page: true //开启分页
                ,limit:5
                ,limits:[5,10,20,50,100]
                ,cols: [[ //表头
                    {field: 'positionid', title: 'ID', width: 80,hide:true}
                    ,{field: 'industryid', title: '招聘行业', width:150,hide:true}
                    ,{field: 'indname', title: '招聘行业', width:150}
                    ,{field: 'positionname', title: '招聘岗位', width:200}
                    ,{field: 'aid', title: '发布者', width:200,hide:true}
                    ,{field: 'name', title: '发布者', width:100}
                    ,{field: 'positiontime', title: '发布时间', width:200,templet: "<div>{{layui.util.toDateString(d.ordertime, 'yyyy-MM-dd HH:mm:ss')}}</div>"}
                    ,{field: 'money', title: '参考薪资(元)', width:150}
                    ,{field: 'degreename', title: '学历要求', width:150}
                    ,{field: 'professname', title: '专业要求', width:150}
                    ,{field: 'maxnum', title: '招聘人数', width: 120, sort: true}
                    ,{field: 'positionstate', title: '发布状态', width: 110}
                    // ,{fixed: 'right', width: 320, align:'center', toolbar: '#barDemo'}
                ]]
            });
        form.on('submit(search)',function (data) {
            var myselect=document.getElementById("industryid");
            var index=myselect.selectedIndex;
            var industryid = myselect.options[index].value;

            var myselect1=document.getElementById("degree");
            var index1=myselect1.selectedIndex;
            var degree = myselect.options[index1].value;

            var myselect2=document.getElementById("profession");
            var index2=myselect2.selectedIndex;
            var profession = myselect.options[index2].value;

            var positionname = $("#positionname").val();

            console.log("industryid="+industryid+"degree="+degree+"profession="+profession+"positionname="+positionname)
            tableinf.reload({
                url:path+"/Enterprise/findPositions",
                page: {
                    curr: 1 //重新从第 1 页开始
                },
                where:{
                    industryid:industryid,
                    degreeid:degree,
                    professid:profession,
                    positionname:positionname
                }
            });
        })

    })

</script>
</html>
