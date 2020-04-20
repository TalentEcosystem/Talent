<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/16
  Time: 22:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>章节配置</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/js/layui/css/layui.css">
	<script charset="UTF-8" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
	<script charset="UTF-8" src="${pageContext.request.contextPath}/js/layui/layui.js" media="all"></script>
	<%
		String path=request.getContextPath();
	%>
</head>
<body>
<input type="hidden" id="path" value="<%=path%>">
<input type="hidden" id="domainid">
<input type="hidden" id="productid">

<form class="layui-form" action="" onsubmit="return false">
	<div class="layui-form-item">
		<div class="layui-input-block">
			<button class="layui-btn" onclick="f()">获取章节信息</button>
		</div>
	</div>
	<div id="test1"></div>
	<div class="layui-form-item">
		<div class="layui-input-block">
			<button class="layui-btn" id="btn" onclick="confirm()" style="display: none;">分配完成</button>
		</div>
	</div>
	<script>
		function f(){
			var domainid=$("#domainid").val();
			var productid=$("#productid").val();
			var path=$("#path").val();
			$.ajax({
					url: path+"/admin/config",
					async: false,
					type: "POST",
					data: {"domainid":domainid,"productid":productid},
					datatype: "text",
					success: function (str) {
						var obj=[];
						var d=JSON.parse(str);
						for(var i=0;i<d.has.length;i++){
							obj.push(d.has[i].id)
						}
						console.log(obj);
						s(d.all,obj);
					},
					error: function () {
						alert("网络繁忙！")
					}
				}
			);

		}


		function s(all,obj){
			layui.use(['tree','util'],function(){
				var tree = layui.tree;
				//渲染
				tree.render({
					elem: '#test1'  //绑定元素
					,data: all
					,showCheckbox: true
					,id:'id'
				});
				tree.setChecked('id',obj);
			});
			$("#btn").show();
		}

		function confirm() {
			var path=$("#path").val();
			var productid=$("#productid").val();
			var tree = layui.tree;
			var checkData=[];
			checkData = tree.getChecked('id')
			$.ajax({
					url: path+"/admin/configSubmit",
					async: true,
					type: "POST",
					data: {"productid":productid,"checkData":JSON.stringify(checkData)},
					datatype: "text",
					success: function (str) {
						alert(str);
						var index = parent.layer.getFrameIndex(window.name);
						parent.layer.close(index);//关闭弹出的子页面窗口 layer.index表示当前层
						window.parent.location.reload();//刷新父级界面
					},
					error: function () {
						alert("网络繁忙！")
					}
				}
			);
		}
	</script>
</form>
</body>
</html>
