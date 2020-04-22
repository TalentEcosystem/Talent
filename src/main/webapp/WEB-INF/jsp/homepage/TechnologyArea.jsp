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
		.nav span{
			float: right;
			display: inline-block;
			margin-top: 5px;
			height:32px;
			width:180px;
			font-size: 15px;
			background: #F6F6F6 ;
			line-height: 33px;
			text-align: center;
			position: relative;
			z-index:99999
		}
		.nav ul{
			position: absolute;
			width:180px;
			margin-top: -10px;
			display: none;
			background: #F6F6F6
		}
		.lo{
			width: 200px;
			height: 45px;

			/*background-color: #F6F6F6;*/
			float: left;
			font-size: 23px;
			text-align: right;

		}
		.log ul{
			position: absolute;
			width:160px;
			display: none;
			background: #F6F6F6;
			text-align: center;
			margin: 32px 180px ;
			font-size: 18px;

		}
		.reg ul{
			position: absolute;
			width:160px;
			display: none;
			background: #F6F6F6;
			text-align: center;
			margin: 32px 240px ;
			font-size: 18px;
		}

		.li_yysy{
			background:#6EC7FF;
		}
		.mainWarp ul{
			margin-left: 20px
		}
		.mainWarp ul li{
			font-size: 22px;
			width: 120px;
		}
	</style>


</head>
<body>
<input type="hidden" id="path" value="<%=path%>">
<div class="topDiv">
	<div class="topL">
		<div class="logo">
			<img src="${pageContext.request.contextPath}/images/LOGO.png" />
			<img src="${pageContext.request.contextPath}/images/view_logo40.png" class="img1"/>
		</div>
		<img src="${pageContext.request.contextPath}/images/spirit_40.png" />
	</div>
	<div class="topR" style="margin-top: 5px">
		<c:if test="${not empty uname}">
			<div class="nav" style="background-color: #F6F6F6">
					<span>
			<img src="${pageContext.request.contextPath}/${uhead}" style="width: 32px;height: 30px; border-radius: 25px;">
	        <a href="">${uname}</a>
            <ul>
	            <a href="${pageContext.request.contextPath}/user/personal"  ><li class="ll" >个人中心</li></a>
	             <a href=""><li class="ll">我的简历</li></a>
	             <a href=""><li class="ll">求职反馈</li></a>
	             <a href=""><li class="ll">收藏</li></a>
	             <a href="" ><li class="ll">退出</li></a>
            </ul>
        </span>
			</div>
		</c:if>

		<c:if test="${empty uname}">
			<div class="log">
				<a href="#" class="lo" style="width: 90px;margin-left: 200px;" >登录</a>
				<ul>
					<a href="${pageContext.request.contextPath}/user/login"><li class="ll" style="padding: 20px">用户登录</li></a>
					<a href="${pageContext.request.contextPath}/Enterprise/path/EnterpriseLogin"><li class="ll" style="padding: 20px">企业登录</li></a>
				</ul>
			</div>
			<div class="reg">
				<a href="#" class="lo" style="width: 90px;margin-left: 10px;text-align: left" >注册</a>
				<ul>
					<a href="${pageContext.request.contextPath}/user/registered"><li class="ll" style="padding: 20px">用户注册</li></a>
					<a href="${pageContext.request.contextPath}/Enterprise/path/EnterpriseRegister"><li class="ll" style="padding: 20px">企业注册</li></a>
				</ul>
			</div>
		</c:if>
		<%--鼠标经过 用户名 显示  离开隐藏--%>
		<script type="text/javascript">
			//hover接收2个参数,第一个是经过,第二个是离开;
			$('.log').hover(function(){
				$(this).find('ul').show();
			},function(){
				$(this).find('ul').hide();
			});
			//hover接收2个参数,第一个是经过,第二个是离开;
			$('.reg').hover(function(){
				$(this).find('ul').show();
			},function(){
				$(this).find('ul').hide();
			});

			//经过用户名按钮背景变色
			$('.nav span').hover(function(){
				$(this).find('ul').show();
			},function(){
				$(this).find('ul').hide();
			});
			$('.nav  li').hover(function(){
				$(this).addClass("li_yysy")
			},function(){
				$(this).removeClass("li_yysy")
			});
			//经过登录按钮背景变色
			$('.log  li').hover(function(){
				$(this).addClass("li_yysy")
			},function(){
				$(this).removeClass("li_yysy")
			});
			//经过注册按钮背景变色
			$('.reg  li').hover(function(){
				$(this).addClass("li_yysy")
			},function(){
				$(this).removeClass("li_yysy")
			});

		</script>
<%--		<div class="topR0 topR1"><a href="zhuceCompany.html">企业招聘</a></div>--%>
<%--		<div class="topR0 topR2"><a href="zhuce.html">注册</a></div>--%>
<%--		<div class="topR0 topR3"><a href="login.html">个人登录</a></div>--%>
<%--		<div class="topR0 topR4"><a href="javascript:void()">手机找工作</a></div>--%>
		<div class="clear"></div>
	</div>
</div>
<div class="menuDiv">
	<div class="mainWarp">
		<ul >
			<li ><a href="${pageContext.request.contextPath}/HomePage/index">首页</a></li>
			<li><a href="${pageContext.request.contextPath}/HomePage/searchJob">找工作</a></li>
			<li class="onmenu"><a href="${pageContext.request.contextPath}/HomePage/getTechnologyArea?curPage=1">技术成长</a></li>
<%--			<li ><a href="meetingJob.html">招聘会</a></li>--%>
			<li><a href="jobnews.html">就业资讯</a></li>
			<li><a href="${pageContext.request.contextPath}/user/personal" id="personal">个人中心</a></li>
<%--			<li><a href="helpJob.html">求职互助</a></li>--%>
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
									<a href="${pageContext.request.contextPath}/HomePage/getCourseDetails?proid=${k.productid}">
									<div class="kclb" style="background-image: url('${pageContext.request.contextPath}/${k.propic}')" >
										<img src="${pageContext.request.contextPath}/images/jiangshi.jpg" >
									</div>
									<div class="kcxx" >
										<p style="float: left">${k.proname}</p>
										<p style="float: left ;padding-left: 5px"></p>
										<p style="float: right;margin: 20px 8px">${k.teachername}</p>
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
