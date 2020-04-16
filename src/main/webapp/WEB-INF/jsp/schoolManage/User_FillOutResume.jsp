<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/13
  Time: 9:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
	<title>用户填写简历</title>
	<%
		String path=request.getContextPath();
	%>
	<script src=<%=path+"/js/jquery-3.4.1.js" %>></script>
	<script src=<%=path+"/js/jquery-form.js" %>></script>
	<link rel="stylesheet" href=<%=path+"/js/layui/css/layui.css" %>>
	<script type="text/javascript" src=<%=path+"/js/layui/layui.js" %>></script>
	<script type="text/javascript" src=<%=path+"/js/json2.js" %>></script>
<style>
	.layui-form-item{
		margin-left: 35%;
	}
</style>
</head>
<body>
<div class="layui-form-item">
	<label class="layui-form-label" style="width: 140px">若您已有简历，可直接</label>
	<div class="layui-input-inline">
		<button class="layui-btn"  lay-filter="login" id="login" >登录</button>
	</div>
</div>
<form class="layui-form" method="post" enctype="multipart/form-data">
	<div class="layui-form-item">
		<label class="layui-form-label">姓  名：</label>
		<div class="layui-input-inline">
			<input type="text" name="resname" id="resname"  lay-verify="resname" placeholder="请输入2-4个汉字" autocomplete="off" class="layui-input">
		</div>
		<div class="layui-upload-inline">
			<div class="layui-upload-list" id="img_upload"></div>
			<button type="button" class="layui-btn" id="test8">
				<i class="layui-icon">&#xe67c;</i>上传图片
			</button><%--			上传绑定按钮--%>
			<button id="hideupload1" type="button" style="display:none;"></button>
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">性  别：</label>
			<div class="layui-input-block">
				<input type="radio" name="resex" value="男" title="男">
				<input type="radio" name="resex" value="女" title="女">
			</div>
	</div>
	<div class="layui-form-item">
		<div class="layui-inline">
			<label class="layui-form-label">出生年份：</label>
			<div class="layui-input-block">
				<select name="rebirth" id="rebirth" lay-verify="required">
					<option value="0">请选择出生年份：</option>
				</select>
			</div>
		</div>
	</div>
	<div class="layui-form-item">
		<div class="layui-inline">
			<label class="layui-form-label">最高学历：</label>
			<div class="layui-input-block">
				<select name="degree" id="degree" lay-verify="required">
					<option value="">请输入最高学历：</option>
					<c:if test="${not empty degrees}">
						<c:forEach items="${degrees}" var="i">
							<option value="${i.degreeid}">${i.degreename}</option>
						</c:forEach>
					</c:if>
				</select>
			</div>
		</div>
	</div>
	<div class="layui-form-item">
		<div class="layui-inline">
			<label class="layui-form-label">工作经验：</label>
			<div class="layui-input-block">
				<select name="reexper" id="reexper" lay-verify="required">
					<option value="0">请选择工作经验：</option>
					<option value="有">有</option>
					<option value="无">无</option>
				</select>
			</div>
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">手机号：</label>
		<div class="layui-input-inline">
			<input type="tel" name="retel" id="retel" required  lay-verify="required" placeholder="请输入手机号" autocomplete="on" class="layui-input">
		</div>
		<div class="layui-input-inline">
			<button class="layui-btn" id="findCode">获取验证码</button>
		</div>

	</div>
	<div class="layui-form-item" id="codeForm" style="display: none">
		<label class="layui-form-label">验证码：</label>
		<div class="layui-input-inline">
			<input type="text" id="code" required  lay-verify="required" placeholder="请输入验证码" autocomplete="on" class="layui-input">
			<input type="text" id="scode" value="${code12}">
		</div>
	</div>
	<div class="layui-form-item">
		<label class="layui-form-label">隐私设置：</label>
		<div class="layui-input-inline">
			<input type="radio" name="reset" value="1" title="所有招聘方" checked ><p style="color: grey;font-size: small">展示简历给通过营业执照或法人等认证的招聘方</p>
			<input type="radio" name="reset" value="2" title="仅我投递的招聘方"><p style="color: grey;font-size: small">不会再简历库显示您的简历，不会被非投递的招聘方主动邀约</p>
		</div>
	</div>
	<div class="layui-form-item">
		<div class="layui-input-block">
			<button class="layui-btn" lay-submit lay-filter="formDemo" id="submit" >保存并投递</button>
		</div>
	</div>
