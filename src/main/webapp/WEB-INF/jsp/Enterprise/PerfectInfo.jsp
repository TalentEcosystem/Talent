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
    <title>完善企业信息</title>
    <%String path = request.getContextPath();%>
    <link rel="stylesheet" href=<%=path+"/js/layui/css/layui.css" %>>
    <link rel="stylesheet" href=<%=path+"/Enterprise/css/PerfectInfoCss.css" %>>
    <script src="<%=path+"/js/jquery-3.4.1.js"%>"></script>
    <script charset="UTF-8" src="<%=path+"/js/layui/layui.js"%>"></script>
</head>
<body>
<input id="path" type="hidden" value="<%=path%>" />
<div id="layout">
    <form class="layui-form" action="${pageContext.request.contextPath}/" method="post"  enctype="multipart/form-data" accept-charset="UTF-8">
        <input id="aid" type="hidden" value="${sessionScope.admin.aid}" />
        <br>
        <div>
            <h1 align="center">完善企业信息</h1>
        </div>
        <br>
        <div class="layui-form-item">
            <label class="layui-form-label" >公司名称:</label>
            <div class="layui-input-inline" >
                <label name="companyname" class="layui-form-label" style="width: 180px;text-align: left;" >${sessionScope.company.companyname}</label>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label" >统一社会信用代码:</label>
            <div class="layui-input-inline" >
                <label name="permit" class="layui-form-label" style="width: 180px;text-align: left;">${sessionScope.company.permit}</label>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">注册地址</label>
            <div class="layui-input-inline" style="width: 190px">
                <input name="companyadd" id="qyAddress" class="layui-input" type="text" placeholder="请输入" autocomplete="off"  lay-verify="required" value="${sessionScope.company.companyadd}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">公司类型</label>
            <div class="layui-inline" >
                <select name="companynature" id="companynature2"  lay-verify="required" >
                    <option value="">请选择公司类型</option>
                    <option value="国有企业">国有企业</option>
                    <option value="集体所有制">集体所有制</option>
                    <option value="个人独资企业">个人独资企业</option>
                    <option value="股份制企业">股份制企业</option>
                    <option value="有限合伙企业">有限合伙企业</option>
                    <option value="股份合作企业">股份合作企业</option>
                    <option value="合伙企业">合伙企业</option>
                    <option value="联营企业">联营企业</option>
                    <option value="港、澳、台">港、澳、台</option>
                    <option value="外商投资企业">外商投资企业</option>
                </select>
            </div>
            <input id="companynature" type="hidden" value="${sessionScope.company.companynature}" />
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">经营范围</label>
            <div class="layui-input-inline" style="width: 250px">
                <textarea name="companybusiness" id="companybusiness" class="layui-textarea" placeholder="请输入内容">${sessionScope.company.companybusiness}</textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">公司人数</label>
            <div class="layui-input-inline" style="width: 190px">
                <input name="companynum" id="companynum" class="layui-input" type="text" placeholder="请输入" autocomplete="off"  lay-verify="required" value="${sessionScope.company.companynum}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">联系方式</label>
            <div class="layui-input-inline" style="width: 190px">
                <input name="companyphone" id="companyphone" class="layui-input" type="text" placeholder="请输入" autocomplete="off"  lay-verify="required" value="${sessionScope.company.companyphone}">
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">公司简介</label>
            <div class="layui-input-inline" style="width: 250px">
                <textarea name="companypro" id="companypro" class="layui-textarea" placeholder="请输入内容">${sessionScope.company.companypro}</textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-upload">
                <label class="layui-form-label">公司图片</label>
                <div class="layui-input-inline" style="width: 250px">
                <textarea class="layui-textarea" style="resize:none;margin-left: 5%" id="companypic" name="companypic">
                    ${sessionScope.company.companypic}
                </textarea>
                </div>
                <br/><br/><br/>
                    <button type="button" style="margin-left: 2%" class="layui-btn layui-btn-normal" id="test8">选择文件</button>
                </div>
            </div>
        <div class="layui-form-item" >
            <div class="layui-input-block" id="button1">
                <button class="layui-btn" type="submit" lay-filter="perfect" id="perfect" lay-submit="">完善资料</button>
                <button class="layui-btn layui-btn-primary" type="reset">返回</button>
            </div>
        </div>
    </form>
</div>
</body>
<script>
    var path=$('#path').val();

    $("#companynature2").each(function () {
        // this代表的是<option></option>，对option再进行遍历
        $(this).children("option").each(function () {
            // 判断需要对那个选项进行回显
            if (this.value =='${sessionScope.company.companynature}') {
                // 进行回显
                $(this).attr("selected", "selected");
            }
        });
    });

    layui.use(['form', 'layer','upload'], function() {
        var form = layui.form
            , layer = layui.layer
        ,upload = layui.upload;

        var uploadInst = upload.render({
            elem: '#test8' //绑定元素
            ,url: path+'/Enterprise/upload' //上传接口
            ,auto: false
            ,accept: 'file'
            ,multiple:true
            ,bindAction: '#perfect'//配合auto: false来使用，auto: true值一选中文件后就执行上传，关闭后需要根据绑定事件
            ,before: function(obj) {
                this.data = {//要传递的数据

                }
            }
            // ,choose: function(obj){  //上传前选择回调方法
            //     obj.preview(function(index, file, result){
            //         console.log(file);            //file表示文件信息，result表示文件src地址
            //         $("#fileNames").text(file.name)
            //     });
            // }
            ,done: function(res){
                if(res.code == 0){
                    //上传完毕回调
                    alert("上传成功！");
                }
                if(res.code == 1){
                    //上传完毕回调
                    alert("文件类型不匹配！");
                }
                if(res.code == 2){
                    //上传完毕回调
                    alert("文件或其他信息不能为空！");
                }
            }
            ,error: function(){
                //请求异常回调
                alert("上传失败！");
            }
        });

    });
</script>
</html>
