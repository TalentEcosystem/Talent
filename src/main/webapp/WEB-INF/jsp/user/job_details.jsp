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
<%--	<script type="text/javascript" src=<%=path+"/js/front/personals.js" %>></script>--%>
	<script src=<%=path+"/js/layui/layui.js" %>></script>
</head>
<body>
<input type="hidden" id="path" value="<%=path%>">
<div class="compHeader">
	<div class="main">
		<div class="header_l">
			<a href="index.html">
				<img src=<%=path+"/images/logo_1.png" %> />
				<img src=<%=path+"/images/logo_2.png" %> />
			</a>
			<span>www.diefeirencai.com</span>
		</div>
		<div class="header_c">
			<input name="" type="text" placeholder="请输入关键字..." class="keyword"/>
			<input name="" type="button" class="btnsearch"/>
		</div>
		<div class="header_r">
			<a href="login.html">个人登录</a>
			<a href="zhuce.html">注册</a>
			<span>|</span>
			<a href="loginCompany.html">企业登录</a>
		</div>
	</div>
</div>

<div class="jobtypeBox">
	<div class="DivLeft">
		<div class="DivCompany">
			<div class="DivCompany_img"><img src=<%=path+"/"+jobData.getCompanypic() %> width="180"/></div>
			<h1><a href="company.html"><%=jobData.getCompanyname()%></a><img src=<%=path+"/images/16.png" %> /></h1>
			<div class="DivLeft_1">
				<div class="gz1"><a href="">+关注</a></div>
				<div class="gz2">答复率<span>100.0%</span></div>
			</div>
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
<%--			<div class="DivLeft_4">--%>
<%--				<h2><span></span>猜你感兴趣</h2>--%>
<%--				<p><a href="searchJob_new.html">IT技术支持/维护经理</a></p>--%>
<%--				<p><a href="searchJob_new.html">硬件测试</a></p>--%>
<%--				<p><a href="searchJob_new.html">网络信息安全工程师</a></p>--%>
<%--				<p><a href="searchJob_new.html">综合布线</a></p>--%>
<%--				<p><a href="searchJob_new.html">软件测试</a></p>--%>
<%--				<p><a href="searchJob_new.html">IT品质管理</a></p>--%>
<%--			</div>--%>
		</div>
	</div>
	<div class="DivRight">
		<div class="DivRight_2">
			<div class="divJob_1">
				<div class="divJob_l">
					<div class="tit">
						<h2><%=jobData.getPositionname()%></h2>
						<div class="ly">
							<a href="">给HR留言</a>
						</div>
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
					<div class="jobsub">工作地点： <%=jobData.getPositionaddress()%></div>
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
				<div class="divJob_2_1">立即申请</div>
				<div class="divJob_2_2">关注</div>
				<div class="divJob_2_3">投诉</div>
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
<%--			<div class="jobotherlist">--%>
<%--				<div class="title">公司其他职位</div>--%>
<%--				<div class="jobtype">--%>
<%--					<div class="jobtypel">--%>
<%--						<p><a href="jobtype.html">绘图工程师</a> [惠州市]</p>--%>
<%--						<p><span class="red">月薪 面议</span> |全职 |招聘2人 |年龄20-30岁 |经验1~2年</p>--%>
<%--					</div>--%>
<%--					<div class="jobtyper">--%>
<%--						<p>1小时</p>--%>
<%--					</div>--%>
<%--					<div class="clear"></div>--%>
<%--				</div>--%>
<%--				<div class="jobtype">--%>
<%--					<div class="jobtypel">--%>
<%--						<p><a href="jobtype.html">储备管理干部</a> [惠州市]</p>--%>
<%--						<p><span class="red">月薪 面议</span> |全职 |招聘2人 |年龄20-30岁 |经验1~2年</p>--%>
<%--					</div>--%>
<%--					<div class="jobtyper">--%>
<%--						<p>1小时</p>--%>
<%--					</div>--%>
<%--					<div class="clear"></div>--%>
<%--				</div>--%>
<%--				<div class="jobtype">--%>
<%--					<div class="jobtypel">--%>
<%--						<p><a href="jobtype.html">品管员</a> [惠州市]</p>--%>
<%--						<p><span class="red">月薪 面议</span> |全职 |招聘2人 |年龄20-30岁 |经验1~2年</p>--%>
<%--					</div>--%>
<%--					<div class="jobtyper">--%>
<%--						<p>1小时</p>--%>
<%--					</div>--%>
<%--					<div class="clear"></div>--%>
<%--				</div>--%>
<%--				<div class="jobtype">--%>
<%--					<div class="jobtypel">--%>
<%--						<p><a href="jobtype.html">绘图工程师</a> [惠州市]</p>--%>
<%--						<p><span class="red">月薪 面议</span> |全职 |招聘2人 |年龄20-30岁 |经验1~2年</p>--%>
<%--					</div>--%>
<%--					<div class="jobtyper">--%>
<%--						<p>1小时</p>--%>
<%--					</div>--%>
<%--					<div class="clear"></div>--%>
<%--				</div>--%>
<%--			</div>--%>
		</div>
	</div>
</div>

<div class="clear"></div>
<div class="footer">
	<p><a href="">**人才</a>旗下<img src=<%=path+"/images/logo_foot.gif" %> />蝶飞人才网版权所有 <a href="">京ICP证0******9号</a><a href=""></a>本网站所有招聘信息，未经书面授权不得转载 投诉电话：400-8**-****</p>
</div>
</body>
</html>
