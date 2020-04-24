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
					<div class="search_form">
						<form>
							<input type="text" name="search">
							<button type="submit">
								<i class="icon-search"></i>
							</button>
						</form>
					</div><!--search_form end-->
					<ul class="controls-lv">
						<li>
							<a href="#" title=""><i class="icon-message"></i></a>
						</li>
						<li>
							<a href="#" title=""><i class="icon-notification"></i></a>
						</li>
						<li class="user-log">
							<div class="user-ac-img">
								<img src="${pageContext.request.contextPath}/vimage/images/user-img.png" alt="">
							</div>
							<div class="account-menu">
								<h4>AZYRUSMAX <span class="usr-status">PRO</span></h4>
								<div class="sd_menu">
									<ul class="mm_menu">
										<li>
											<span>
												<i class="icon-user"></i>
											</span>
											<a href="#" title="">我的频道</a>
										</li>
										<li>
											<span>
												<i class="icon-paid_sub"></i>
											</span>
											<a href="#" title="">付费订阅</a>
										</li>
										<li>
											<span>
												<i class="icon-settings"></i>
											</span>
											<a href="#" title="">设置</a>
										</li>
										<li>
											<span>
												<i class="icon-logout"></i>
											</span>
											<a href="#" title="">注销</a>
										</li>
									</ul>
								</div><!--sd_menu end-->
								<div class="sd_menu scnd">
									<ul class="mm_menu">
										<li>
											<span>
												<i class="icon-light"></i>
											</span>
											<a href="#" title="">切换主题</a>
											<label class="switch">
												<input type="checkbox">
												<b class="slider round"></b>
											</label>
										</li>
										<li>
											<span>
												<i class="icon-language"></i>
											</span>
											<a href="#" title="">语言</a>
										</li>
										<li>
											<span>
												<i class="icon-feedback"></i>
											</span>
											<a href="#" title="">反馈</a>
										</li>
										<li>
											<span>
												<i class="icon-location"></i>
											</span>
											<a href="#" title="">印度语</a>
											<i class="icon-arrow_below"></i>
										</li>
									</ul>
								</div><!--sd_menu end-->
								<div class="restricted-mode">
									<h4>节能模式</h4>
									<label class="switch">
										<input type="checkbox" checked>
										<span class="slider round"></span>
									</label>
									<div class="clearfix"></div>
								</div><!--restricted-more end-->
							</div>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/HomePage/index" title="" class="btn-default">返回首页</a>
						</li>
					</ul><!--controls-lv end-->
					<div class="clearfix"></div>
				</div><!--top_header_content end-->
			</div>
		</div><!--header_content end-->
		<div class="btm_bar">
			<div class="container">
				<div class="btm_bar_content">
					<nav>
						<ul>
							<li><a href="#" title="">目录</a>

							</li>
							<li><a href="#" title="">分类</a></li>
							<li><a href="#" title="">推荐</a></li>
							<li><a href="#" title="">趋势</a></li>
							<li><a href="#" title="">直播</a></li>
							<li><a href="#" title="">视频</a></li>
						</ul>
					</nav><!--navigation end-->
					<ul class="shr_links">
						<li>
							<h3>Go to : </h3>
						</li>
						<li>
							<button data-toggle="tooltip" data-placement="top" title="Like">
								<i class="icon-like"></i>
							</button>
						</li>
						<li>
							<button data-toggle="tooltip" data-placement="top" title="Watch later">
								<i class="icon-watch_later"></i>
							</button>
						</li>
						<li>
							<button data-toggle="tooltip" data-placement="top" title="Playlist">
								<i class="icon-playlist"></i>
							</button>
						</li>
						<li>
							<button data-toggle="tooltip" data-placement="top" title="Purchased">
								<i class="icon-purchased"></i>
							</button>
						</li>
						<li>
							<button data-toggle="tooltip" data-placement="top" title="History">
								<i class="icon-history"></i>
							</button>
						</li>
					</ul><!--shr_links end-->
					<ul class="vid_thums">
						<li>
							<a class="active" href="#" title=""><i class="icon-grid"></i></a>
						</li>
						<li>
							<a href="#" title="">
								<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
								     viewBox="0 0 108 108" xml:space="preserve">
									<rect width="63" height="45"/>
									<rect x="81" width="27" height="45"/>
									<rect x="45" y="63" width="63" height="45"/>
									<rect y="63" width="27" height="45"/>
								</svg>
							</a>
						</li>
					</ul><!--vid_status end-->
					<div class="clearfix"></div>
				</div><!--btm_bar_content end-->
			</div>
		</div><!--btm_bar end-->
	</header><!--header end-->

	<div class="side_menu">
		<div class="form_dvv">
			<a href="#" title="" class="login_form_show">登录</a>
		</div>
		<div class="sd_menu">
			<ul class="mm_menu">
				<li>
					<span>
						<i class="icon-home"></i>
					</span>
					<a href="#" title="">主页</a>
				</li>
				<li>
					<span>
						<i class="icon-fire"></i>
					</span>
					<a href="#" title="">趋势</a>
				</li>
				<li>
					<span>
						<i class="icon-subscriptions"></i>
					</span>
					<a href="#" title="">付费</a>
				</li>
			</ul>
		</div><!--sd_menu end-->
		<div class="sd_menu">
			<h3>Library</h3>
			<ul class="mm_menu">
				<li>
					<span>
						<i class="icon-history"></i>
					</span>
					<a href="#" title="">History</a>
				</li>
				<li>
					<span>
						<i class="icon-watch_later"></i>
					</span>
					<a href="#" title="">Watch Later</a>
				</li>
				<li>
					<span>
						<i class="icon-purchased"></i>
					</span>
					<a href="#" title="">Purchases</a>
				</li>
				<li>
					<span>
						<i class="icon-like"></i>
					</span>
					<a href="#" title="">Liked Videos</a>
				</li>
				<li>
					<span>
						<i class="icon-play_list"></i>
					</span>
					<a href="#" title="">Playlist</a>
				</li>
			</ul>
		</div><!--sd_menu end-->
		<div class="sd_menu subs_lst">
			<h3>Subscriptions</h3>
			<ul class="mm_menu">
				<li>
					<span class="usr_name">
						<img src="${pageContext.request.contextPath}/vimage/images/th1.png" alt="">
					</span>
					<a href="#" title="">Dr Disrespect</a>
					<small>3</small>
				</li>
				<li>
					<span class="usr_name">
						<img src="${pageContext.request.contextPath}/vimage/images/th2.png" alt="">
					</span>
					<a href="#" title="">ASMR</a>
					<small>6</small>
				</li>
				<li>
					<span class="usr_name">
						<img src="${pageContext.request.contextPath}/vimage/images/th3.png" alt="">
					</span>
					<a href="#" title="">Rivvrs</a>
					<small>2</small>
				</li>
				<li>
					<span class="usr_name">
						<img src="${pageContext.request.contextPath}/vimage/images/th4.png" alt="">
					</span>
					<a href="#" title="">The Verge</a>
					<small>11</small>
				</li>
				<li>
					<span class="usr_name">
						<img src="${pageContext.request.contextPath}/vimage/images/th5.png" alt="">
					</span>
					<a href="#" title="">Seeker</a>
					<small>3</small>
				</li>
				<li>
					<span class="usr_name">
						<img src="${pageContext.request.contextPath}/vimage/images/sn.png" alt="">
					</span>
					<a href="#" title="">Music</a>
					<small>20</small>
				</li>
			</ul>
			<a href="#" title="" class="more-ch"><i class="icon-arrow_below"></i> 更多</a>
		</div><!--sd_menu end-->
		<div class="sd_menu">
			<ul class="mm_menu">
				<li>
					<span>
						<i class="icon-settings"></i>
					</span>
					<a href="#" title="">设置</a>
				</li>
				<li>
					<span>
						<i class="icon-flag"></i>
					</span>
					<a href="#" title="">历史记录</a>
				</li>
				<li>
					<span>
						<i class="icon-logout"></i>
					</span>
					<a href="#" title="">推出</a>
				</li>
			</ul>
		</div><!--sd_menu end-->
		<div class="sd_menu m_linkz">
			<ul class="mm_menu">
				<li><a href="#">About</a></li>
				<li><a href="#">Community Rules </a></li>
				<li><a href="#">Privacy</a></li>
				<li><a href="#">Terms</a></li>
				<li><a href="#">Blogs</a></li>
				<li><a href="#">Contracts </a></li>
				<li><a href="#">Donate</a></li>
				<li><a href="#">FAQ</a></li>
			</ul>
			<span>azyrusthemes</span>
		</div><!--sd_menu end-->
		<div class="sd_menu bb-0">
			<ul class="social_links">
				<li>
					<a href="#" title="">
						<i class="icon-facebook-official"></i>
					</a>
				</li>
				<li>
					<a href="#" title="">
						<i class="icon-twitter"></i>
					</a>
				</li>
				<li>
					<a href="#" title="">
						<i class="icon-instagram"></i>
					</a>
				</li>
			</ul><!--social_links end-->
		</div><!--sd_menu end-->
		<div class="dd_menu"></div>
	</div><!--side_menu end-->

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
								<div class="info-pr">a<source src="#" type="video/mp4" />ur
									<span>60,723,169 点击</span>
									<ul class="pr_links">
										<li>
											<button data-toggle="tooltip" data-placement="top" title="I like this">
												<i class="icon-thumbs_up_fill"></i>
											</button>
											<span>388K</span>
										</li>
										<li>
											<button data-toggle="tooltip" data-placement="top" title="I dislike this">
												<i class="icon-thumbs_down_fill"></i>
											</button>
											<span>28K</span>
										</li>
									</ul>
									<div class="clearfix"></div>
								</div><!--info-pr end-->
							</div><!--vid-info end-->
						</div><!--vid-1 end-->
						<div class="abt-mk">
							<div class="info-pr-sec">
								<div class="vcp_inf cr">
									<div class="vc_hd">
										<img src="${pageContext.request.contextPath}/vimage/images/th5.png" alt="">
									</div>
									<div class="vc_info pr">
										<h4><a href="#" title="">ScereBro</a></h4>
										<span>Published on Oct 22, 2019</span>
									</div>
								</div><!--vcp_inf end-->
								<ul class="chan_cantrz">
									<li>
										<a href="#" title="" class="donate">Donate</a>
									</li>
									<li>
										<a href="#" title="" class="subscribe">Subscribe <strong>13M</strong></a>
									</li>
								</ul><!--chan_cantrz end-->
								<ul class="df-list">
									<li>
										<button data-toggle="tooltip" data-placement="top" title="Add to playlist">
											<i class="icon-add_to_playlist"></i>
										</button>
									</li>
									<li>
										<button data-toggle="tooltip" data-placement="top" title="Favorite">
											<i class="icon-like"></i>
										</button>
									</li>
									<li>
										<button data-toggle="tooltip" data-placement="top" title="Watch Later">
											<i class="icon-watch_later"></i>
										</button>
									</li>
									<li>
										<button data-toggle="tooltip" data-placement="top" title="Share">
											<i class="icon-share"></i>
										</button>
									</li>
									<li>
										<button data-toggle="tooltip" data-placement="top" title="Report Video">
											<i class="icon-flag"></i>
										</button>
									</li>
								</ul><!--df-list end-->
								<div class="clearfix"></div>
							</div>
							<div class="clearfix"></div>
							<div class="about-ch-sec">
								<div class="abt-rw">
									<h4>Cast:</h4>
									<ul>
										<li><span>Nathan Drake</span></li>
										<li><span>Victor Sullivan </span></li>
										<li><span>Sam Drake </span></li>
										<li><span>Elena Fisher</span></li>
									</ul>
								</div>
								<div class="abt-rw">
									<h4>分类 : </h4>
									<ul>
										<li><span>技术  </span></li>
										<li><span>1080p</span></li>
									</ul>
								</div>
								<div class="abt-rw">
									<h4>关于 : </h4>
									<p> 视频资源每天更新,如果没有您感兴趣的视频,请随时联系我们 </p>
								</div>
								<div class="abt-rw tgs">
									<h4>Tags : </h4>
									<ul>
										<li><a href="#" title="">技能</a></li>
										<li><a href="#" title="">分析讲解 </a></li>
										<li><a href="#" title="">在线学习</a></li>
									</ul>
								</div>
							</div><!--about-ch-sec end-->
						</div><!--abt-mk end-->
						<div class="cmt-bx">
							<ul class="cmt-pr">
								<li><span>18,386</span> Comments</li>
								<li>
									<span><i class="icon-sort_by"></i><a href="#" title="">Sort By</a></span>
								</li>
							</ul>
							<div class="clearfix"></div>
							<div class="clearfix"></div>
							<div class="vcp_inf pc">
								<div class="vc_hd">
									<img src="${pageContext.request.contextPath}/vimage/images/th1.png" alt="">
								</div>
								<form>
									<input type="text">
									<button type="submit">Comment</button>
								</form>
								<div class="clearfix"></div>
								<div class="rt-cmt">
									<a href="#" title="">
										<i class="icon-cancel"></i>
									</a>
									<div class="clearfix"></div>
								</div><!--vcp_inf end-->
							</div><!--cmt-bx end-->
							<ul class="cmn-lst">
								<li>
									<div class="vcp_inf">
										<div class="vc_hd">
											<img src="${pageContext.request.contextPath}/vimage/images/th2.png" alt="">
										</div>
										<div class="coments">
											<div class="pinned-comment">
												<span><i class="icon-pinned"></i>由ScereBro发表</span>
											</div>
											<h2>刘备 <small class="posted_dt"> . 18小时之前</small></h2>
											<p>老师讲解的很好,通俗易懂,一整个课时下来听的津津有味,希望能多发布一些类似的视频.</p>
											<ul class="cmn-i">
												<li>
													<a href="#" title="">
														<i class="icon-thumbs_up"></i>
													</a>
													<span>680</span>
												</li>
												<li>
													<a href="#" title="">
														<i class="icon-thumbs_down"></i>
													</a>
													<span>21</span>
												</li>
											</ul>
											<a href="#" title="">查看164回复</a>
										</div><!--coments end-->
									</div><!--vcp_inf end-->
								</li>
								<li>
									<div class="vcp_inf">
										<div class="vc_hd">
											<img src="${pageContext.request.contextPath}/vimage/images/th3.png" alt="">
										</div>
										<div class="coments">
											<h2>关羽 <small class="posted_dt"> . 2小时之前</small></h2>
											<p>这是我最喜欢的一个讲师 </p>
											<ul class="cmn-i">
												<li>
													<a href="#" title="">
														<i class="icon-thumbs_up"></i>
													</a>
													<span>61</span>
												</li>
												<li>
													<a href="#" title="">
														<i class="icon-thumbs_down"></i>
													</a>
													<span>3</span>
												</li>
											</ul>
											<a href="#" title="">查看26回复</a>
										</div><!--coments end-->
									</div><!--vcp_inf end-->
								</li>
								<li>
									<div class="vcp_inf">
										<div class="vc_hd">
											<img src="${pageContext.request.contextPath}/vimage/images/th4.png" alt="">
										</div>
										<div class="coments">
											<h2>张飞 <small class="posted_dt"> . 12小时之前</small></h2>
											<p>还有同类型的视频推荐吗 </p>
											<ul class="cmn-i">
												<li>
													<a href="#" title="">
														<i class="icon-thumbs_up"></i>
													</a>
													<span>22</span>
												</li>
												<li>
													<a href="#" title="">
														<i class="icon-thumbs_down"></i>
													</a>
													<span></span>
												</li>
											</ul>
											<a href="#" title="">查看9回复</a>
										</div><!--coments end-->
									</div><!--vcp_inf end-->
								</li>
								<li>
									<div class="vcp_inf">
										<div class="vc_hd">
											<img src="${pageContext.request.contextPath}/vimage/images/th5.png" alt="">
										</div>
										<div class="coments">
											<h2>吕布 <small class="posted_dt"> . 2周之前</small></h2>
											<p>听起来觉得还不错</p>
											<ul class="cmn-i">
												<li>
													<a href="#" title="">
														<i class="icon-thumbs_up"></i>
													</a>
													<span>37</span>
												</li>
												<li>
													<a href="#" title="">
														<i class="icon-thumbs_down"></i>
													</a>
													<span>3</span>
												</li>
											</ul>
											<a href="#" title="">查看12回复</a>
										</div><!--coments end-->
									</div><!--vcp_inf end-->
								</li>
								<li>
									<div class="vcp_inf">
										<div class="vc_hd">
											<img src="${pageContext.request.contextPath}/vimage/images/th1.png" alt="">
										</div>
										<div class="coments">
											<h2>张三 <small class="posted_dt"> . 1周之前</small></h2>
											<p>点赞,讲的非常好. </p>
											<ul class="cmn-i">
												<li>
													<a href="#" title="">
														<i class="icon-thumbs_up"></i>
													</a>
													<span>147</span>
												</li>
												<li>
													<a href="#" title="">
														<i class="icon-thumbs_down"></i>
													</a>
													<span>8</span>
												</li>
											</ul>
											<a href="#" title="">查看7回复</a>
										</div><!--coments end-->
									</div><!--vcp_inf end-->
								</li>
								<li>
									<div class="vcp_inf">
										<div class="vc_hd">
											<img src="${pageContext.request.contextPath}/vimage/images/th3.png" alt="">
										</div>
										<div class="coments">
											<h2>李四 <small class="posted_dt"> . 11小时之前</small></h2>
											<p>看完之后收获非常大,强烈推荐没看过的人都来学习一下</p>
											<ul class="cmn-i">
												<li>
													<a href="#" title="">
														<i class="icon-thumbs_up"></i>
													</a>
													<span>71</span>
												</li>
												<li>
													<a href="#" title="">
														<i class="icon-thumbs_down"></i>
													</a>
													<span>28</span>
												</li>
											</ul>
											<a href="#" title="">查看21回复</a>
										</div><!--coments end-->
									</div><!--vcp_inf end-->
								</li>
								<li>
									<div class="vcp_inf">
										<div class="vc_hd">
											<img src="${pageContext.request.contextPath}/vimage/images/th2.png" alt="">
										</div>
										<div class="coments">
											<h2>王五 <small class="posted_dt"> . 6小时之前</small></h2>
											<p>别问,问就是五星好评 </p>
											<ul class="cmn-i">
												<li>
													<a href="#" title="">
														<i class="icon-thumbs_up"></i>
													</a>
													<span>42</span>
												</li>
												<li>
													<a href="#" title="">
														<i class="icon-thumbs_down"></i>
													</a>
													<span></span>
												</li>
											</ul>
											<a href="#" title="">查看32回复</a>
										</div><!--coments end-->
									</div><!--vcp_inf end-->
								</li>
								<li>
									<div class="vcp_inf">
										<div class="vc_hd">
											<img src="${pageContext.request.contextPath}/vimage/images/th4.png" alt="">
										</div>
										<div class="coments">
											<h2>小明  <small class="posted_dt"> . 2小时之前</small></h2>
											<p>还看什么评论,快去看视频啊 </p>
											<ul class="cmn-i">
												<li>
													<a href="#" title="">
														<i class="icon-thumbs_up"></i>
													</a>
													<span>48</span>
												</li>
												<li>
													<a href="#" title="">
														<i class="icon-thumbs_down"></i>
													</a>
													<span>2</span>
												</li>
											</ul>
											<a href="#" title="">查看3回复</a>
										</div><!--coments end-->
									</div><!--vcp_inf end-->
								</li>
							</ul><!--comment list end-->
						</div>
					</div><!--mn-vid-sc end--->
				</div><!---col-lg-9 end-->
				<div class="col-lg-3">
					<div class="sidebar">
						<div class="vidz-prt">
							<h2 class="sm-vidz">相关视频</h2>
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
									<a href="#" title="">
										<img src="${pageContext.request.contextPath}/vimage/images/vide1.png" alt="">
										<span class="vid-time">10:21</span>
										<span class="watch_later">
											<i class="icon-watch_later_fill"></i>
										</span>
									</a>
								</div><!--vid_thumbnail end-->
								<div class="video_info">
									<h3><a href="#" title="">Java语言基本概述</a></h3>
									<h4><a href="#" title="">newfox media</a> <span class="verify_ic"><i class="icon-tick"></i></span></h4>
									<span>686K 播放 .<small class="posted_dt">1 week ago</small></span>
								</div>
							</div><!--videoo end-->
							<div class="videoo">
								<div class="vid_thumbainl">
									<a href="#" title="">
										<img src="${pageContext.request.contextPath}/vimage/images/vide2.png" alt="">
										<span class="vid-time">13:49</span>
										<span class="watch_later">
											<i class="icon-watch_later_fill"></i>
										</span>
									</a>
								</div><!--vid_thumbnail end-->
								<div class="video_info">
									<h3><a href="#" title="">Html网页设计基础</a></h3>
									<h4><a href="#" title="">newfox media</a> <span class="verify_ic"><i class="icon-tick"></i></span></h4>
									<span>686K 播放 .<small class="posted_dt">1 week ago</small></span>
								</div>
							</div><!--videoo end-->
							<div class="videoo">
								<div class="vid_thumbainl">
									<a href="#" title="">
										<img src="${pageContext.request.contextPath}/vimage/images/vide3.png" alt="">
										<span class="vid-time">2:54</span>
										<span class="watch_later">
											<i class="icon-watch_later_fill"></i>
										</span>
									</a>
								</div><!--vid_thumbnail end-->
								<div class="video_info">
									<h3><a href="#" title="">Java进阶教学</a></h3>
									<h4><a href="#" title="">newfox media</a> <span class="verify_ic"><i class="icon-tick"></i></span></h4>
									<span>686K 播放 .<small class="posted_dt">1 week ago</small></span>
								</div>
							</div><!--videoo end-->
							<div class="ad-rw">
								<img src="${pageContext.request.contextPath}/vimage/images/th10.jpg" alt="">
							</div>
							<div class="videoo">
								<div class="vid_thumbainl">
									<a href="#" title="">
										<img src="${pageContext.request.contextPath}/vimage/images/vide4.png" alt="">
										<span class="vid-time">5:25</span>
										<span class="watch_later">
											<i class="icon-watch_later_fill"></i>
										</span>
									</a>
								</div><!--vid_thumbnail end-->
								<div class="video_info">
									<h3><a href="#" title="">数据库操作和sql语句的编写</a></h3>
									<h4><a href="#" title="">newfox media</a> <span class="verify_ic"><i class="icon-tick"></i></span></h4>
									<span>686K 播放 .<small class="posted_dt">1 week ago</small></span>
								</div>
							</div><!--videoo end-->
							<div class="videoo">
								<div class="vid_thumbainl">
									<a href="#" title="">
										<img src="${pageContext.request.contextPath}/vimage/images/vide5.png" alt="">
										<span class="vid-time">4:01</span>
										<span class="watch_later">
											<i class="icon-watch_later_fill"></i>
										</span>
									</a>
								</div><!--vid_thumbnail end-->
								<div class="video_info">
									<h3><a href="#" title="">C语言基础</a></h3>
									<h4><a href="#" title="">newfox media</a> <span class="verify_ic"><i class="icon-tick"></i></span></h4>
									<span>686K 播放 .<small class="posted_dt">1 week ago</small></span>
								</div>
							</div><!--videoo end-->
							<div class="videoo">
								<div class="vid_thumbainl">
									<a href="#" title="">
										<img src="${pageContext.request.contextPath}/vimage/images/vide6.png" alt="">
										<span class="vid-time">6:20</span>
										<span class="watch_later">
											<i class="icon-watch_later_fill"></i>
										</span>
									</a>
								</div><!--vid_thumbnail end-->
								<div class="video_info">
									<h3><a href="#" title="">基于Java语言开发的斗地主小游戏</a></h3>
									<h4><a href="#" title="">newfox media</a> <span class="verify_ic"><i class="icon-tick"></i></span></h4>
									<span>686K 播放 .<small class="posted_dt">1 week ago</small></span>
								</div>
							</div><!--videoo end-->
							<div class="videoo">
								<div class="vid_thumbainl">
									<a href="#" title="">
										<img src="${pageContext.request.contextPath}/vimage/images/vide7.png" alt="">
										<span class="vid-time">8:16</span>
										<span class="watch_later">
											<i class="icon-watch_later_fill"></i>
										</span>
									</a>
								</div><!--vid_thumbnail end-->
								<div class="video_info">
									<h3><a href="#" title="">简单的前端页面设计</a></h3>
									<h4><a href="#" title="">newfox media</a> <span class="verify_ic"><i class="icon-tick"></i></span></h4>
									<span>686K 播放 .<small class="posted_dt">1 week ago</small></span>
								</div>
							</div><!--videoo end-->
							<div class="videoo">
								<div class="vid_thumbainl">
									<a href="#" title="">
										<img src="${pageContext.request.contextPath}/vimage/images/vide8.png" alt="">
										<span class="vid-time">29:32</span>
										<span class="watch_later">
											<i class="icon-watch_later_fill"></i>
										</span>
									</a>
								</div><!--vid_thumbnail end-->
								<div class="video_info">
									<h3><a href="#" title="">Web Socket的使用</a></h3>
									<h4><a href="#" title="">newfox media</a> <span class="verify_ic"><i class="icon-tick"></i></span></h4>
									<span>686K 播放 .<small class="posted_dt">1 week ago</small></span>
								</div>
							</div><!--videoo end-->
						</div><!--videoo-list-ab end-->
					</div><!--side-bar end-->
				</div>
			</div>
		</div>
	</section><!--mn-sec end-->

	<section class="more_items_sec text-center">
		<div class="container">
			<a href="#" title="">
				<svg width="19" height="24" viewBox="0 0 19 24" fill="none" xmlns="http://www.w3.org/2000/svg">
					<path d="M18.1618 24.0001H0.838235C0.374412 24.0001 0 23.6261 0 23.1628V5.86052C0 5.39727 0.374412 5.02332 0.838235 5.02332H18.1618C18.6256 5.02332 19 5.39727 19 5.86052V23.1628C19 23.6261 18.6256 24.0001 18.1618 24.0001ZM1.67647 22.3256H17.3235V6.69773H1.67647V22.3256Z" fill="#9494A0"/>
					<g opacity="0.25">
						<path opacity="0.25" d="M13.1324 4.18605C12.6685 4.18605 12.2941 3.81209 12.2941 3.34884V1.67442H6.70589V3.34884C6.70589 3.81209 6.33148 4.18605 5.86765 4.18605C5.40383 4.18605 5.02942 3.81209 5.02942 3.34884V0.83721C5.02942 0.373954 5.40383 0 5.86765 0H13.1324C13.5962 0 13.9706 0.373954 13.9706 0.83721V3.34884C13.9706 3.81209 13.5962 4.18605 13.1324 4.18605Z" fill="#9494A0"/>
					</g>
					<path d="M9.50001 19.3479C9.28487 19.3479 9.06972 19.267 8.90766 19.1024L5.92634 16.1275C5.59942 15.801 5.59942 15.2707 5.92634 14.9442C6.25325 14.6177 6.78413 14.6177 7.11104 14.9442L9.50001 17.3275L11.8862 14.9442C12.2131 14.6177 12.744 14.6177 13.0709 14.9442C13.3978 15.2707 13.3978 15.801 13.0709 16.1275L10.0924 19.1024C9.93031 19.267 9.71516 19.3479 9.50001 19.3479Z" fill="#9494A0"/>
					<path d="M9.49999 18.4186C9.03617 18.4186 8.66176 18.0447 8.66176 17.5814V10.3256C8.66176 9.86236 9.03617 9.4884 9.49999 9.4884C9.96382 9.4884 10.3382 9.86236 10.3382 10.3256V17.5814C10.3382 18.0447 9.96382 18.4186 9.49999 18.4186Z" fill="#9494A0"/>
					<g opacity="0.5">
						<path opacity="0.5" d="M15.6471 6.69764C15.1832 6.69764 14.8088 6.32369 14.8088 5.86043V4.18601H4.19118V5.86043C4.19118 6.32369 3.81677 6.69764 3.35294 6.69764C2.88912 6.69764 2.51471 6.32369 2.51471 5.86043V3.34881C2.51471 2.88555 2.88912 2.5116 3.35294 2.5116H15.6471C16.1109 2.5116 16.4853 2.88555 16.4853 3.34881V5.86043C16.4853 6.32369 16.1109 6.69764 15.6471 6.69764Z" fill="#9494A0"/>
					</g>
				</svg>
			</a>
		</div>
	</section><!--more_items_sec end-->

</div><!--wrapper end-->

</body>
</html>
