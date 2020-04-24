<%@ page import="com.great.talent.entity.JobData" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: Minzg
  Date: 2020/4/17
  Time: 9:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>找工作-岗位详情</title>
	<%
		String path=request.getContextPath();
		JobData jobData =  (JobData) session.getAttribute("jobData");
		SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String sDate=sdf2.format(jobData.getPositiontime());
	%>
	<link rel="stylesheet" href=<%=path+"/js/layui/css/layui.css"%>>
	<link rel="stylesheet" href=<%=path+"/css/company.css"%>>
	<script src=<%=path+"/js/jquery-3.4.1.js" %>></script>
	<script src=<%=path+"/js/layui/layui.js" %>></script>
</head>
<body>
<input type="hidden" id="path" value="<%=path%>">
<input type="hidden" id="positionid" value="<%=jobData.getPositionid()%>">
<div class="compHeader">
	<div class="main">
		<div class="header_l">
			<a href=<%=path+"/user/index" %>>
				<img src=<%=path+"/images/logo_1.png" %> />
				<img src=<%=path+"/images/logo_2.png" %> />
			</a>
		</div>
		<div class="header_r">
			<a href=<%=path+"/HomePage/searchJob" %>>找工作</a>
			<span>|</span>
			<a href=<%=path+"/user/index" %>>首页</a>
		</div>
	</div>
</div>

<div class="jobtypeBox">
	<div class="DivLeft">
		<div class="DivCompany">
			<div class="DivCompany_img"><img style="width: 250px;height: 180px" src=<%=path+"/"+jobData.getCompanypic() %> /></div>
			<h1><a href=""><%=jobData.getCompanyname()%></a><img src=<%=path+"/images/16.png" %> /></h1>
<%--			<div class="DivLeft_1">--%>
<%--				<div class="gz1"><a href="">+关注</a></div>--%>
<%--				<div class="gz2">答复率<span>100.0%</span></div>--%>
<%--			</div>--%>
			<div class="clear"></div>
			<div class="DivLeft_2">
				<p>行业：<%=jobData.getIndname()%></p>
				<p>性质：<%=jobData.getCompanynature()%></p>
				<p>规模：<%=jobData.getCompanynum()%></p>
<%--				<p>企业主页：<a href="">http://www.**********.com</a></p>--%>
				<p>详细地址：<%=jobData.getCompanyadd()%></p>
				<p>简介：<%=jobData.getCompanypro()%></p>
			</div>
			<div class="clear"></div>
			<div class="clear"></div>
		</div>
	</div>
	<div class="DivRight">
		<div class="DivRight_2">
			<div class="divJob_1">
				<div class="divJob_l">
					<div class="tit">
						<h2><%=jobData.getPositionname()%></h2>
						<div class="clear"></div>
					</div>
					<div class="bqbox">
						<c:if test="${not empty welfare}">
							<c:forEach items="${welfare}" step="1" var="i">
								<label>${i.welname}</label>
							</c:forEach>
						</c:if>
						<div class="clear"></div>
					</div>
					<div class="jobsub">工作地点： <span><%=jobData.getPositionaddress()%></span></div>
					<div class="jobsub">职位月薪： <%=jobData.getMoney()%></div>
					<div class="jobsub">招聘人数： <%=jobData.getMaxnum()%></div>
					<div class="jobsub">最低学历： <%=jobData.getDegreename()%></div>
					<div class="jobsub">工作经验： <%=jobData.getPositionexper()%></div>
					<div class="jobsub">发布日期： <%=sDate%></div>
				</div>
				<div class="divJob_r">
					<div class="JobShare">
						<p><img src=<%=path+"/images/shareqrcode.gif" %> /></p>
						<div class="shareitem"></div>
					</div>
				</div>
			</div>
			<div class="clear"></div>
			<div class="divJob_2">
				<div class="divJob_2_1" id="application">立即申请</div>
				<div class="divJob_2_2" id="collection">收藏</div>
			</div>
			<div class="clear"></div>
			<div class="divJob_3">
				<b>岗位职责：</b><br />
				<div class="con">
					<%=jobData.getPositioncontent()%>
				</div>
				<b>岗位要求：</b><br />
				<div class="con">
					<%=jobData.getRequest()%>
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
</div>

<div class="clear"></div>
<div class="footer">
	<p><a href="">**人才</a>旗下<img src=<%=path+"/images/logo_foot.gif" %> />蝶飞人才网版权所有 <a href="">京ICP证0******9号</a><a href=""></a>本网站所有招聘信息，未经书面授权不得转载 投诉电话：400-8**-****</p>
</div>
<script>
 layui.use(['layer'], function () { //导入模块
	//申请
	$("#application").click(function () {
		var path = $("#path").val();
		var positionid = $("#positionid").val();
		$.ajax({
			async:true,
			method : "POST",
			url :path+'/user/jobApplication',
			data:{"positionid":positionid},
			dataType : "text",
			success:function(msg){
				if ("1111"==msg){
					layer.alert("申请成功",{icon:6});
				}else if ("error"==msg) {
					layer.alert("网络繁忙",{icon:2});
				}else if ("notResume"==msg) {
					layer.alert("您的简历不完整",{icon:2},function () {
						location.href=path+"/school/findUserResume"
					});
				}else if ("notLogin"==msg) {
					layer.alert("您还没有登录",{icon:2},function () {
						location.href=path+"/user/login"
					});
				}else if ("2222"==msg) {
					layer.alert("您已经申请过啦！",{icon:6});
				}
			}
		})
	});
	//收藏
	$("#collection").click(function () {
		var path = $("#path").val();
		var positionid = $("#positionid").val();
		$.ajax({
			async:true,
			method : "POST",
			url :path+'/user/addCollection',
			data:{"positionid":positionid},
			dataType : "text",
			success:function(msg){
				if ("1111"==msg){
					layer.alert("收藏成功",{icon:6});
				}else if ("error"==msg) {
					layer.alert("网络繁忙",{icon:2});
				}else if ("notLogin"==msg) {
					layer.alert("您还没有登录",{icon:2},function () {
						location.href=path+"/user/login"
					});
				}else if ("2222"==msg) {
					layer.alert("您已经收藏过啦",{icon:2});
				}
			}
		})
	});
 });
</script>
</body>
</html>
