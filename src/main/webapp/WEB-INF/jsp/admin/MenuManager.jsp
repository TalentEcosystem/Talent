<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/10
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>权限管理</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/layui/css/layui.css">
	<script charset="UTF-8" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
	<script charset="UTF-8" src="${pageContext.request.contextPath}/js/layui/layui.js" media="all"></script>
	<style>
		#d{
			width: 700px;
			height: 650px;
			margin-top: 5px;
			margin-left: 250px;
		}
		#d2{
			width: 200px;
			height: 650px;
			border: 1px solid black;
			padding-left: 10px;
			float: left
		}
		#d1{
			width: 100px;
			height: 650px;
			border: 1px solid black;
			padding-left: 10px;
			float: left
		}

		#d4{
			width: 200px;
			height: 650px;
			border: 1px solid black;
			padding-left: 10px;
			float: left
		}

		#d3{
			width: 100px;
			height: 650px;
			border: 1px solid black;
			padding-left: 10px;
			float: left
		}
		#btn1,#btn2,#btn3,#btn4,#btn5,#btn6,#btn0{
			width: 80px;
			height: 30px;
			margin-left: 5px;
			margin-top: 20px;
		}
	</style>
	<%
		String path=request.getContextPath();
	%>
	<script>
		function enterprise() {
			var path=$("#path").val();
			location.href=path+"/admin/menuManager?roleid=2";
		}

		function admin() {
			var path=$("#path").val();
			location.href=path+"/admin/menuManager?roleid=3";
		}

		function school() {
			var path=$("#path").val();
			location.href=path+"/admin/menuManager?roleid=1";
		}

		function left() {
			var temp=$("input[type=checkbox][name=right]:checked");
			if(temp.length>0){
				var roleid=$("#roleid").val();
				var path=$("#path").val();

				var arr=[];
				for(var i=0;i<temp.length;i++){
					arr.push(temp[i].value)
				}
				$.ajax({
						url: path+"/admin/menuManagerLeft",
						async: true,
						type: "POST",
						data: {"arr":arr,"roleid":roleid},
						traditional: true,
						datatype: "text",
						success: function (msg) {
							if(msg=="success"){
								alert("分配成功,重新登陆后生效")
								location.href=path+"/admin/menuManager?roleid="+roleid;
							}
						},
						error: function () {
							alert("网络繁忙！")
						}
					}
				);
			}else{
				alert("请至少选中一个需要分配的菜单")
			}
		}

		function leftMore() {
			var roleid=$("#roleid").val();
			var path=$("#path").val();
			$.ajax({
					url: path+"/admin/menuManagerLeftMore",
					async: true,
					type: "POST",
					data: {"roleid":roleid},
					traditional: true,
					datatype: "text",
					success: function (msg) {
						if(msg=="success"){
							alert("分配成功,重新登陆后生效");
							location.href=path+"/admin/menuManager?roleid="+roleid;
						}
					},
					error: function () {
						alert("网络繁忙！")
					}
				}
			);
		}

		function right() {
			var temp=$("input[type=checkbox][name=left]:checked");
			if(temp.length>0){
				var roleid=$("#roleid").val();
				var path=$("#path").val();

				var arr=[];
				for(var i=0;i<temp.length;i++){
					arr.push(temp[i].value)
				}
				$.ajax({
						url: path+"/admin/menuManagerRight",
						async: true,
						type: "POST",
						data: {"arr":arr,"roleid":roleid},
						traditional: true,
						datatype: "text",
						success: function (msg) {
							if(msg=="success"){
								alert("分配成功,重新登陆后生效");
								location.href=path+"/admin/menuManager?roleid="+roleid;
							}
						},
						error: function () {
							alert("网络繁忙！")
						}
					}
				);
			}else{
				alert("请至少选中一个需要分配的菜单")
			}
		}

		function rightMore() {
			var roleid=$("#roleid").val();
			var path=$("#path").val();
			$.ajax({
					url: path+"/admin/menuManagerRightMore",
					async: true,
					type: "POST",
					data: {"roleid":roleid},
					traditional: true,
					datatype: "text",
					success: function (msg) {
						if(msg=="success"){
							alert("分配成功,重新登陆后生效");
							location.href=path+"/admin/menuManager?roleid="+roleid;
						}
					},
					error: function () {
						alert("网络繁忙！")
					}
				}
			);
		}
	</script>
</head>
<body>
<input type="hidden" id="path" value="<%=path%>">
<input type="hidden" id="roleid" name="roleid" value="${roleid}">
<div id="d" style="margin-top: 30px">
	<div id="d1">
		<h3>角色</h3>
		<input type="button" value="管理员" id="btn1" onclick="admin()"><br/>
		<input type="button" value="企业人员" id="btn2" onclick="enterprise()"><br/>
		<input type="button" value="高校人员" id="btn0" onclick="school()">
	</div>

	<div id="d2">
		<h3>已分配菜单</h3><br/>
		<c:if test="${not empty hasList}">
			<c:forEach items="${hasList}" var="menu">
				<c:if test="${menu.parentid==0}">
					<label style="font-weight: bold">${menu.mname}</label><br/>
					<c:forEach items="${hasList}" var="m">
						<c:if test="${m.parentid==menu.menuid}">
							<input type="checkbox" name="left" value="${m.menuid}">${m.mname}<br/>
						</c:if>
					</c:forEach>
					<br/>
				</c:if>

			</c:forEach>
		</c:if>
	</div>

	<div id="d3">
		<br/><br/><br/><br/><br/><br/>
		<input type="button" value="<<" id="btn3" onclick="leftMore()"><br/>
		<input type="button" value="<" id="btn4" onclick="left()"><br/>
		<input type="button" value=">>" id="btn5" onclick="rightMore()"><br/>
		<input type="button" value=">" id="btn6" onclick="right()">
	</div>

	<div id="d4">
		<h3>未分配菜单</h3><br/>
		<c:if test="${not empty allList}">
			<c:forEach items="${allList}" var="menu">
				<c:if test="${menu.parentid==0}">
					<label style="font-weight: bold">${menu.mname}</label><br/>
					<c:forEach items="${allList}" var="m">
						<c:if test="${m.parentid==menu.menuid}">
							<input type="checkbox" name="right" value="${m.menuid}">${m.mname}<br/>
						</c:if>
					</c:forEach>
					<br/>
				</c:if>

			</c:forEach>
		</c:if>
	</div>
</div>
</body>
</html>
