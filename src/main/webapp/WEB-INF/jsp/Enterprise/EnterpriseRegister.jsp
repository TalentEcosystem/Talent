<%--
  Created by IntelliJ IDEA.
  User: chen
  Date: 2020/4/10
  Time: 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>企业注册</title>
    <%String path = request.getContextPath();%>
    <link rel="stylesheet" href=<%=path+"/js/layui/css/layui.css" %>>
    <link rel="stylesheet" href=<%=path+"/Enterprise/css/EnterpriseRCss.css" %>>
    <script src="<%=path+"/js/jquery-3.4.1.js"%>"></script>
    <script charset="UTF-8" src="<%=path+"/js/layui/layui.js"%>"></script>

</head>
<body>
<input type="hidden" id="path" value="<%=path%>">
  <div id="layout">
    <form class="layui-form" action="" >
        <br>
        <div>
            <h1 align="center">企业注册，广收人才</h1>
        </div>
        <br>
        <div class="layui-form-item">
            <label class="layui-form-label">账号</label>
            <div class="layui-input-inline" style="width: 190px">
                <input name="account" class="layui-input" type="text" placeholder="请输入账号" autocomplete="off" id="account" onblur="checkAccount(this.value)">
            </div>
            <div class="layui-form-mid ">请填写6到20位账号</div>
            <div id="tip1" style="display: none;"></div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">昵称</label>
            <div class="layui-input-inline" style="width: 190px">
                <input name="name" class="layui-input" type="text" placeholder="请输入昵称" autocomplete="off" id="name" onblur="checkName(this.value)">
            </div>
            <div class="layui-form-mid ">请填写昵称</div>
            <div id="tip2" style="display: none;"></div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-inline">
                <input name="password" class="layui-input" type="password" id="password"  placeholder="请输入密码" autocomplete="off"  onblur="checkPassword(this.value)">
            </div>
            <div class="layui-form-mid">请填写6到12位密码</div>
            <div id="tip3" style="display: none;"></div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">确认密码</label>
            <div class="layui-input-inline">
                <input name="password2" class="layui-input" type="password" id="password2" placeholder="请输入密码" autocomplete="off" onblur="checkRePassWord(this.value)">
            </div>
            <div class="layui-form-mid ">请填写6到12位密码</div>
            <div id="tip4" style="display: none;"></div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">手机号码</label>
            <div class="layui-input-inline">
                <input name="tel" class="layui-input" type="password" id="tel" placeholder="请输入手机号码" autocomplete="off" onblur="checkTel(this.value)" lay-verify="number" lay-verType="tips">
            </div>
            <div class="layui-form-mid ">请填写11位手机号码</div>
            <div id="tip5" style="display: none;"></div>
        </div>
        <div class="layui-form-item" >
            <label class="layui-form-label" >所在城市：</label>
            <div class="layui-input-inline">
                <input name="address" class="layui-input" type="text" placeholder="请输入所在城市" autocomplete="off" onblur="checkAddress(this.value)">
            </div>
            <div id="tip6" style="display: none;"></div>
        </div>
        <div class="layui-form-item" >
            <label class="layui-form-label" >公司名称</label>
            <div class="layui-input-inline" style="width:400px">
                <input name="companyname" class="layui-input" type="text" placeholder="请输入公司名称" autocomplete="off" onblur="companyName(this.value)">
            </div>
            <div id="tip7" style="display: none;"></div>
        </div>

        <div class="layui-form-item" >
            <label class="layui-form-label" id="label1">验证统一社会信用代码</label>
            <div class="layui-input-inline" style="width:400px">
                <input name="permit" class="layui-input" type="text" placeholder="请输入统一社会信用代码" autocomplete="off" onblur="verification(this.value)">
            </div>
            <div id="tip8" style="display: none;"></div>
        </div>
        <div class="layui-form-item">
            <div class="layui-form-label">
                <label>验证码:</label>
            </div>
            <div class="layui-input-inline">
                <input id="code" class="layui-input cardInput" type="text" name="code"
                       lay-verType="tips" lay-verify="required" autocomplete="off" value="" placeholder="输入验证码">
            </div>
            <div class="layui-input-inline">
                <img title="点击切换验证码" type="button" class="codeInput"
                     src=<%=path+"/Enterprise/CodeServlet"%> id="verifyCode">
            </div>
        </div>
        <div class="layui-form-item" >
            <div class="layui-input-block" id="button1">
                <button class="layui-btn" type="submit" lay-filter="register" lay-submit="">注册</button>
                <button class="layui-btn layui-btn-primary" type="reset">返回</button>
            </div>
        </div>
    </form>
    <h3 align="center">
        <a href=<%=path+"/Enterprise/path/EnterpriseLogin"%>>已有账号，去登录</a>
    </h3>
