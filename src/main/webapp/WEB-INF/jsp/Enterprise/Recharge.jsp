<%--
  Created by IntelliJ IDEA.
  User: chen
  Date: 2020/4/11
  Time: 12:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>充值</title>
    <%String path = request.getContextPath();%>
    <link rel="stylesheet" href=<%=path+"/js/layui/css/layui.css" %>>
    <link rel="stylesheet" href=<%=path+"/Enterprise/css/PerfectInfoCss.css" %>>
    <script src="<%=path+"/js/jquery-3.4.1.js"%>"></script>
    <script charset="UTF-8" src="<%=path+"/js/layui/layui.js"%>"></script>
</head>
<body>
<input id="path" type="hidden" value="<%=path%>" />
<div id="layout">
    <form id="forms" class="layui-form" action="${pageContext.request.contextPath}/Enterprise/addFinances" method=post >
        <input id="aid" type="hidden" value="${sessionScope.admin.aid}" />
        <br>
        <div>
            <h1 align="center">充值</h1>
        </div>
        <br>
        <div class="layui-form-item">
            <label class="layui-form-label" >订单号:</label>
            <div class="layui-input-inline" >
                <input name="tradeno" id="tradeno" class="layui-input" type="text" autocomplete="off"  lay-verify="required">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" >公司名称:</label>
            <div class="layui-input-inline" >
                <input name="companyname" id="companyname" class="layui-input" type="text" autocomplete="off"  lay-verify="required" value="${sessionScope.company.companyname}">
                <input id="cid" name="cid" type="hidden" value="${sessionScope.company.cid}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" >金额:</label>
            <div class="layui-input-inline" >
                <input name="price" id="price" class="layui-input" type="text" placeholder="请输入金额" autocomplete="off"  type="number" required maxlength="11" onKeyUp="this.value=this.value.replace(/[^\.\d]/g,'');this.value=this.value.replace('.','');">
            </div>
        </div>
        <div class="layui-form-item" >
            <div class="layui-input-block" id="button1">
                <button class="layui-btn" type="submit" lay-filter="charge" id="perfect" lay-submit="">充值</button>
            </div>
        </div>
    </form>
</div>
</body>
<script>
    var path=$('#path').val();

    $(function() {
        var vNow = new Date();
        var sNow = "";
        sNow += String(vNow.getFullYear());
        sNow += String(vNow.getMonth() + 1);
        sNow += String(vNow.getDate());
        sNow += String(vNow.getHours());
        sNow += String(vNow.getMinutes());
        sNow += String(vNow.getSeconds());
        sNow += String(vNow.getMilliseconds());
        document.getElementById("tradeno").value = sNow;
    });
</script>
</html>
