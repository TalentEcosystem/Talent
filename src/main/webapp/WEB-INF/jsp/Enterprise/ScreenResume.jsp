<%--
  Created by IntelliJ IDEA.
  User: chen
  Date: 2020/4/13
  Time: 21:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>简历筛选</title>
    <%String path = request.getContextPath();%>
    <link rel="stylesheet" href=<%=path+"/js/layui/css/layui.css" %>>
    <script src="<%=path+"/js/jquery-3.4.1.js"%>"></script>
    <script charset="UTF-8" src="<%=path+"/js/layui/layui.js"%>"></script>
</head>
<body>
<input type="hidden" id="path" value="<%=path%>">
<h1  style="background-color: #d2d2d2;font-weight:bold;text-align:center;margin-top: 15px">反馈情况</h1>
<form class="layui-form" lay-filter="component-form-group" id="search_submits" onsubmit="return false" style="margin-top: 15px">
    <div class="layui-form layui-card-header layuiadmin-card-header-auto" lay-filter="layadmin-useradmin-formlist">
        <div class="layui-inline">
            <label class="layui-form-label">学校：</label>
            <div class="layui-input-inline">
                <select name="industryid" id="industryid" lay-filter="chooseSchool"  >
                    <option value="0" >请选择学校</option>
                    <c:if test="${schoolMsgList!=null}">
                        <c:forEach items="${schoolMsgList}" begin="0" var="i">
                            <option value="${i.sid}">${i.schoolname}</option>
                        </c:forEach>
                    </c:if>
                </select>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">专业：</label>
            <div class="layui-input-inline">
            <select name="profess" id="profess" lay-filter="chooseProfess">
                <option value="0" >请选择专业</option>
                <c:if test="${professionList!=null}">
                    <c:forEach items="${professionList}" begin="0" var="i">
                        <option value="${i.professid}">${i.professname}</option>
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
<table id="demo" lay-filter="test" style="margin-top: 50px"></table>
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
            ,url: path+"/Enterprise/findScreenResumeInfo" //数据接口
            ,page: true //开启分页
            ,limit:5
            ,limits:[5,10,20,50,100]
            ,cols: [[ //表头
                {field: 'interviewid', title: 'ID', width: 80,hide:true}
                ,{field: 'industryid', title: '行业ID', width: 80,hide:true}
                ,{field: 'positionid', title: '岗位ID', width:150,hide:true}
                ,{field: 'uid', title: '应聘者', width:200,hide:true}
                ,{field: 'uname', title: '应聘者', width:150}
                ,{field: 'professname', title: '专业', width:100}
                ,{field: 'schoolname', title: '高校名称', width:150}
                ,{field: 'endtime', title: '反馈时间', width:200}
                ,{fixed: 'right',title:'操作', width: 200, align:'center', toolbar: '#barDemo'}
            ]]
        })
        table.on('tool(test)', function(obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性
            var data = obj.data //获得当前行数据
                ,event = obj.event;
            if (event ==='detail'){
                var uid={'uid':data.uid};
                uid=JSON.stringify(uid);
                layer.msg('查看操作');
                $.ajax({
                    url:'${pageContext.request.contextPath}/school/findResume',
                    type:'post',
                    data:'uid='+uid,
                    dataType:'text',
                    success:function(msg){
                        layer.msg(msg);
                    },error:function (err) {
                        console.log(err);
                    }
                });
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
                        layer.msg('查看用户简历');
                    }
                });
            }
            else if (event ==='update'){
                if (data.interstate ==='未面试'){
                    layer.msg('尚未完成面试无法应聘');
                    return false;
                }else if (data.employ ==='已录用'){
                    layer.msg('已录用');
                    return false;
                }else{
                    var interviewid = data.interviewid;
                    $.ajax({
                        url:path+"/Enterprise/companyEmploy",
                        dataType:"text",
                        type:"POST",
                        data:{"interviewid":interviewid,"employ":'录用'},
                        success:function (msg) {
                            if (msg === 'success'){
                                alert("应聘成功！");
                                window.location.reload();
                            }else{
                                alert("录用失败")
                            }
                        },
                        error:function () {
                             alert("网络繁忙！")
                        }
                    })
                }
            }
        })
    })
</script>

</html>
