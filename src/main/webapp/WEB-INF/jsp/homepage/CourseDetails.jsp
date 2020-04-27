<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/17
  Time: 9:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>课程详情</title>
	<% String path=request.getContextPath();%>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/js/layui/css/layui.css" charset="UTF-8" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/layui/layui.js" charset="UTF-8"></script>

	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/homepage/css/searchJob.css" />
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/homepage/css/pinglun.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/homepage/js/searchJob.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/homepage/js/CourseDetails.js"></script>
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
	<div class="topR">
		<c:if test="${not empty uname}">

			<div class="nav" style="background-color: #F6F6F6">
					<span>
			<img src="${pageContext.request.contextPath}/${uhead}" style="width: 32px;height: 30px; border-radius: 25px;">
	        <a href="">${uname}</a>
            <ul>
	            <a href="${pageContext.request.contextPath}/user/personal"  ><li class="ll">个人中心</li></a>
	             <a href=""><li class="ll">我的简历</li></a>
	             <a href=""><li class="ll">求职反馈</li></a>
	             <a href=""><li class="ll">收藏</li></a>
	             <a href="" ><li class="ll">退出</li></a>
            </ul>
        </span>
			</div>
			<input type="hidden" value="${uid}" id="uid">
		</c:if>

		<c:if test="${empty uname}">
			<div class="log">

				<a href="#" class="lo" style="width: 90px;margin-left: 200px;" >登录</a>
				<ul>
					<a href="${pageContext.request.contextPath}/user/login"><li class="ll">用户登录</li></a>
					<a href="${pageContext.request.contextPath}/Enterprise/path/EnterpriseLogin"><li class="ll">后台登录</li></a>
				</ul>

			</div>
			<div class="reg">
				<a href="#" class="lo" style="width: 80px;text-align: center" >注册</a>
				<ul>
					<a href="${pageContext.request.contextPath}/user/registered"><li class="ll">用户注册</li></a>
					<a href="${pageContext.request.contextPath}/Enterprise/path/EnterpriseRegister"><li class="ll">企业注册</li></a>
				</ul>
			</div>
		</c:if>

		<div class="clear"></div>
	</div>
</div>
<div class="menuDiv">
	<div class="mainWarp">
		<ul>
			<li><a href="${pageContext.request.contextPath}/HomePage/index">首页</a></li>
			<li><a href="${pageContext.request.contextPath}/HomePage/searchJob">找工作</a></li>
			<li class="onmenu"><a href="${pageContext.request.contextPath}/HomePage/getTechnologyArea?curPage=1">技术成长</a></li>
<%--			<li ><a href="meetingJob.html">招聘会</a></li>--%>
<%--			<li><a href="jobnews.html">就业资讯</a></li>--%>
			<li><a href="${pageContext.request.contextPath}/user/personal" id="personal">个人中心</a></li>
<%--			<li><a href="helpJob.html">求职互助</a></li>--%>
			<div class="clear"></div>
		</ul>
	</div>
</div>
<div class="clear"></div>
<div class="meetingDiv">
	<!--   <div class="part1">-->
	<!--     <a href="javascript:void()"><img src="images/img1.png" /></a>-->
	<!--   </div>-->
<c:if test="${not empty product}">
	<input type="hidden" id="productid" value="${product.productid}">
	<div class="part2">
		<div class="part2main">
			<div class="meetsx" id="meetsx1" >
				<img style="padding-left: 70px;max-width: 80%;max-height: 80%" src="${pageContext.request.contextPath}/${product.propic}">
			</div>
			<div class="meetsx" id="meetsx2" >
				<p >${product.proname}</p>
				<p >本课程包含${product.num}章节，${product.period}</p>
				<p style="width: 95%">${product.prointro} </p>
				<p >
					<img src="${pageContext.request.contextPath}/images/9.png" alt=""/>${product.num}章节
					<img src="${pageContext.request.contextPath}/images/04.gif" />${product.procount}次播放
<%--					<img src="${pageContext.request.contextPath}/images/09.gif" alt=""/>2人共同学习--%>
				</p>
				<p >
<%--					<button class="">--%>
<%--						<img src="${pageContext.request.contextPath}/images/04.gif" />播放视频--%>
<%--					</button>--%>
				</p>
			</div>

			<div class="clear"></div>
		</div>
	</div>

	<div class="part3">
		<div class="part3L">
			<div class="zph">
				<ul id="tabmeet">
					<li class="current">课程目录</li>
					<li>课程介绍</li>
					<li >心得分享</li>
					<li>作品展示</li>
					<div class="clear"></div>
				</ul>
				<div id="contentmeet">
					<ul class="contentmeetul" style="display: block" >
						<c:if test="${not empty product.date}">
						<c:forEach items="${product.date}" step="1" var="c">
						<a href="${pageContext.request.contextPath}/admin/showVideo?chapterid=${c.chapterid}" class="item gray">
							<img style="margin-right: 20px" src="../images/04.gif" />${c.chname}
						</a>
						</c:forEach>
						</c:if>
						<c:if test="${empty product.date}">
							<div class="item gray">
								暂无章节
							</div>

						</c:if>
					</ul>
					<ul style="height: 600px">
						${product.prointro}
					</ul>

					<ul class="contentmeetul" >

						<div class="test">
							<div lang="en-US" class="gitment-container gitment-editor-container">
								<div class="gitment-editor-main">
									<div class="gitment-editor-header">
										<nav class="gitment-editor-tabs">
											<button class="gitment-editor-tab gitment-selected">编辑</button>
										</nav>
									</div>
									<div class="gitment-editor-body">
										<div class="gitment-editor-write-field">
											<textarea placeholder="你想说些什么" title="Login to Comment" id="comcent" autocomplete="off"></textarea>
										</div>
										<div class="gitment-editor-preview-field gitment-hidden">
											<div class="gitment-editor-preview gitment-markdown"></div>
										</div>
									</div>
								</div>
								<div class="gitment-editor-footer">
									<button class="gitment-editor-submit" title="Login to Comment" id="pinglun" >评论</button>
								</div>
							</div>
							<div lang="en-US" class="gitment-container gitment-comments-container">
								<div class="gitment-comments-list" id="pinglist" >
							<%--评论的内容--%>

								</div>
							</div>
						</div>

					</ul>


					<ul>
						<div class="layui-carousel" id="test10" style="margin-left: 20%">
							<div carousel-item="">
								<div class="tu"><img src="${pageContext.request.contextPath}/${product.propic}" ></div>
								<div class="tu"><img src="${pageContext.request.contextPath}/${product.propic}"></div>
								<div class="tu"><img src="${pageContext.request.contextPath}/${product.propic}"></div>
							</div>
						</div>
					</ul>
				</div>
			</div>

			<div class="clear"></div>

			<div class="fenyediv">
			</div>
		</div>
		<div class="part3R">
			<div class="part3_2">
				<h1>课程排行</h1>
				<div class="con" id="con">
			<%--内容--%>
				</div>
			</div>
			<div class="part3_3">
				<div class="title">温馨提示</div>
				<div class="content">良好的学习有助于更好的提升自己，让自己更优秀。</div>
			</div>
		</div>
	</div>
</c:if>
</div>
<div class="clear"></div>
<div class="footer">
	<p><a href="">**人才</a>旗下<img src="images/logo_foot.gif" />蝶飞人才网版权所有 <a href="">京ICP证0******9号</a><a href=""></a>本网站所有招聘信息，未经书面授权不得转载 投诉电话：400-8**-****</p>
</div>
</body>
</html>
