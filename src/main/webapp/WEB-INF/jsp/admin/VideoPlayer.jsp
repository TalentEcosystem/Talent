<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/21
  Time: 9:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Title</title>
	<link rel="icon" href="${pageContext.request.contextPath}/vimage/images/Favicon.png">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/playercss/animate.css">
	<link rel="stylesheet" type="text/css" href="http://cdn.bootstrapmb.com/bootstrap/4.0.0/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/playercss/fontello.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/playercss/fontello-codes.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/playercss/thumbs-embedded.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/playercss/style.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/playercss/responsive.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/playercss/color.css">
</head>
<body>

<div class="wrapper">

	<header>
		<div class="top_bar">
			<div class="container">
				<div class="top_header_content">
					<div class="menu_logo">
						<a href="#"  title="" class="menu">
							<i class="icon-menu"></i>
						</a>
						<a href="#" title="" class="logo">
							<img src="${pageContext.request.contextPath}/vimage/images/logo.png" alt="">
						</a>
					</div><!--menu_logo end-->
					<ul class="controls-lv">
						<li>
							<a href="${pageContext.request.contextPath}/HomePage/index" title="" class="btn-default">返回首页</a>
						</li>
					</ul><!--controls-lv end-->
				</div><!--top_header_content end-->
			</div>
		</div><!--header_content end-->

	</header>

	<section class="mn-sec">
		<div class="container">
			<div class="row">
				<div class="col-lg-9">
					<div class="mn-vid-sc single_video">
						<div class="vid-1">
							<div class="vid-pr">
								<video
										id="my-video"
										class="video-js"
										controls
										preload="auto"
										width="640"
										height="264"
										poster="${pageContext.request.contextPath}/vimage/images/poster-img.jpg"
										data-setup="{}"
								>
										<source src="${pageContext.request.contextPath}/${chapurl}" type="video/mp4" />
								</video>
							</div><!--vid-pr end-->
							<div class="vid-info">
								<h3>更多视频资源等待后续更新上传</h3>
							</div><!--vid-info end-->
						</div><!--vid-1 end-->
					</div><!--mn-vid-sc end--->
				</div><!---col-lg-9 end-->
				<div class="col-lg-3">
					<div class="sidebar">
						<div class="vidz-prt">
							<h2 class="sm-vidz">推荐视频</h2>
							<h3 class="aut-vid">
								<span>Autoplay </span>
								<label class="switch">
									<input type="checkbox">
									<b class="slider round"></b>
								</label>
							</h3>
							<div class="clearfix"></div>
						</div><!--vidz-prt end-->
						<div class="videoo-list-ab">
							<div class="videoo">
								<div class="vid_thumbainl">
									<a href="${pageContext.request.contextPath}/admin/showVideo?chapterid=1002">
										<img src="${pageContext.request.contextPath}/vimage/images/vide1.png" alt="">
										<span class="vid-time">10:21</span>
										<span class="watch_later">
											<i class="icon-watch_later_fill"></i>
										</span>
									</a>
								</div><!--vid_thumbnail end-->
								<div class="video_info">
									<h3>Java基本数据类型</h3>
									<h4>newfox media<span class="verify_ic"><i class="icon-tick"></i></span></h4>
									<span>686K 播放 .<small class="posted_dt">1 week ago</small></span>
								</div>
							</div><!--videoo end-->
							<div class="videoo">
								<div class="vid_thumbainl">
									<a href="${pageContext.request.contextPath}/admin/showVideo?chapterid=1003">
										<img src="${pageContext.request.contextPath}/vimage/images/vide2.png" alt="">
										<span class="vid-time">13:49</span>
										<span class="watch_later">
											<i class="icon-watch_later_fill"></i>
										</span>
									</a>
								</div><!--vid_thumbnail end-->
								<div class="video_info">
									<h3>Java封装</h3>
									<h4>newfox media<span class="verify_ic"><i class="icon-tick"></i></span></h4>
									<span>686K 播放 .<small class="posted_dt">1 week ago</small></span>
								</div>
							</div><!--videoo end-->
						</div><!--videoo-list-ab end-->
					</div><!--side-bar end-->
				</div>
			</div>
		</div>
	</section><!--mn-sec end-->
</div><!--wrapper end-->

</body>
</html>
