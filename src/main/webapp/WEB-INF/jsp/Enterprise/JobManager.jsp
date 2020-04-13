<%--
  Created by IntelliJ IDEA.
  User: chen
  Date: 2020/4/12
  Time: 12:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>求职管理</title>
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
                            <option value="${i.industryid}">${i.indname}</option>
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
            <button class="layui-btn" lay-submit="search_submits" lay-filter="search">查询</button>
        </div>
    </div>
</form>
<table id="demo" lay-filter="test"></table>
</body>
<script type="text/html" id="barDemo">
    <button lay-event="detail" type="button" class="layui-btn layui-btn-xs layui-btn-radius">查看简历</button>
    <button lay-event="update" type="button" class="layui-btn layui-btn-xs layui-btn-radius">面试邀请</button>
    <button lay-event="updates" type="button" class="layui-btn layui-btn-xs layui-btn-radius">拒绝邀请</button>
    <button lay-event="derived" type="button" class="layui-btn layui-btn-xs layui-btn-radius layui-btn layui-btn-danger">导出信息</button>
</script>
<script>
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
            ,height: 300
            //设置查询刷新的ID
            ,id:'table1'
            ,url: path+"/Enterprise/findInterviews" //数据接口
            ,page: true //开启分页
            ,limit:5
            ,limits:[5,10,20,50,100]
            ,cols: [[ //表头
                {field: 'interviewid', title: 'ID', width: 80,hide:true}
                ,{field: 'industryid', title: '行业ID', width: 80,hide:true}
                ,{field: 'indname', title: '招聘行业', width:150}
                ,{field: 'positionid', title: '岗位ID', width:150,hide:true}
                ,{field: 'positionname', title: '岗位', width:150}
                ,{field: 'uid', title: '应聘者', width:200,hide:true}
                ,{field: 'uname', title: '应聘者', width:150}
                ,{field: 'intertime', title: '应聘时间', width:200,hide:true}
                ,{field: 'professname', title: '专业', width:100}
                ,{field: 'utel', title: '联系方式', width:200}
                ,{field: 'invate', title: '是否邀请', width:150}
                ,{field: 'presenter', title: '推荐者', width:150}
                ,{field: 'check', title: '是否查看', width:200,hide:true}
                ,{field: 'interstate', title: '是否面试', width:200,hide:true}
                ,{field: 'employ', title: '是否录用', width:200,hide:true}
                ,{field: 'sid', title: '高校ID', width:200,hide:true}
                ,{field: 'schoolname', title: '高校名称', width:150}
                ,{fixed: 'right',title:'操作', width: 200, align:'center', toolbar: '#barDemo'}
            ]]
        })
        table.on('tool(test)', function(obj){
            var data = obj.data,
                event = obj.event;
            if (event === 'detail') {

            }
            else if(event === 'update'){
              var interviewid = data.interviewid;
              var check = data.check;
              if (check ==='已查看'){
              console.log(interviewid);
              $.ajax({
                  type:"POST",
                  url:path+"/Enterprise/updateInterInvate",
                  dataType:"text",
                  data:{"interviewid":interviewid,"invate":'邀请'},
                  success:function (msg) {
                      if (msg ==='success') {
                          alert("面试邀请成功！");
                          window.location.reload()
                      }else {
                          layer.msg("面试邀请失败！")
                      }
                  },
                  error:function () {
                      alert("服务器繁忙!");
                  }
              })
            }else{
                alert("需要先查看简历才能决定是否进行面试邀请")
              }
            }
            else if(event === 'updates'){
                var interviewid = data.interviewid;
                var check = data.check;
                if (check ==='已查看'){
                    console.log(interviewid);
                    $.ajax({
                        type:"POST",
                        url:path+"/Enterprise/updateInterInvate",
                        dataType:"text",
                        data:{"interviewid":interviewid,"invate":'拒绝'},
                        success:function (msg) {
                            if (msg ==='success') {
                                alert("拒绝邀请成功！");
                                window.location.reload()
                            }else {
                                layer.msg("拒绝邀请失败！")
                            }
                        },
                        error:function () {
                            alert("服务器繁忙!");
                        }
                    })
                }else{
                    alert("需要先查看简历才能决定是否进行面试邀请")
                }
            }
            else if (event === 'derived'){

            }

        })
        form.on('submit(search)',function (data) {
            var myselect = document.getElementById("industryid");
            var index = myselect.selectedIndex;
            industryid = myselect.options[index].value;

            var positionname = $("#positionname").val();

            console.log("industryid="+industryid+"positionname="+positionname)
            tableinf.reload({
                url:path+"/Enterprise/findInterviews",
                page: {
                    curr: 1 //重新从第 1 页开始
                },
                where:{
                    industryid:industryid,
                    positionname:positionname
                }
            });

        });

    })
</script>
</html>
