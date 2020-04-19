<%--
  Created by IntelliJ IDEA.
  User: chen
  Date: 2020/4/18
  Time: 19:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>过渡页面</title>
    <%String path = request.getContextPath();%>
    <link rel="stylesheet" href=<%=path+"/js/layui/css/layui.css" %>>
    <script src="<%=path+"/js/jquery-3.4.1.js"%>"></script>
    <script charset="UTF-8" src="<%=path+"/js/layui/layui.js"%>"></script>
</head>
<body>
<input id="path" type="hidden" value="<%=path%>" />
<div class="layui-form-item">
    <label> 付款成功！</label>
</div>
<meta http-equiv="refresh" content="5;url = <%= path + "/Enterprise/path/EnterpriseManager"%>">

</body>
</html>
