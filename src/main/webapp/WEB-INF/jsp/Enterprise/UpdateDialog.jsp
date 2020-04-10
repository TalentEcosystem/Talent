<%--
  Created by IntelliJ IDEA.
  User: chen
  Date: 2020/4/9
  Time: 14:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>岗位信息</title>
    <%String path = request.getContextPath();%>
    <link rel="stylesheet" href=<%=path+"/js/layui/css/layui.css" %>>
    <script src="<%=path+"/js/jquery-3.4.1.js"%>"></script>
    <script charset="UTF-8" src="<%=path+"/js/layui/layui.js"%>"></script>
</head>
<body>
    <form class="layui-form" action="" style="border: #dedede solid 1px;background-color: #f3f3f3;">
        <div class="layui-form-item" style="background-color: #d2d2d2 ;width: 720px">
            <h3><label class="layui-form-label" style="width: 80px;text-align: left">行业信息:</label></h3>
            <input id="positionid" name="positionid" type="label" class="layui-form-label"  disabled>
            <input type="hidden" id="path" value="<%=path%>">
        </div>
        <div class="layui-inline">
            <label class="layui-form-label">行业：</label>
            <div class="layui-input-inline">
                <select name="industryid" id="industryid" lay-filter="chooseIndustry"  >
                    <option value="0" >请选择行业</option>
                    <c:if test="${industry!=null}">
                        <c:forEach items="${industry}" begin="0" var="i">
                            <option  value="${i.industryid}">${i.indname}</option>
                        </c:forEach>
                    </c:if>
                </select>
            </div>
        </div>
        <div class="layui-input-inline">
            <label class="layui-form-label" >岗位名称：</label>
            <div class="layui-input-inline">
                <select name="post" id="post" lay-filter="choosePost"  >
                </select>
            </div>
        </div>
        <div class="layui-form-item" >
            <label class="layui-form-label" >公司：</label>
            <div class="layui-input-inline" >
                <input type="text" name="company" id="company" required  lay-verify="required"  autocomplete="off" class="layui-input" value="${sessionScope.companyName}" disabled>
            </div>
        </div>
        <div class="layui-form-item" >
            <label class="layui-form-label" >发布日期：</label>
            <div class="layui-input-inline">
                <input name="beginTime" id="beginTime"  class="layui-input"  type="text" placeholder="yyyy-MM-dd HH-mm-ss" autocomplete="off" lay-verify="required">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">发布人：</label>
            <div class="layui-input-inline" >
                <input name="name"  id="name" class="layui-input" type="text" autocomplete="off" lay-verify="name" value="${sessionScope.admin.name}" disabled>
            </div>
        </div>
        <div class="layui-form-item" style="background-color: #d2d2d2;width:720px">
            <h3><label class="layui-form-label" style="width: 150px;text-align: left">职业基本信息:</label></h3>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">学历要求：</label>
                <div class="layui-input-inline">
                    <select name="degree" id="degree" lay-verify="required">
                        <option value="">请选择学历</option>
                        <option value="1">博士及以上</option>
                        <option value="2">硕士</option>
                        <option value="3">本科</option>
                        <option value="4">专科</option>
                        <option value="5">高中、中技、中专</option>
                        <option value="6">初中</option>
                        <option value="7">小学</option>
                        <option value="8">不限</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">要求专业:</label>
            <div class="layui-input-inline">
                <select name="profession" id="profession" lay-filter="">
                    <option value="0" >请选择专业</option>
                    <c:if test="${profession!=null}">
                        <c:forEach items="${profession}" begin="0" var="k">
                            <option  value="${k.professid}">${k.professname}</option>
                        </c:forEach>
                    </c:if>
                </select>
            </div>
        </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">工作经验：</label>
                <div class="layui-input-inline">
                    <select name="positionexper" id="positionexper" lay-verify="required">
                        <option value="">请选择工作经验</option>
                        <option value="10年以上">10年以上</option>
                        <option value="6~10年">6~10年</option>
                        <option value="3~5年">3~5年</option>
                        <option value="1~2年">1~2年</option>
                        <option value="应届毕业生">应届毕业生</option>
                        <option value="不限">不限</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="layui-form-item" >
            <label class="layui-form-label" >工作地点：</label>
            <div class="layui-input-inline" >
            <input type="text" name="positionaddress" id="positionaddress" required  lay-verify="required"  placeholder="地址" autocomplete="on" class="layui-input" value="${sessionScope.companyAdd}" disabled>
        </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">参考月薪：</label>
                <div class="layui-input-inline" style="width: 100px;">
                    <input name="money" id="money" lay-verType="tips" class="layui-input" type="text" placeholder="￥月薪" autocomplete="off" lay-verify="number">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">薪资福利：</label>
            <div class="layui-input-block">
                <input name="Domain" id="wujin" title="五险" type="checkbox" value="五险">
                <input name="Domain" id="gongjijin" title="公积金" type="checkbox" value="公积金">
                <input name="Domain" id="jiangjin" title="奖金提成" type="checkbox" value="奖金提成">
                <input name="Domain" id="zhusu" title="提供住宿" type="checkbox" value="提供住宿">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">招聘人数：</label>
                <div class="layui-input-inline">
                    <input name="maxnum" id="maxnum" lay-verType="tips" class="layui-input" type="text" autocomplete="off" lay-verify="number" placeholder="增加招聘人数">
                </div>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <h3>
                <label class="layui-form-label"  style="background-color:#d2d2d2;width:690px;text-align: left">岗位要求：</label>
            </h3>
            <br><br><br>
            <div class="layui-input-line">
                <textarea name="request" id="request" lay-verType="tips"  lay-verify="required" style="width: 600px;margin-left:20px;float: left;" class="layui-textarea" placeholder="请输入内容"></textarea>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <h3>
                <label class="layui-form-label"  style="background-color:#d2d2d2;width:690px;text-align: left">岗位内容：</label>
            </h3>
            <br><br><br>
            <div class="layui-input-line">
                <textarea name="positioncontent" id="positioncontent" lay-verType="tips" lay-verify="required" style="width: 600px;margin-left:20px; float: left;" class="layui-textarea" placeholder="请输入内容"></textarea>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="button" class="submit layui-btn layui-btn-primary" lay-submit lay-filter="update" >修改</button>
                <button class="layui-btn layui-btn-primary" type="reset">返回</button>
            </div>
        </div>
    </form>

