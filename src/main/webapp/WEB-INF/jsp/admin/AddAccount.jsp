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
    <title>新增高校和管理员账号</title>
    <%String path = request.getContextPath();%>
    <link rel="stylesheet" href=<%=path+"/js/layui/css/layui.css" %>>
    <link rel="stylesheet" href=<%=path+"/Enterprise/css/EnterpriseRCss.css" %>>
    <script src="<%=path+"/js/jquery-3.4.1.js"%>"></script>
    <script charset="UTF-8" src="<%=path+"/js/layui/layui.js"%>"></script>

</head>
<body>
<input type="hidden" id="path" value="<%=path%>">
<input type="hidden" id="tip1">
<input type="hidden" id="tip2">
<input type="hidden" id="tip3">
<input type="hidden" id="tip4">
<input type="hidden" id="tip5">
<input type="hidden" id="tip6">
<input type="hidden" id="tip7">
  <div id="layout">
    <form class="layui-form" action="" onsubmit="return false">
        <br>
        <div class="layui-form-item">
            <label class="layui-form-label">角色</label>
            <div class="layui-input-inline">
                <select name="roleid" id="roleid" lay-filter="choosePosition">
                    <option value="3" >系统管理员</option>
                    <option value="1">高校</option>
                </select>
            </div>
            <div class="layui-form-mid ">请选择角色</div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">账号</label>
            <div class="layui-input-inline" style="width: 190px">
                <input name="account" class="layui-input" type="text" placeholder="请输入账号" autocomplete="off" id="account" lay-verType="tips" onblur="checkAccount(this.value)">
            </div>
            <div class="layui-form-mid ">请填写6到20位账号</div>
<%--            <div id="tip1" style="display: none;"></div>--%>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">昵称</label>
            <div class="layui-input-inline" style="width: 190px">
                <input name="name" class="layui-input" type="text" placeholder="请输入昵称" autocomplete="off" id="name" lay-verType="tips" onblur="checkName(this.value)">
            </div>
            <div class="layui-form-mid ">请填写昵称</div>
<%--            <div id="tip2" style="display: none;"></div>--%>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-inline">
                <input name="password" class="layui-input" type="password" id="password" lay-verType="tips" placeholder="请输入密码" autocomplete="off"  onblur="checkPassword(this.value)">
            </div>
            <div class="layui-form-mid">请填写6到12位密码</div>
<%--            <div id="tip3" style="display: none;"></div>--%>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">确认密码</label>
            <div class="layui-input-inline">
                <input name="password2" class="layui-input" type="password" id="password2"  lay-verType="tips" placeholder="请输入密码" autocomplete="off" onblur="checkRePassWord(this.value)">
            </div>
            <div class="layui-form-mid ">请填写6到12位密码</div>
<%--            <div id="tip4" style="display: none;"></div>--%>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">手机号码</label>
            <div class="layui-input-inline">
                <input name="tel" class="layui-input" type="text" id="tel" placeholder="请输入手机号码" autocomplete="off" onblur="checkTel(this.value)" lay-verify="number" lay-verType="tips">
            </div>
            <div class="layui-form-mid ">请填写11位手机号码</div>
<%--            <div id="tip5" style="display: none;"></div>--%>
        </div>
        <div class="layui-form-item" >
            <label class="layui-form-label" >所在城市</label>
            <div class="layui-input-inline">
                <input name="address" class="layui-input" type="text" lay-verType="tips" placeholder="请输入所在城市" autocomplete="off" onblur="checkAddress(this.value)">
            </div>
<%--            <div id="tip6" style="display: none;"></div>--%>
        </div>
        <div class="layui-form-item" >
            <label class="layui-form-label" >学校名称</label>
            <div class="layui-input-inline">
                <input name="companyname" class="layui-input" type="text" lay-verType="tips" placeholder="请输入高校名称" autocomplete="off" onblur="companyName(this.value)">
            </div>
<%--            <div id="tip7" style="display: none;"></div>--%>
        </div>
        <div class="layui-form-item" >
            <div class="layui-input-block" id="button1">
                <button class="layui-btn" type="submit" lay-filter="register" lay-submit="">新增</button>
            </div>
        </div>
    </form>
</div>
</body>
<script>
    var path = $('#path').val();
    layui.use(['form', 'layer'], function(){
     var form = layui.form
         ,layer = layui.layer;
     form.on('submit(register)',function (data) {
         var roleid=$("#roleid").val();
         if(roleid==3){
             var tip7="success";
         }else if(roleid==1){
             var tip7 = $("#tip7").val();
         }
         var tip1 = $("#tip1").val();
         var tip2 = $("#tip2").val();
         var tip3 = $("#tip3").val();
         var tip4 = $("#tip4").val();
         var tip5 = $("#tip5").val();
         var tip6 = $("#tip6").val();
         var password = $("#password").val();
         var password2 = $("#password2").val();
         if (tip1 === "success"&& tip2 === "success" && tip3 === "success" && tip4 === "success" && tip5 === "success"
             && tip6 === "success" && tip7 === "success"){
             if(password === password2){
                 $.ajax({
                     type:"post",
                     url:path+"/admin/addAccount",
                     dataType:"text",
                     data:data.field,
                     success:function (msg) {
                        if(msg === "success"){
                            layer.alert("新增成功")
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
             layer.alert("请将信息填写完整", { icon: 2, offset: "auto", time:1000 });
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
     }
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
    }
</script>
</html>
