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
                <select name="school" id="school" lay-filter="chooseSchool"  >
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
    <button lay-event="down" type="button" class="layui-btn layui-btn-xs layui-btn-radius">
      下载
    </button>
    <button lay-event="update" type="button" class="layui-btn layui-btn-xs layui-btn-radius">
        邀请
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
                {field: 'uid', title: '应聘者', width:200,hide:true}
                ,{field: 'resumeid', title: '应聘者', width:200,hide:true}
                ,{field: 'resname', title: '应聘者', width:150}
                ,{field: 'professname', title: '专业', width:100}
                ,{field: 'sid', title: '学校id', width:200,hide:true}
                ,{field: 'schoolname', title: '高校名称', width:150}
                ,{field: 'operationtime', title: '发布时间', width:200,templet:"<div> {{layui.util.toDateString(d.operationtime,'yyyy-MM-dd HH:mm:ss')}}</div>"}
                ,{fixed: 'right',title:'操作', width: 200, align:'center', toolbar: '#barDemo'}
            ]]
        })
        var resume="";
        var social1="";
        var aducation1="";
        var social2="";
        var aducation2="";
        table.on('tool(test)', function(obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性
            var data = obj.data //获得当前行数据
                ,event = obj.event;
            if (event ==='detail'){
                var resumeid =data.resumeid
                $.ajax({
                    url:'${pageContext.request.contextPath}/Enterprise/JudgeResume',
                    type:'post',
                    data:"resumeid="+resumeid,
                    dataType:'text',
                    success:function(msg){
                        if (msg == 'success'){
                            var uid={'uid':data.uid};
                            uid=JSON.stringify(uid);
                            $.ajax({
                                url:'${pageContext.request.contextPath}/Enterprise/findResume',
                                type:'post',
                                data:'uid='+uid,
                                dataType:'text',
                                success:function(msg){
                                    resume=JSON.parse(msg.split("%")[0]);
                                    console.log(resume)
                                    if(JSON.parse(msg.split("%")[1]).length!=0){
                                        if(JSON.parse(msg.split("%")[1]).length>1){
                                            social2=JSON.parse(msg.split("%")[1])[1];
                                            console.log(social2)
                                        }
                                        social1=JSON.parse(msg.split("%")[1])[0];
                                        console.log(social1)
                                    }
                                    if(JSON.parse(msg.split("%")[2]).length!=0){
                                        aducation1=JSON.parse(msg.split("%")[2])[0];
                                        console.log(aducation1)
                                        if(JSON.parse(msg.split("%")[2]).length>1){
                                            aducation2=JSON.parse(msg.split("%")[2])[1];
                                            console.log(aducation2)
                                        }
                                    }
                                    layer.open({
                                        type: 2,
                                        area: ['80%', '80%'],
                                        offset: ['10%','10%'],
                                        btn: ['返回'],
                                        btn1: function(index, layero){
                                            layer.close(index);
                                        },
                                        content: path+'/school/useResume' //这里content是一个URL，如果你不想让iframe出现滚动条，你还可以content: ['http://sentsin.com', 'no']
                                        ,success: function(layero, index){
                                            console.log(social1);
                                            var body=layer.getChildFrame('body',index);
                                            body.find("input[id=resname1]").empty();
                                            body.find("input[id=schoolname1]").empty();
                                            body.find("input[id=rebirth1]").empty();
                                            body.find("input[id=professname]").empty();
                                            body.find("input[id=repol]").empty();
                                            body.find("input[id=degreename]").empty();
                                            body.find("input[id=retel]").empty();
                                            body.find("input[id=readdress]").empty();
                                            body.find("input[id=hidepic]").empty();
                                            body.find("input[id=reskill12]").empty();
                                            body.find("input[id=reeva12]").empty();
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
                                            if(social1 != " "){
                                                body.find("input[id=socialtime1]").val(social1.socialtime);
                                                body.find("input[id=company1]").val(social1.company);
                                                body.find("input[id=content1]").val(social1.content);
                                                if(social2 != " "){
                                                    body.find("input[id=socialtime2]").val(social2.socialtime);
                                                    body.find("input[id=company2]").val(social2.company);
                                                    body.find("input[id=content2]").val(social2.content);
                                                }else{
                                                    body.find("input[id=socialtime2]").val("");
                                                    body.find("input[id=company2]").val("");
                                                    body.find("input[id=content2]").val("");
                                                }
                                            }else{
                                                body.find("input[id=socialtime1]").val("");
                                                body.find("input[id=company1]").val("");
                                                body.find("input[id=content1]").val("");
                                            }
                                            if(aducation1 != " "){
                                                body.find("input[id=adtime1]").val(aducation1.adtime);
                                                body.find("input[id=sname1]").val(aducation1.sname);
                                                body.find("input[id=profession1]").val(aducation1.profession);
                                                if(aducation2 != " "){
                                                    body.find("input[id=adtime2]").val(aducation2.adtime);
                                                    body.find("input[id=sname2]").val(aducation2.sname);
                                                    body.find("input[id=profession2]").val(aducation2.profession);
                                                }else{
                                                    body.find("input[id=adtime2]").val("");
                                                    body.find("input[id=sname2]").val("");
                                                    body.find("input[id=profession2]").val("");
                                                }
                                            }else{
                                                body.find("input[id=adtime1]").val("");
                                                body.find("input[id=sname1]").val("");
                                                body.find("input[id=profession1]").val("");
                                            }
                                        }
                                    });
                                },error:function (err) {
                                    console.log(err);
                                }
                            });
                        }else{
                            layer.confirm('尚未购买此简历，是否付费？', function (index) {
                                layer.open({
                                    type: 2,
                                    area: ['300px','200px'],
                                    offset: ['10%','10%'],
                                    content: path+'/Enterprise/path/Password',
                                    btn: ['确定','返回'],
                                    btn1:function(index, layero){
                                        var body=layer.getChildFrame('body',index);
                                       var password = body.find("#password").val();
                                       $.ajax({
                                           url:'${pageContext.request.contextPath}/Enterprise/JudgePassword',
                                           type:'post',
                                           data:"password="+password,
                                           dataType:'text',
                                           success:function(msg){
                                               if (msg ==="success"){
                                                   var vNow = new Date();
                                                   var sNow = "";
                                                   sNow += String(vNow.getFullYear());
                                                   sNow += String(vNow.getMonth() + 1);
                                                   sNow += String(vNow.getDate());
                                                   sNow += String(vNow.getHours());
                                                   sNow += String(vNow.getMinutes());
                                                   sNow += String(vNow.getSeconds());
                                                   sNow += String(vNow.getMilliseconds());
                                                   $.ajax({
                                                       url:'${pageContext.request.contextPath}/Enterprise/purchaseResume',
                                                       type:'post',
                                                       data:{"resumeid":resumeid,"tradeno":sNow},
                                                       dataType:'text',
                                                       success:function(msg){
                                                           if (msg ==="success"){
                                                               alert("付费成功！")
                                                               window.location.reload();
                                                           }else if (msg ==="deficiency"){
                                                               alert("余额不足，请先充值！")
                                                               window.location.href = path +'Enterprise/CompanyRecharge';
                                                           }else{
                                                               alert("付费失败")
                                                           }
                                                       },
                                                       error:function () {
                                                           alert("网络繁忙！")
                                                       }
                                                   })
                                               }else{
                                                   alert("验证失败，密码输入错误")
                                               }
                                           },
                                           error:function () {
                                               alert("网络繁忙！")
                                           }
                                       })
                                    },
                                    btn2: function(index, layero){
                                        layer.close(index);
                                    },
                                })

                            })

                        }
                    }
            })
            }
            else if (event ==='update'){
                layer.open({
                    type: 2,
                    area: ['80%', '80%'],
                    offset: ['10%', '10%'],
                    content: path+'/Enterprise/findPositionName'
                    ,success: function(layero, index){
                        var body=layer.getChildFrame('body',index);
                        body.find("#resname").val(data.resname);
                        body.find("#schoolname").val(data.schoolname);
                        body.find("#uid").val(data.uid);
                        body.find("#sid").val(data.sid);

                    }
                });
            }
            else if (event ==='down'){
                var resumeid =data.resumeid
                $.ajax({
                    url:'${pageContext.request.contextPath}/Enterprise/JudgeResume',
                    type:'post',
                    data:"resumeid="+resumeid,
                    dataType:'text',
                    success:function(msg){
                        if (msg == 'success'){
                            var uid1=data.uid;//获取文本框的值
                            var	operationtime1= layui.util.toDateString(data.operationtime,'yyyy-MM-dd HH:mm:ss');
                            $('<form action="${pageContext.request.contextPath}/Enterprise/outputTalent" method="post">'+
                                '<input type="hidden" name="uid" value="'+uid1+'"/>'+
                                '<input type="hidden" name="operationtime" value="'+operationtime1+'"/>'+
                                '</form>')
                                .appendTo('body').submit().remove();
                        }else{
                            layer.confirm('尚未购买此简历，是否付费？', function (index) {
                                layer.open({
                                    type: 2,
                                    area: ['300px','200px'],
                                    offset: ['10%','10%'],
                                    content: path+'/Enterprise/path/Payment',
                                    btn: ['确定','返回'],
                                    btn1:function(index, layero){
                                        var body=layer.getChildFrame('body',index);
                                        var payment = body.find("#payment").val();
                                        $.ajax({
                                            url:'${pageContext.request.contextPath}/Enterprise/JudgePassword',
                                            type:'post',
                                            data:"payment="+payment,
                                            dataType:'text',
                                            success:function(msg){
                                                if (msg ==="success"){
                                                    var vNow = new Date();
                                                    var sNow = "";
                                                    sNow += String(vNow.getFullYear());
                                                    sNow += String(vNow.getMonth() + 1);
                                                    sNow += String(vNow.getDate());
                                                    sNow += String(vNow.getHours());
                                                    sNow += String(vNow.getMinutes());
                                                    sNow += String(vNow.getSeconds());
                                                    sNow += String(vNow.getMilliseconds());
                                                    $.ajax({
                                                        url:'${pageContext.request.contextPath}/Enterprise/purchaseResume',
                                                        type:'post',
                                                        data:{"resumeid":resumeid,"tradeno":sNow},
                                                        dataType:'text',
                                                        success:function(msg){
                                                            if (msg ==="success"){
                                                                alert("付费成功！")
                                                                window.location.reload();
                                                            }else if (msg ==="deficiency"){
                                                                alert("余额不足，请先充值！")
                                                                window.location.href = path +'Enterprise/CompanyRecharge';
                                                            }else{
                                                                alert("付费失败")
                                                            }
                                                        },
                                                        error:function () {
                                                            alert("网络繁忙！")
                                                        }
                                                    })
                                                }else{
                                                    alert("验证失败，密码输入错误")
                                                }
                                            },
                                            error:function () {
                                                alert("网络繁忙！")
                                            }
                                        })
                                    },
                                    btn2: function(index, layero){
                                        layer.close(index);
                                    },
                                })

                            })

                        }
                    }
                })
            }
        })
        form.on('submit(search)',function () {
            var myselect = document.getElementById("school");
            var index = myselect.selectedIndex;
            var sid = myselect.options[index].value;

            var myselect1 = document.getElementById("profess");
            var index1 = myselect1.selectedIndex;
            var professid = myselect1.options[index1].value;

            tableinf.reload({
                url:path+"/Enterprise/findScreenResumeInfo",
                page: {
                    curr: 1 //重新从第 1 页开始
                },
                where:{
                    sid:sid,
                    professid:professid
                }
            });
        });
    })
</script>

</html>