</div>
</body>
<script>
    var path = $('#path').val();
    $('#verifyCode').on('click', function () {
        $('#verifyCode').attr('src', path + '/Enterprise/CodeServlet?' + Math.random());
    })
 layui.use(['form', 'layer'], function(){
     var form = layui.form
         ,layer = layui.layer;
     form.on('submit(register)',function (data) {
         var tip1 = $("#tip1").val();
         var tip2 = $("#tip2").val();
         var tip3 = $("#tip3").val();
         var tip4 = $("#tip4").val();
         var tip5 = $("#tip5").val();
         var tip6 = $("#tip6").val();
         var tip7 = $("#tip7").val();
         var tip8 = $("#tip8").val();
         var password = $('#password').val();
         var password2 = $('#password2').val();
         if (tip1 === "success"&& tip2 === "success" && tip3 === "success" && tip4 === "success" && tip5 === "success"
             && tip6 === "success" && tip7 === "success" && tip8 === "success"){
             console.log(1)
         if(password === password2){
             console.log(2)
             $.ajax({
                 type:"post",
                 url:path+"/Enterprise/RegisterAdmin",
                 dataType:"text",
                 data:data.field,
                 success:function (msg) {
                    if(msg === "success"){
                        layer.alert("注册成功")
                        $('#verifyCode').attr('src',  path + '/Enterprise/CodeServlet?' + Math.random());
                        setTimeout('window.location.href = path +"/Enterprise/path/EnterpriseLogin"',1000);
                    }else if(msg === "noCode"){
                        layer.alert("验证码输入错误",{icon:2,offset:"auto",time:1000})
                    }else{
                        layer.alert("注册失败",{icon:2,offset:"auto",time:1000})
                    }
                 },
                 error:function () {
                      layer.alert("网络繁忙");
                 }
             })
             return false;
         }else{
             layer.alert('两次密码不一致', { icon: 2, offset: "auto", time:700 });
             $('#tip3').val("win");
         }
         }else{
             if(tip1 !=="success"){
                 layer.alert("请输入正确的账号", { icon: 2, offset: "auto", time:1000 });
             } else if(tip4 !=="success"){
                 layer.alert("不是有效的统一社会信用编码！", { icon: 2, offset: "auto", time:1000 });
             }else if(tip5 !=="success"){
                 layer.alert("请输入正确的公司名称", { icon: 2, offset: "auto", time:1000 });
             }
         }
     })
 });
    function checkAccount(value) {
        if (value.length === 0){
            layer.alert("账号不能为空 ！",{ icon: 2, offset: "auto", time:1000 });
            $('#tip1').val("win");
        }else if (value.length <6 && value.length >20){
            layer.alert("账号不少得于6位和超过20位", { icon: 2, offset: "auto", time:1000 });
            $('#tip1').val("win");
        }else if (!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
            layer.alert('用户名不能有特殊字符', { icon: 2, offset: "auto", time:1000 });
            $('#tip1').val("win");
        }else if(/(^\_)|(\__)|(\_+$)/.test(value)){
            layer.alert('用户名首尾不能出现下划线\'_\'', { icon: 2, offset: "auto", time:1000 });
            $('#tip1').val("win");
        }else if(/^\d+\d+\d$/.test(value)){
            layer.alert('用户名不能全为数字', { icon: 2, offset: "auto", time:1000 });
            $('#tip1').val("win");
        }else if(/[\u4E00-\u9FA5]/g.test(value)){
            layer.alert('用户名不能存在中文', { icon: 2, offset: "auto", time:1000 });
            $('#tip1').val("win");
        }else{
            $.ajax({
                type:"POST",
                url:path+"/Enterprise/doAccount",
                dataType:"text",
                data:{account:value},
                success:function (msg) {
                    if (msg === "success"){
                        layer.alert("该账号可以注册", { icon: 1, offset: "auto", time:1000 });
                        $('#tip1').val("success");
                    }else{
                        layer.alert("该账号已注册", { icon: 2, offset: "auto", time:1000 });
                        $('#tip1').val("win");
                    }
                },
                error:function (msg) {
                      alert(msg);
                }
            })
        }
    };
    function checkName(value) {
        if (value.length === 0){
            layer.alert("账号不能为空 ！",{ icon: 2, offset: "auto", time:1000 });
            $('#tip2').val("win");
        }else if (value.length <6 && value.length >20){
            layer.alert("账号不少得于6位和超过20位", { icon: 2, offset: "auto", time:1000 });
            $('#tip2').val("win");
        }else if (!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
            layer.alert('用户名不能有特殊字符', { icon: 2, offset: "auto", time:1000 });
            $('#tip2').val("win");
        }else if(/(^\_)|(\__)|(\_+$)/.test(value)){
            layer.alert('用户名首尾不能出现下划线\'_\'', { icon: 2, offset: "auto", time:1000 });
            $('#tip2').val("win");
        }else if(/^\d+\d+\d$/.test(value)){
            layer.alert('用户名不能全为数字', { icon: 2, offset: "auto", time:1000 });
            $('#tip2').val("win");
        }else{
            $('#tip2').val("success");
        }
    }
    function checkPassword(value) {
        if(value.length === 0){
            layer.alert('密码不能为空', { icon: 2, offset: "auto", time:1000 }) ;
            $('#tip3').val("win");
        }else if(value.length <6 && value.length >12){
            layer.alert('密码不少得于6位或者超过12位', { icon: 2, offset: "auto", time:1000 });
            $('#tip3').val("win");
        }else if(/^\d+\d+\d$/.test(value)){
            layer.alert('密码不能全为数字', { icon: 2, offset: "auto", time:1000 });
            $('#tip3').val("win");
        }else if(/[\u4E00-\u9FA5]/g.test(value)){
            layer.alert('密码不能存在中文', { icon: 2, offset: "auto", time:1000 });
            $('#tip3').val("win");
        }else {
            $('#tip3').val("success");
        }
    };
     function checkRePassWord(value) {
         if(value.length === 0){
             layer.alert('确认密码栏不能为空', { icon: 2, offset: "auto", time:1000 }) ;
             $('#tip4').val("win");
         }else if(value.length <6 && value.length >12){
             layer.alert('密码不少得于6位或者超过12位', { icon: 2, offset: "auto", time:1000 });
             $('#tip4').val("win");
         }else if(/^\d+\d+\d$/.test(value)){
             layer.alert('密码不能全为数字', { icon: 2, offset: "auto", time:1000 });
             $('#tip4').val("win");
         }else if(/[\u4E00-\u9FA5]/g.test(value)){
             layer.alert('密码不能存在中文', { icon: 2, offset: "auto", time:1000 });
             $('#tip4').val("win");
         } else{
             $('#tip4').val("success");
         }
     };
     function checkTel(value) {
         if (value.length === 0){
             layer.alert("手机号不能为空", { icon: 2, offset: "auto", time:1000 });
             $('#tip5').val("win");
         }else if(value.length !== 11){
             layer.alert("手机号长度为11位", { icon: 2, offset: "auto", time:1000 });
             $('#tip5').val("win");
         }else{
       $.ajax({
           type: "POST",
           url: path+"/Enterprise/checkAdminTel",
           dataType: "text",
           data: "phone="+value,
           success:function (msg) {
              if (msg === 'phone'){
                  layer.alert("该手机可注册", { icon: 1, offset: "auto", time:1000 });
                  $('#tip5').val("success");
              }else{
                  $('#tip5').val("win");
              }
           }
       })
         }
     };
    function companyName(value) {
        if(/^[\u4e00-\u9fa5\(\)（）\da-zA-Z&]{2,50}$/gi.test(value)){
            $('#tip7').val("success");
        }else{
            layer.alert('请输入正确的公司名称', { icon: 2, offset: "auto", time:1000 });
            $('#tip7').val("win");
        }
    }
    function checkAddress(value) {
        if(/^[\u4e00-\u9fa5\(\)（）\da-zA-Z&]{2,50}$/gi.test(value)){
            $('#tip6').val("success");
        }else{
            layer.alert('请输入正确的地址', { icon: 2, offset: "auto", time:1000 });
            $('#tip6').val("win");
        }
    };
    function verification (Code) {

        var patrn = /^[0-9A-Z]+$/;
        //18位校验及大写校验

        if ((Code.length !== 18) || (patrn.test(Code) === false)) {
            layer.alert("不是有效的统一社会信用编码！", { icon: 2, offset: "auto", time:1000 });
            $('#tip8').val("win");
            return false;

        }  else {
            var Ancode;//统一社会信用代码的每一个值
            var Ancodevalue;//统一社会信用代码每一个值的权重
            var total = 0;
            var weightedfactors = [1, 3, 9, 27, 19, 26, 16, 17, 20, 29, 25, 13, 8, 24, 10, 30, 28];//加权因子
            var str = '0123456789ABCDEFGHJKLMNPQRTUWXY';
            //不用I、O、S、V、Z
            for (var i = 0; i < Code.length - 1; i++) {
                Ancode = Code.substring(i, i + 1);
                Ancodevalue = str.indexOf(Ancode);
                total = total + Ancodevalue * weightedfactors[i];
                // 权重与加权因子相乘之和
            }
            var logiccheckcode = 31 - total % 31;
            if (logiccheckcode === 31) {
                logiccheckcode = 0;    }
            var Str = "0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F,G,H,J,K,L,M,N,P,Q,R,T,U,W,X,Y";
            var Array_Str = Str.split(',');
            logiccheckcode = Array_Str[logiccheckcode];
            var checkcode = Code.substring(17, 18);
            if (logiccheckcode !== checkcode) {
                layer.alert("不是有效的统一社会信用编码！", { icon: 2, offset: "auto", time:500 });
                $('#tip8').val("win");
                return false;
            }
            else{
                $('#tip8').val("success");

            }
        }
    }
</script>
</html>
