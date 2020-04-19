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
<h1  style="background-color: #d2d2d2;font-weight:bold;text-align:center;margin-top: 15px">反馈情况</h1>
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
        var resume="";
        var social1="";
        var aducation1="";
        var social2="";
        var aducation2="";
        table.on('tool(test)', function(obj) { //注：tool 是工具条事件名，test 是 table 原始容器的属性
            var data = obj.data //获得当前行数据
                ,event = obj.event;
            if (event ==='detail'){
                var uid={'uid':data.uid};
                uid=JSON.stringify(uid);
                $.ajax({
                    url:'${pageContext.request.contextPath}/school/findResume',
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
                            offset: 'auto',
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
                    var positionid = data.positionid;
                    $.ajax({
                        url:path+"/Enterprise/companyEmploy",
                        dataType:"text",
                        type:"POST",
                        data:{"interviewid":interviewid,"employ":'录用',"positionid":positionid},
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