</form>
<script>
	$("#login").click(function () {
		window.location="${pageContext.request.contextPath}/user/login";
	});

	$("#code").blur(function () {
		var code=$("#code").val();
		var scode=$("#scode").val();
		console.log(scode);
		for (let i = 0; i < 10; i++) {
			if(code!=scode){
				layer.msg("验证码输入错误");
			}else{
				return
			}
		}
	});
	layui.use(['form','upload','jquery'], function(){
		var form = layui.form;
		var layer=layui.layer,
			upload = layui.upload;
		var formData = serializeObject($, $('.layui-form').serializeArray());
		form.render();
		form.verify({
			 resname: function(value){
				if(value.length < 2&&value.length>4){
					return '请输入2至4位的用户名';
				}
			}

		});

	function serializeObject($, array){
		var obj=new Object();
		$.each(array, function(index,param){
			if(!(param.name in obj)){
				obj[param.name]=param.value;
			}
		});
		return obj;
	}
		var uploadInst = upload.render({
			elem: '#test8' //绑定元素
			,url: '${pageContext.request.contextPath}/school/fillOutResume' //上传接口
			,auto:false
			,async:false
			,multiple:false
			,accept:'file'
			,method:'POST'
			,enctype:'multipart/form-data'
			,bindAction: '#submit'
			,before:function (obj) {
				this.data = {resname:$("#resname").val(),
				 resex:$("input[name='resex']:checked").val(),
				 rebirth:$("#rebirth").find("option:selected").val(),
				 degreeid:$("#degree").find("option:selected").val(),
				 reexper:$("#reexper").find("option:selected").val(),
				 retel:$("#retel").val(),
				 reset:$("input[name='reset']:checked").val()
				}
			}
			,choose: function(obj){
			//预读本地文件示例，不支持ie8
			obj.preview(function(index, file, result){
				$('#img_upload').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img" style="width: 135px;height: 80px">');
			});
			}
			,done: function(res){
				//上传完毕回调
				layer.msg(res);
			}
			,error: function(){
				//请求异常回调
				alert("上传失败！");
			}
		});

	});
	$(function () {
	var year=new Date().getFullYear(); //获取当前年份
	var sel =  document.getElementById ('rebirth');//获取select下拉列表
	for ( var i = 1961; i < year-17; i++)//循环添加法定退休年龄到满18周岁
	{
		var option = document.createElement ('option');
		option.value = i;
		var txt = document.createTextNode (i);
		option.appendChild (txt);
		sel.appendChild (option);
	}


	});
//这里点击验证码需要访问控制层
	$("#findCode").click(function () {
	console.log("手机号"+$("#retel").val().length);
	if($("#retel").val().length==11){
		$("#codeForm").css("display","block");
		settime(this);
		var retel=$("#retel").val();
		retel=JSON.stringify(retel);
		$.ajax({
			url:'${pageContext.request.contextPath}/school/sendMsg',
			type:'post',
			data:'retel='+retel,
			dataType:'text',
			success:function(msg){
				$("#scode").val(msg);
			},error:function (err) {
				console.log(err);
			}
		})
	}else{
		layer.msg("请先填写手机号！！！");
	}
});

	var countdown=60;        //初始值
	var scode = "";
	function settime(val) {
		if (countdown == 0) {
			val.innerHTML="获取验证码";
			countdown = 60;
			scode = "";
			return false;
		} else {
			val.innerHTML="重新发送(" + countdown + ")";
			$("#findCode").css("disabled","disabled");
			console.log(countdown);
			countdown--;
		}
		setTimeout(function() {   //设置一个定时器，每秒刷新一次
			settime(val);
		},1000);
	}
</script>
</body>
</html>
