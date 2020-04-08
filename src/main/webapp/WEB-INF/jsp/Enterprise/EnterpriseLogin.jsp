<%--
  Created by IntelliJ IDEA.
  User: 陈世德
  Date: 2020/4/8
  Time: 9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>企业登录</title>
    <%String path = request.getContextPath();%>
    <link rel="stylesheet" href=<%=path+"/js/layui/css/layui.css" %>>
    <link rel="stylesheet" href=<%=path+"/Enterprise/css/EnterpriseCss.css" %>>
    <script src="<%=path+"/js/jquery-3.4.1.js"%>"></script>
    <script charset="UTF-8" src="<%=path+"/js/layui/layui.js"%>"></script>
</head>
<body>
<input type="hidden" id="path" value="<%=path%>">
<div id="layui-main login">

    <div class="intro">
        <div class="wrap">
            <div class="loginForm" style="position: absolute;margin-top: -15%;">
                <form class="layui-form">
                    <div class="logoHead">
                        <B><h2 style="width: 250px;margin-top: 15px;font-size:20px">人才网平台管理系统</h2></B>
                    </div>
                    <div class="userDiv">
                        <div class="usernameLabel">
                            <label>账号:</label>
                        </div>
                        <div class="usernameSDiv">
                            <i class="layui-icon layui-icon-username adminIcon"></i>
                            <input id="account" class="layui-input adminInput" type="text" name="account"
                                   lay-verType="tips" lay-verify="required" autocomplete="off" value="" placeholder="请输入账号">
                        </div>
                    </div>
                    <div class="userDiv">
                        <div class="usernameLabel">
                            <label>密码:</label>
                        </div>
                        <div class="passwordDiv">
                            <i class="layui-icon layui-icon-password adminIcon"></i>
                            <input id="password" class="layui-input adminInput" type="password" name="password"
                                   lay-verType="tips"  lay-verify="required" autocomplete="off" value="" placeholder="输入密码">
                        </div>
                    </div>
                    <div class="userDiv">
                        <div class="usernameLabel">
                            <label>验证码:</label>
                        </div>
                        <div class="cardDiv">
                            <input id="code" class="layui-input cardInput" type="text" name="code"
                                   lay-verType="tips" lay-verify="required" autocomplete="off" value="" placeholder="输入验证码">
                        </div>
                        <div class="codeDiv">
                            <img title="点击切换验证码" type="button" class="codeInput"
                                 src=<%=path+"/Enterprise/CodeServlet"%> id="verifyCode">
                        </div>
                    </div>
                    <div class="userDiv">
                        <div class="submitLabel">
                            <label>若没有账号？<a href="" id="register">点击注册</a></label>
                        </div>
                        <div class="submitDiv">
                            <button id="submitLogin" type="button" class="submit layui-btn layui-btn-primary" lay-submit
                                    lay-filter="login">登录
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

    </div>
<%-- 登录js   --%>
    <script type="text/javascript">
        var path = $("#path").val();
        $('#verifyCode').on('click', function () {
            $('#verifyCode').attr('src', path + '/Enterprise/CodeServlet?' + Math.random());
        })

        layui.use(['jquery', 'form', 'layer'], function () {
            var $ = layui.jquery
                , form = layui.form
                , layer = layui.layer;

            form.on('submit(login)',function (data) {
                $.ajax({
                    type: "POST",
                    url:  path + "/Enterprise/login",
                    dataType: "text",
                    data: data.field,
                    success: function (msg){
                        if (msg == 'success'){
                            layer.msg('<a style =color:black >登录成功</a>', {icon: 1});
                            $("#account").val('');
                            $("#password").val('');
                            $("#code").val('');
                            $('#verifyCode').attr('src',  path + '/Enterprise/CodeServlet?' + Math.random());
                            window.location.href = path + '/Enterprise/EnterpriseManager';
                        }else if (msg == 'noCode'){
                            layer.msg('<a style =color:black >验证码不正确，请重新输入</a>', {icon: 2});
                        }
                    }
                })
            })
        })

    </script>
</div>
</body>
</html>