</body>
<script>
    var path=$('#path').val();
    layui.use(['form', 'layer', 'jquery'], function(){
        var form = layui.form;
        var layer = layui.layer;
        var $ = layui.jquery;
        form.on('select(chooseIndustry)', function(data){
            var myselect=document.getElementById("industryid");
            var index=myselect.selectedIndex;
            var industryid = myselect.options[index].value;
            var positionid = $("#positionid").val()
            console.log(positionid);
            console.log(industryid);
            if (industryid != "" && industryid != 0){
                $.ajax({
                    url: path + "/Enterprise/findPostInfo",
                    async: true,
                    type: "post",
                    data: "industryid=" + industryid,
                    datatype: "text",
                    success: function (msg) {
                        var posts = msg;
                        var option;
                        option = "<option value='请选择'> " + "请选择" + "</option>";
                        for (var i in posts){
                            option += "<option value='" + posts[i].postid + "'> " + posts[i].postname + "</option>";
                        }
                        console.log(option);
                        var gangwei = $("#post");
                        gangwei.empty();
                        gangwei.append(option);
                        layui.form.render('select')
                    },
                    error:function () {
                         layer.msg("服务器繁忙",{icon:2})
                    }
                })
            }else{
                layer.msg("请先选择行业",{icon:2})
            }

        });
        form.on('submit(update)',function () {
            //行业
            var myselect=document.getElementById("industryid");
            var index=myselect.selectedIndex;
            var industryid = myselect.options[index].value;
            //岗位
            var myselect1=document.getElementById("post");
            var index1=myselect1.selectedIndex;
            var positionname = myselect1.options[index1].text;
            //  公司
            var companyname = $("#company").val();
            //发布人
            var name = $("#name").val();

            var positionid = $("#positionid").val();

            var positiontime = $("#beginTime").val();

            var myselect2=document.getElementById("degree");
            var index2=myselect2.selectedIndex;
            var degreeid = myselect2.options[index2].value;

            var myselect3=document.getElementById("profession");
            var index3=myselect3.selectedIndex;
            var professid = myselect3.options[index3].value;

            var myselect4=document.getElementById("positionexper");
            var index4=myselect4.selectedIndex;
            var positionexper = myselect4.options[index4].value;

            var positionaddress = $("#positionaddress").val();

            var money = $("#money").val();

            var obj1 = document.getElementsByName("Domain");
            var welname = [];
            for(i = 0; i< obj1.length; i++) {
                if (obj1[i].checked) {
                    welname.push(obj1[i].value)
                }
            }

            var maxnum = $("#maxnum").val();

            var request = $("#request").val();

            var positioncontent = $("#positioncontent").val();

            var postInfo = {"industryid":industryid,"positionname":positionname,"companyname":companyname,"name":name,"positionexper":positionexper,"positionid":positionid,
            "degreeid":degreeid,"professid":professid,"positionaddress":positionaddress,"money":money,"maxnum":maxnum,"request":request,"positionstate":'发布',"positiontime":positiontime,
            "positioncontent":positioncontent};
            console.log("postInfo="+postInfo);
            console.log("welname="+welname)
            postInfo = JSON.stringify(postInfo);
            $.ajax({
                url: path + "/Enterprise/updatePositionState",
                async: true,
                type: "POST",
                data: {"postInfo":postInfo,"welname":welname},
                datatype: "text",
                traditional: true,
                success: function (datas) {
                    if (datas == 1111){
                       alert("修改成功")
                    $("#company").empty();
                    $("#name").empty();
                    $("#address").empty();
                    $("#money").empty();
                    $("#maxnum").empty();
                    $("#request").empty();
                    $("#positioncontent").empty();
                    var index = parent.layer.getFrameIndex(window.name);
                    parent.layer.close(index);//关闭弹出的子页面窗口 layer.index表示当前层
                    window.location.reload();
                    }else{
                   alert("修改失败")
                    }
                },
                error:function () {
                    alert("服务器繁忙")
                }
            })


        })
    });
</script>
</html>
