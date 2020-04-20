<%--
  Created by IntelliJ IDEA.
  User: chen
  Date: 2020/4/16
  Time: 20:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>公司邀请面试</title>
    <%String path = request.getContextPath();%>
    <link rel="stylesheet" href=<%=path+"/js/layui/css/layui.css" %>>
    <link rel="stylesheet" href=<%=path+"/Enterprise/css/PerfectInfoCss.css" %>>
    <script src="<%=path+"/js/jquery-3.4.1.js"%>"></script>
    <script charset="UTF-8" src="<%=path+"/js/layui/layui.js"%>"></script>
</head>
<body>
<input id="path" type="hidden" value="<%=path%>" />
<div id="layout">
    <form id="forms" class="layui-form" onsubmit="return false;">
        <input id="uid" type="hidden" />
        <br>
        <div>
        <h1 align="center">公司邀请面试</h1>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" >受邀人:</label>
            <div class="layui-input-inline" >
                <input name="resname" id="resname" class="layui-input" type="text" placeholder="请输入" autocomplete="off"  lay-verify="required" value="" disabled>
            </div>
        </div>
        <div class="layui-form-item">
            <input id="sid" type="hidden" />
            <label class="layui-form-label" >学校:</label>
            <div class="layui-input-inline" >
                <input name="schoolname" id="schoolname" class="layui-input" type="text" placeholder="请输入" autocomplete="off"  lay-verify="required" value="" disabled>
            </div>
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">所选岗位：</label>
            <div class="layui-input-inline">
                <select name="position" id="position" lay-filter="choosePosition"  >
                    <option value="0" >请选择岗位</option>
                    <c:if test="${positionList!=null}">
                        <c:forEach items="${positionList}" begin="0" var="i">
                            <option  value="${i.positionid}">${i.positionname}</option>
                        </c:forEach>
                    </c:if>
                </select>
            </div>
        </div>
        <div class="layui-form-item" >
            <div class="layui-input-block" id="button1">
                <button class="layui-btn" type="submit" lay-filter="confirm" id="perfect" lay-submit="">确认邀请</button>
                <button class="layui-btn layui-btn-primary" type="button" >取消</button>
            </div>
        </div>
    </form>
</div>
</body>
<script>
    var path=$('#path').val();
    layui.use(['form', 'layer', 'jquery'], function(){
        var form = layui.form;
        var layer = layui.layer;
        var $ = layui.jquery;

        form.on('submit(confirm)',function(data){
            var uid = $("#uid").val();
            var sid = $("#sid").val();
            var myselect=document.getElementById("position");
            var index=myselect.selectedIndex;
            var positionid = myselect.options[index].value;
            console.log("uid="+uid+"sid="+sid+"positionid="+positionid);

            $.ajax({
                url:path+'/Enterprise/addInterviews',
                async: true,
                type: "POST",
                data:{"uid":uid,"sid":sid,"positionid":positionid},
                success: function (msg) {
                    if (msg === 'success'){
                        alert("邀请成功");
                        var index = parent.layer.getFrameIndex(window.name);
                        parent.layer.close(index);//关闭弹出的子页面窗口 layer.index表示当前层
                        window.location.reload();
                    }else{
                        layer.msg("邀请失败")
                    }
                },
                error:function () {
                     layer.alert("服务器繁忙！")
                }
            })
        })
    })
</script>
</html>
