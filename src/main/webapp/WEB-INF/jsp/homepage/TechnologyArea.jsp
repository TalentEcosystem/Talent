<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/17
  Time: 17:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

	<title>技术专区</title>
	<% String path=request.getContextPath();%>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/homepage/css/searchJob.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/homepage/js/searchJob.js"></script>

	<style>
		#course{
			width: 100%;height: 50px;font-size: 20px
		}
		.meetsx span {
			padding-left: 40px;
		}
		.meetsx a {
			padding-left: 40px;
		}
		.zph table{
			width: 600px;margin-left: 100px;margin-top: 20px
		}
		.zph tr{
			float: left;width: 166px;height: 160px;margin-left: 10px
		}
		.kclb{
			width: 150px;height: 95px;
			background-image: url('${pageContext.request.contextPath}/images/ddz.jpg');
			background-size: 100% 100%;
		}
		.kclb img{
			width: 40px;height: 40px;background-color: #FD482C;
			margin: 70px 104px;border-radius: 50%;padding: 2px
		}
		.kcxx{
			width: 150px;height: 55px;background-color: #93D1FF;font-size: 10px
		}
		.con a{
			height: 110px;margin-top: 10px
		}
		.cktp{
			width: 120px;height: 110px;
			background-size:100% 100%; float: left
		}
		.cktpxx{
			width: 200px;height: 110px;background-color:#93D1FF; float: left
		}
	</style>


</head>
<body>
<input type="hidden" id="path" value="<%=path%>">
<div class="topDiv">
	<div class="topL">
		<div class="logo">
			<img src="images/LOGO.png" />
			<img src="images/view_logo40.png" class="img1"/>
		</div>
		<img src="images/spirit_40.png" />
	</div>
	<div class="topR">
		<div class="topR0 topR1"><a href="zhuceCompany.html">企业招聘</a></div>
		<div class="topR0 topR2"><a href="zhuce.html">注册</a></div>
		<div class="topR0 topR3"><a href="login.html">个人登录</a></div>
		<div class="topR0 topR4"><a href="javascript:void()">手机找工作</a></div>
		<div class="clear"></div>
	</div>
</div>
<div class="menuDiv">
	<div class="mainWarp">
		<ul>
			<li><a href="${pageContext.request.contextPath}/HomePage/index">首页</a></li>
			<li><a href="personal.html">个人中心</a></li>
			<li><a href="searchJob.html">职位搜索</a></li>
			<li class="onmenu"><a href="meetingJob.html">招聘会</a></li>
			<li><a href="jobnews.html">就业资讯</a></li>
			<li><a href="download.html">文档下载</a></li>
			<li><a href="helpJob.html">求职互助</a></li>
			<div class="clear"></div>
		</ul>
	</div>
</div>
<div class="clear"></div>
<div class="meetingDiv">
		<div class="part2">
			<div class="part2main">
				<div class="meetsx " id="course" >

					<span >课程库：</span>
					<a href="${pageContext.request.contextPath}/HomePage/getTechnologyArea?curPage1=1" ><i>全部</i></a>
					<c:if test="${not empty knowList}">
						<c:forEach items="${knowList}" step="1" var="n">
					<a href="${pageContext.request.contextPath}/HomePage/getTechnologyArea?curPage1=1&did=${n.domainid}"   ><i >${n.domainname}</i></a>
						</c:forEach>
					</c:if>
						</div>
				<div class="clear"></div>
			</div>
		</div>

		<div class="part3">
			<div class="part3L" style="width: 700px">
				<div class="zph">
						<table class=""  id="test" >
							<c:if test="${not empty myReportByPage}">
								<c:forEach items="${myReportByPage.list}" step="1" var="k">
							<tr >
								<td>
									<a href="">
									<div class="kclb" >
										<img src="${pageContext.request.contextPath}/images/jiangshi.jpg" >
									</div>
									<div class="kcxx" >
										<p style="float: left">${k.knowname}</p>
										<p style="float: left ;padding-left: 5px"></p>
										<p style="float: right;margin: 20px 8px">李白</p>
										<br>
										<p style="float: left ;margin: 25px 0 0 10px">免费</p>
									</div>
									</a>
								</td>
							</tr>
								</c:forEach>

							</c:if>
						</table>
				</div>

				<div class="clear"></div>
				<div class="fenyediv" id="quanbu" style="display: block">
					<a href="${pageContext.request.contextPath}/HomePage/getTechnologyArea?curPage1=${myReportByPage.prePageNum}&did=${domainid}" class="fy1">上一页</a>
					<c:forEach begin="${myReportByPage.startPage}" end="${myReportByPage.endPage}" var="p">
						<a href="${pageContext.request.contextPath}/HomePage/getTechnologyArea?curPage1=${p}&did=${domainid}" class="fy2">${p}</a>
					</c:forEach>
					<a href="${pageContext.request.contextPath}/HomePage/getTechnologyArea?curPage1=${myReportByPage.nextPageNum}&did=${domainid}"  class="fy1">下一页</a>

				</div>

			</div>
			<div class="part3R" style="width: 360px">

				<div class="part3_2">
					<h1>经典课程</h1>
					<div class="con" id="con">
						<%--获取经典课程信息--%>
						<script>
							$(function () {
								var path=$("#path").val();
								$.ajax({
									type: "post",
									url: path+"/HomePage/getClassCurri",
									// dataType: "json",
									async:true,
									success: function (data) {
										var study=JSON.parse(data);
										console.log(study);
										for (var i = 0; i <study.length ; i++) {
											$("#con").append(
												"<a href='"+path+"/HomePage/getCourseDetails?proid="+study[i].productid+"' >"+
												"<div class='cktp ' style='background-image: url("+path+"/"+study[i].propic+")' ></div>"+
												"<div class='cktpxx'>"+
												"<p>"+study[i].proname+"</p>"+
												"<p>免费</p>"+
												"<p>"+study[i].period+"</p>"+
												"<p>"+study[i].procount+"次播放</p>"+
												"</div>"+

												"</a>"
											);
										}
									},
									error: function (data) {
										console.log(data);
									}

								});
								}
							);


						</script>
					</div>
				</div>
<%--				<div class="part3_3">--%>
<%--				</div>--%>
			</div>
		</div>

</div>
<div class="clear"></div>
<div class="footer">
	<p><a href="">**人才</a>旗下<img src="images/logo_foot.gif" />蝶飞人才网版权所有 <a href="">京ICP证0******9号</a><a href=""></a>本网站所有招聘信息，未经书面授权不得转载 投诉电话：400-8**-****</p>
</div>
</body>
</html>
