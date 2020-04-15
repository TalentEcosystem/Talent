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
                    area: ['80%', '80%'],
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
