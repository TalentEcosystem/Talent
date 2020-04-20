<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/8
  Time: 11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>首页</title>
	<% String path=request.getContextPath();%>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/js/layui/css/layui.css" charset="UTF-8" />
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/homepage/css/style.css" charset="UTF-8" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" charset="UTF-8"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/homepage/js/my.js" charset="UTF-8"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/layui/layui.js" charset="UTF-8"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/homepage/css/cityselect.css" charset="UTF-8">
	<script type="text/javascript" src="${pageContext.request.contextPath}/homepage/js/cityselect.js" charset="UTF-8"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/homepage/css/index.css" charset="UTF-8">

	<style>
		.spa{
			float: left;
			width: 250px;
			height: 68px;
			line-height: 68px !important;
			margin:5px 5px 0 20px;
			/*line-height: 50px;*/
			/*text-align: center;*/
			/*background-color: pink;*/
			background-color: #6EC7FF;
			font-size: 16px;
			text-align: center;
		}
		.spa b,.spa i{
			font-weight: bold;
			font-style: normal;
		}



	</style>

	<%--个人鼠标悬停显示--%>
	<style type="text/css">
		/*样式初始化*/
		body, dl, dd, h1, h2, h3, h4, h5, h6, p, form,ul,ol{margin:0; padding:0;}
		ol,ul { list-style:none; }
		.nav span{
			float: right;
			display: inline-block;
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
			display: none;
			background: #F6F6F6
		}
			.li_yysy{
				background:#6EC7FF;
			}
		.ll{
			cursor: pointer;
		}
		.log ul{
			position: absolute;
			width:160px;
			display: none;
			background: #F6F6F6;
			text-align: center;
			margin: 32px 100px ;
			font-size: 18px;

		}
		.reg ul{
			 position: absolute;
			 width:160px;
			 display: none;
			 background: #F6F6F6;
			 text-align: center;
			 margin: 32px 150px ;
			 font-size: 18px;
		 }


	</style>
</head>
<body>
<input type="hidden" id="userno">
<input type="hidden" value="<%=path%>" id="path">
<div class="topDiv">
	<div class="mainWarp">
		<div class="topLeft">
			<span style="font-size:18px;padding-left: 50px">好消息：</span>
			<div id="container_small_tip">
				<div id="content_small_tip"></div>
			</div>
		</div>
		<div class="topRight ">
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
			</c:if>

			<c:if test="${empty uname}">
				<div class="log">
				<a href="#" class="lo" style="width: 200px" >登录</a>
				<ul>
					<a href="${pageContext.request.contextPath}/user/login"><li class="ll">用户登录</li></a>
					<a href="${pageContext.request.contextPath}/Enterprise/path/EnterpriseLogin"><li class="ll">企业登录</li></a>
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
			<%--webscoket 实时发消息给客户端--%>
			<script type="text/javascript">


				//这里面的userno是我自己拿的毫秒数//可修改成登录用户的账号或者ID 唯一就行
				var strTime = (new Date()).valueOf();
				document.getElementById('userno').innerHTML=strTime;
				var websocket = null;
				var userno=document.getElementById('userno').innerHTML;
				//判断当前浏览器是否支持WebSocket
				if ('WebSocket' in window) {
					websocket = new WebSocket("ws://localhost:8300/talent/websocket/"+userno);
				}
				else {
					alert('当前浏览器 Not support websocket')
				}

				//连接发生错误的回调方法
				websocket.onerror = function () {
					console.log("WebSocket连接发生错误");

					// setMessageInnerHTML("WebSocket连接发生错误");
				};

				//连接成功建立的回调方法
				websocket.onopen = function () {
					console.log("WebSocket连接成功");
					// setMessageInnerHTML("WebSocket连接成功");
				};

				//接收到消息的回调方法
				websocket.onmessage = function (event) {
					$("#content_small_tip")[0].innerHTML = event.data.toString();

					// setMessageInnerHTML(event.data);
				};

				//连接关闭的回调方法
				websocket.onclose = function () {
					console.log("WebSocket连接关闭");
					// setMessageInnerHTML("WebSocket连接关闭");
				};

				//监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
				window.onbeforeunload = function () {
					closeWebSocket();
				};

				//将消息显示在网页上
				function setMessageInnerHTML(sendMessage) {
					document.getElementById('message').innerHTML += sendMessage + '<br/>';
				}

				//关闭WebSocket连接
				function closeWebSocket() {
					websocket.close();
				}

				//发送消息
				function send() {
					var message = document.getElementById('text').value;//要发送的消息内容
					var now=getNowFormatDate();//获取当前时间
					document.getElementById('message').innerHTML += (now+"发送人："+userno+'<br/>'+"---"+message) + '<br/>';
					document.getElementById('message').style.color="red";
					var ToSendUserno="4567";//接收人编号：4567
					message=message+"|"+ToSendUserno//将要发送的信息和内容拼起来，以便于服务端知道消息要发给谁
					websocket.send(message);
				}
				//获取当前时间
				function getNowFormatDate() {
					var date = new Date();
					var seperator1 = "-";
					var seperator2 = ":";
					var month = date.getMonth() + 1;
					var strDate = date.getDate();
					if (month >= 1 && month <= 9) {
						month = "0" + month;
					}
					if (strDate >= 0 && strDate <= 9) {
						strDate = "0" + strDate;
					}
					var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
						+ " " + date.getHours() + seperator2 + date.getMinutes()
						+ seperator2 + date.getSeconds();
					return currentdate;
				}
			</script>
			<%--实现好消息的动画--%>
			<script type="text/javascript">
				(function ($) {
					$.fn.extend({
						roll: function (options) {
							var defaults = {
								speed: 1
							};
							var options = $.extend(defaults, options);
							var speed = (document.all) ? options.speed : Math.max(1, options.speed - 1);
							if ($(this) == null) return;
							var $container = $(this);
							var $content = $("#content_small_tip");
							var init_left = $container.width();
							$content.css({ left: parseInt(init_left) + "px" });
							var This = this;
							var time = setInterval(function () { This.move($container, $content, speed); }, 20); //setInterval会改变this指向，即使加了This=this，也要用匿名函数封装

							$container.bind("mouseover", function () {
								clearInterval(time);
							});
							$container.bind("mouseout", function () {
								time = setInterval(function () { This.move($container, $content, speed); }, 20);
							});
							// setTimeout(function () { $("#container").slideUp(); }, 30000);  //毫秒单位，显示30s后消失
							return this;
						},
						move: function ($container, $content, speed) {
							var container_width = $container.width();
							var content_width = $content.width();
							if (parseInt($content.css("left")) + content_width > 0) {
								$content.css({ left: parseInt($content.css("left")) - speed + "px" });
								$content.css({color:"#02A0E9"})//改变字体颜色
							}
							else {
								$content.css({ left: parseInt(container_width) + "px" });
								$content.css({color:"#02A0E9"})//改变字体颜色
							}
						}
					});
				})(jQuery);
				//插件的调用$("#yourId").roll({speed:#yourSpeed});
				$(document).ready(
					function () {
						$("#container_small_tip").roll({ speed: 2 });
					}
				);


			</script>
		</div>
	</div>
</div>
<div class="loginDiv">
	<div class="loginL">
		<img src="${pageContext.request.contextPath}/images/LOGO.png" />
		<img src="${pageContext.request.contextPath}/images/view_logo40.png" />
	</div>

	<form method="post" class="layui-form" action="${pageContext.request.contextPath}/HomePage/getJobNews">
		<div class="loginAddress">

			<div class="add1">
				<!-- 在输入框加入id -->
				<img src="${pageContext.request.contextPath}/images/dsfw.png" style="float: left;margin: 10px 0 0 10px">
				<input type="text" name="sypositionaddress" class="cityinput layui-input city"  id="citySelect" placeholder="输入城市" autocomplete="off" >

				<%--城市选择器--%>
				<script type="text/javascript">
					//接口定位方法
					function showLocation(data) {
						var test=new Vcity.CitySelector({input:'citySelect'});
						if($("#citySelect").val() == ""){
							//获取当前的城市
							$("#citySelect").val(data.content.address_detail.city)
						}else {
						}

					}
					//百度地图api接口
					$.getScript("http://api.map.baidu.com/location/ip?ak=TeBonvj42xc1nTC1Cqg0BV5wONn0uAhI&callback=showLocation");

				</script>
			</div>
		</div>
		<div class="loginC">
			<input name="sypositionname" type="text" id="gang"  autocomplete="off" placeholder="请填写关键词或选择职位..." />
			<button class="layui-btn " lay-submit style="margin:0 0 3px 39px;height: 44px;width: 115px;background-color:transparent" ></button>
		</div>
	</form>

	<div class="loginR">
		<img src="${pageContext.request.contextPath}/images/spirit_40.png" />
	</div>
</div>
<div class="menuDiv" >
	<a href="${pageContext.request.contextPath}/user/index" >首页</a>
	<a href="${pageContext.request.contextPath}/HomePage/searchJob" >找工作</a>
	<a href="${pageContext.request.contextPath}/HomePage/getTechnologyArea?curPage=1" >技术成长</a>
	<a href="jobnews.html">就业资讯</a>
	<a href="${pageContext.request.contextPath}/user/personal" id="personal">个人中心</a>
<%--	<a href="" >登录</a>--%>
<%--	<a href="helpJob.html">注册</a>--%>

	<%--鼠标经过标题栏显示颜色改变--%>
	<script>
		$('.menuDiv  a').hover(function(){
			$(this).addClass("onnav");

		},function(){
			$(this).removeClass("onnav")

		});

	</script>


</div>
<div class="BodyMain">
	<div class="mainTop">
		<%--		<div class="mainTopL">--%>
		<%--			<ul>--%>
		<%--				<div class="items">--%>
		<%--					<div class="itemOne">--%>
		<%--						<span class="itme1"><b></b>销售|市场|客服|贸易</span>--%>
		<%--					</div>--%>
		<%--				</div>--%>
		<%--				<div class="items">--%>
		<%--					<div class="itemOne">--%>
		<%--						<span class="itme2"><b></b>经营管理|人事|行政|财务</span>--%>
		<%--					</div>--%>
		<%--				</div>--%>
		<%--				<div class="items">--%>
		<%--					<div class="itemOne">--%>
		<%--						<span class="itme3"><b></b>生产|质管|技工|物流</span>--%>
		<%--					</div>--%>
		<%--				</div>--%>
		<%--				<div class="items">--%>
		<%--					<div class="itemOne">--%>
		<%--						<span class="itme4"><b></b>教育|法律|咨询|翻译</span>--%>
		<%--					</div>--%>
		<%--				</div>--%>
		<%--				<div class="items">--%>
		<%--					<div class="itemOne">--%>
		<%--						<span class="itme5"><b></b>零售|家政|餐饮|旅游</span>--%>
		<%--					</div>--%>
		<%--				</div>--%>
		<%--				<div class="items">--%>
		<%--					<div class="itemOne">--%>
		<%--						<span class="itme6"><b></b>广告|媒体|艺术|出版</span>--%>
		<%--					</div>--%>
		<%--				</div>--%>
		<%--				<div class="items">--%>
		<%--					<div class="itemOne">--%>
		<%--						<span class="itme7"><b></b>IT|互联网|通信</span>--%>
		<%--					</div>--%>
		<%--				</div>--%>
		<%--				<div class="items">--%>
		<%--					<div class="itemOne">--%>
		<%--						<span class="itme8"><b></b>金融|保险</span>--%>
		<%--					</div>--%>
		<%--				</div>--%>
		<%--				<div class="items">--%>
		<%--					<div class="itemOne">--%>
		<%--						<span class="itme9"><b></b>医疗|制药|环保|化工</span>--%>
		<%--					</div>--%>
		<%--				</div>--%>
		<%--				<div class="items">--%>
		<%--					<div class="itemOne">--%>
		<%--						<span class="itme10"><b></b>建筑|房地产|物业管理</span>--%>
		<%--					</div>--%>
		<%--				</div>--%>
		<%--				<div class="items">--%>
		<%--					<div class="itemOne">--%>
		<%--						<span class="itme11"><b></b>电子|能源|机械|纺织</span>--%>
		<%--					</div>--%>
		<%--				</div>--%>
		<%--				<div class="items">--%>
		<%--					<div class="itemOne">--%>
		<%--						<span class="itme12"><b></b>农业|实习生|科研</span>--%>
		<%--					</div>--%>
		<%--				</div>--%>
		<%--			</ul>--%>
		<%--		</div>--%>
		<div class="mainTopR">
			<%--中间轮播广告--%>
			<div class="ads">
				<!--            <div class="floatL" id="left"></div>-->
				<div class="adBox0">
					<div class="layui-carousel " lay-filter="carofilter" id="test10">
						<div carousel-item="">
							<a href="${pageContext.request.contextPath}/user/homePage" style="background:url(<%=path+"/images/1.jpg"%>);background-size: 800px;background-repeat: no-repeat;background-position: center;"></a>
							<a href="${pageContext.request.contextPath}/user/homePage" style="background:url(<%=path+"/images/2.jpg"%>);background-size: cover;background-repeat: no-repeat;background-position: center;"></a>
							<a href="${pageContext.request.contextPath}/user/homePage" style="background:url(<%=path+"/images/3.gif"%>);background-size: cover;background-repeat: no-repeat;background-position: center;"></a>
							<a href="${pageContext.request.contextPath}/user/homePage" style="background:url(<%=path+"/images/30.jpg"%>);background-size: cover;background-repeat: no-repeat;background-position: center;"></a>
						</div>
					</div>

<%--layUI的图片轮播--%>
<script>
						layui.use(['carousel', 'form'], function() {
							var carousel = layui.carousel
								, form = layui.form;
							//图片轮播
							carousel.render({
								elem: '#test10'
								,width: '800px'
								,height: '272px'
								,interval: 1500
							});
							carousel.on('change(carofilter)', function (obj) { //test1来源于对应HTML容器的 lay-filter="test1" 属性值
								// console.log(obj.index);     //当前条目的索引
								// console.log(obj.prevIndex); //上一个条目的索引
								// console.log(obj.item);      //当前条目的元素对象
							});

						});
					</script>

				</div>
			</div>



			<div class="login">


				<div class="spa" style="background-color: #66D9B0;">
					<img src="${pageContext.request.contextPath}/images/tggw.png">
					<span>
                        <b>提供岗位</b>
                        <i id="tggw"></i>个
                    </span>
				</div>
				<div class="spa" style="background-color: #A2AAFF;">
					<img src="${pageContext.request.contextPath}/images/zcdw.png">
					<span>
                        <b>注册单位</b>
                        <i id="zcdw"></i>家
                    </span>
				</div>
				<div class="spa">
					<img src="${pageContext.request.contextPath}/images/qzz.png">
					<span>
                        <b>求职人数</b>
                        <i id="qzz"></i>位
                    </span>
				</div>

			</div>
			<div class="clear"></div>
<%--专区模块--%>
			<div class="tabs">
				<ul id="tab">
					<li class="current" style="display: block">课程学习区</li>
					<li >高校专区</li>
					<li  >名企专区</li>
					<li  style="float: right;width: 242px;">成果展示</li>
				</ul>
				<div id="content">
					<%--左右按钮图标的隐藏显示--%>
					<script>
						var conrent=document.getElementById("content");
						var left=document.getElementsByClassName("left").item(0);
						var right=document.getElementsByClassName("right");
						var left1=document.getElementsByClassName("left1").item(0);
						var right1=document.getElementsByClassName("right1");
						var left2=document.getElementsByClassName("left2").item(0);
						var right2=document.getElementsByClassName("right2");
						// 鼠标移进
						conrent.onmousemove=function () {
							left.style.display="block";
							right.style.display="block";
							left1.style.display="block";
							right1.style.display="block";
							left2.style.display="block";
							right2.style.display="block";

						};
						conrent.onmouseout=function () {
							left.style.display="none";
							right.style.display="none";
							left1.style.display="none";
							right1.style.display="none";
							left2.style.display="none";
							right2.style.display="none";
						}


					</script>

					<ul  >

						<div class="product-cont">
							<div class="scene2">
								<div class="out" >
									<div class="in clearFix" id="study" style="left: -1100px;">
										<%--课程轮播--%>
									</div>
									<div class="shodow"></div>
								</div>
							</div>
							<div class="left" style="display: none"></div>
							<div class="right" style="display: none"></div>
							<div class="lunbo"></div>
						</div>
					<%--得到课程轮播的图片信息--%>
						<script>
							var path=$("#path").val();
							$.ajax({
								type: "post",
								url: path+"/HomePage/getStudyNews",
								// dataType: "json",
								async:true,
								success: function (data) {
									var study=JSON.parse(data);
									console.log(study);
									for (var i = 0; i <study.length ; i++) {
										$("#study").append(
											"<a href='"+path+"/HomePage/getCourseDetails?proid="+study[i].productid+"' class='pic' style='background-image: url("+path+"/"+study[i].propic+" )'>"+
											"<div class='childss test' >"+
											"<div style='width: 150px;height: 100px'>"+
											study[i].proname+"<br>"+
											"播放量"+study[i].procount+"<br>"+
											"讲师："+study[i].teachername+
											"</div>"+
											"</div>"+
											"</a>"
										);
										$(".pic").mouseenter(function () {
											$(".test").stop().animate({ 'height': '80px', opacity: '0.5' },"slow");
										});
										$(".pic").mouseleave(function () {
											$(".test").stop().animate({ 'height': '0px', opacity: '0' },"slow");
										})

									}

								},
								error: function (data) {
									console.log(data);
								}

							});
						</script>
					<%--js实现图片的轮播--%>
						<script>
							//轮播
							var out = document.getElementsByClassName("out").item(0);
							var left = document.getElementsByClassName("left").item(0);
							var right = document.getElementsByClassName("right").item(0);
							var myin = document.getElementsByClassName("in").item(0);
							var zt = true;
							var timer = null;
							// var lilist = document.getElementsByTagName("li");
							var index1 = 0;
							var timer1 = null;
							right.onclick = function () {
								if (zt == true) {
									move(-800);
								}
							};
							left.onclick = function () {
								if (zt == true) {
									move(800);
								}
							};
							function move(dis) {
								zt = false;
								var newweizhi = parseInt(myin.style.left) + dis;

								var time = 1000;
								var interval = 10;
								var every = dis / (time / interval);
								function meici() {
									if (every < 0 && parseInt(myin.style.left) > newweizhi || every > 0 && parseInt(myin.style.left) < newweizhi) {
										myin.style.left = parseInt(myin.style.left) + every + 'px';
										setTimeout(meici, 10)
									} else {
										myin.style.left = newweizhi + 'px';
										clearInterval(timer);
										zt = true;
										if (newweizhi == -3500) {
											myin.style.left = -1100 + "px";
										}
										if (newweizhi == -300) {
											myin.style.left = -1100 + "px";
										}

									}
								}
								meici();
							}

							timer1 = setInterval(right.onclick, 6000);
							out.onmouseover = function () {
								clearInterval(timer1);
							};

							left.onmouseover = function () {
								clearInterval(timer1);
							};
							right.onmouseover = function () {
								clearInterval(timer1);
							};
							out.onmouseout = function () {
								timer1 = setInterval(right.onclick, 6000);
							}

							left.onmouseout = function () {
								timer1 = setInterval(right.onclick, 6000);
							};
							right.onmouseout = function () {
								timer1 = setInterval(right.onclick, 6000);
							};


						</script>
					</ul>

					<ul style="display: none">
						<div class="product-cont1">
							<div class="scene2">
								<div class="out1">
									<div class="in1 clearFix1" id="school" style="left: -1100px;">
										<%--高校轮播--%>
									</div>
									<div class="shodow1"></div>
								</div>
							</div>
							<div class="left1"></div>
							<div class="right1"></div>
							<div class="lunbo1"></div>
						</div>
						<%--得到高校轮播的图片信息--%>
						<script>
							var path=$("#path").val();
							$.ajax({
								type: "post",
								url: path+"/HomePage/getSchoolNews",
								// dataType: "json",
								async:true,
								success: function (data) {
									var d=JSON.parse(data);
									var j=1;
									for (var i = 0; i <d.length ; i++) {
										$("#school").append(
											"<a href='"+path+"/school/schoolProfile?sid="+(i+1)+"' class='pic0' style='background-image: url("+path+"/"+d[i].schoolpic+")'>"+
											"<div class='childss1 test0' >"+
											"<h>"+d[i].schoolname+"</h>"+
											"<p>就业总数</p>"+
											"<i>"+d[i].num+"</i>"+
											"</div>"+
											"</a>"

										);
										$(".pic0").mouseenter(function () {
											$(".test0").stop().animate({ 'height': '67px', opacity: '0.5' },"slow1");
										});
										$(".pic0").mouseleave(function () {
											$(".test0").stop().animate({ 'height': '0px', opacity: '0' },"slow1");
										})

									}

								},
								error: function (data) {
									console.log(data);
								}

							});


						</script>
						<%--js实现div图片的轮播--%>
						<script>
							//轮播
							var out1 = document.getElementsByClassName("out1").item(0);
							var left1 = document.getElementsByClassName("left1").item(0);
							var right1 = document.getElementsByClassName("right1").item(0);
							var myin1 = document.getElementsByClassName("in1").item(0);
							var zt1 = true;
							var timer1 = null;
							// var lilist = document.getElementsByTagName("li");
							var index11 = 0;
							var timer11 = null;
							right1.onclick = function () {
								if (zt1 == true) {
									move1(-800);
								}
							};
							left1.onclick = function () {
								if (zt1 == true) {
									move1(800);
								}
							};
							function move1(dis) {
								zt1 = false;
								var newweizhi1 = parseInt(myin1.style.left) + dis;

								var time1 = 1000;
								var interval1 = 10;
								var every1 = dis / (time1 / interval1);
								function meici1() {
									if (every1 < 0 && parseInt(myin1.style.left) > newweizhi1 || every1 > 0 && parseInt(myin1.style.left) < newweizhi1) {
										myin1.style.left = parseInt(myin1.style.left) + every1 + 'px';
										setTimeout(meici1, 10)
									} else {
										myin1.style.left = newweizhi1 + 'px';
										clearInterval(timer1);
										zt1 = true;
										if (newweizhi1 == -3500) {

											myin1.style.left = -1100 + "px";
										}
										if (newweizhi1 == -300) {

											myin1.style.left = -1100 + "px";
										}

									}
								}
								meici1();
							}

							timer11 = setInterval(right1.onclick, 3000);
							out1.onmouseover = function () {
								clearInterval(timer11);
							};
							left1.onmouseover = function () {
								clearInterval(timer11);
							};
							right1.onmouseover = function () {
								clearInterval(timer11);
							};
							out1.onmouseout = function () {
								timer11 = setInterval(right1.onclick, 3000);
							}
							left1.onmouseout = function () {
								timer1 = setInterval(right1.onclick, 3000);
							};
							right1.onmouseout = function () {
								timer11 = setInterval(right1.onclick, 3000);
							};

							// 鼠标移进一出
							$(document).ready(function () {
								var animated = false;
								$(".pic0").mouseenter(function () {
									$(".test0").stop().animate({ 'height': '67px', opacity: '0.5' },"slow1");
								});
								$(".pic0").mouseleave(function () {
									$(".test0").stop().animate({ 'height': '0px', opacity: '0' },"slow1");
								})
								$(".pic11").mouseenter(function () {
									$(".test11").stop().animate({ 'height': '67px', opacity: '0.5' },"slow1");
								});
								$(".pic11").mouseleave(function () {
									$(".test11").stop().animate({ 'height': '0px', opacity: '0' },"slow1");
								})
								$(".pic21").mouseenter(function () {
									$(".test21").stop().animate({ 'height': '67px', opacity: '0.5' },"slow");
								});
								$(".pic21").mouseleave(function () {
									$(".test21").stop().animate({ 'height': '0px', opacity: '0' },"slow");
								})
								$(".pic41").mouseenter(function () {
									// $('.test4').animate({ height: '67px', width:'300px',opacity: '0.5' }, "slow");
									// $('.test4').animate({'height':'67px','marginTop':'303px',opacity: '0.5' }, "slow");
									// $('.test4').animate({ 'height': '67px', opacity: '0.5' }, "slow");
									//$('.test4').animate({'width':'300px','right':'300px',opacity: '0.5' }, "slow");
									$(".test41").stop().animate({ 'height': '67px', opacity: '0.5' },"slow1");
								});
								$(".pic41").mouseleave(function () {
									// $('.test4').animate({ 'height': '0px', opacity: '0' }, "slow");
									$(".test41").stop().animate({ 'height': '0px', opacity: '0' },"slow1");
								})
								$(".pic31").mouseenter(function () {
									// if (!animated) {
									//         animated=true;
									//         $(".test3").animate({ 'height': '67px', opacity: '0.5' }, "slow", function () {
									//             animated=false;
									//         });
									//     }
									$(".test31").stop().animate({ 'height': '67px', opacity: '0.5' },"slow1");
									// $('.test3').animate({ 'height': '67px', opacity: '0.5' }, "slow");
								});
								$(".pic31").mouseleave(function () {
									$(".test31").stop().animate({ 'height': '0px', opacity: '0' },"slow1");
									//$('.test3').animate({ 'height': '0px', opacity: '0' }, "slow");
								})

							});
						</script>
					</ul>

					<ul style="display: none">
						<div class="product-cont2">
							<div class="scene2">
								<div class="out2">
									<div class="in2 clearFix2" id="company" style="left: -1100px;">
										<%--企业信息轮播--%>
									</div>
									<div class="shodow2"></div>
								</div>
							</div>
							<div class="left2"></div>
							<div class="right2"></div>
							<div class="lunbo2"></div>
						</div>
						<%--得到企业信息--%>
						<script>
							var path=$("#path").val();
							$.ajax({
								type: "post",
								url: path+"/HomePage/getCompanyNews",
								// dataType: "json",
								async:true,
								success: function (data) {
									var d=JSON.parse(data);
									for (var i = 0; i <d.length ; i++) {
										$("#company").append(
											"<a href='"+path+"/HomePage/getCompanyProfile?cid="+d[i].cid+"'  class='pic02' style='background-image: url("+path+"/"+d[i].companypic+")'>"+
											"<div class='childss2 test02' >"+
											"<div style='width: 150px;height: 100px'>"+
											d[i].companyname+  "<br>"+
											"招收总人数"+d[i].num+" <br>"+
											"</div>"+
											"</div>"+
											// "<input type='hidden'  value='"++"'> "+
											"</a>"
										);
										$(".pic02").mouseenter(function () {
											$(".test02").stop().animate({ 'height': '67px', opacity: '0.5' },"slow1");
										});
										$(".pic02").mouseleave(function () {
											$(".test02").stop().animate({ 'height': '0px', opacity: '0' },"slow1");
										})
									}
								},
								error: function (data) {
									console.log(data);
								}

							});

						</script>
						<%--js实现企业图片的轮播--%>
						<script>

							//轮播
							var out2 = document.getElementsByClassName("out2").item(0);
							var left2 = document.getElementsByClassName("left2").item(0);
							var right2 = document.getElementsByClassName("right2").item(0);
							var myin2 = document.getElementsByClassName("in2").item(0);
							var zt2 = true;
							var timer2 = null;
							// var lilist = document.getElementsByTagName("li");
							var index12 = 0;
							var timer12 = null;
							right2.onclick = function () {
								if (zt2 == true) {
									move2(-800);
								}
							};
							left2.onclick = function () {
								if (zt2 == true) {
									move2(800);
								}
							};
							function move2(dis) {
								zt2 = false;
								var newweizhi2 = parseInt(myin2.style.left) + dis;
								var time2 = 1000;
								var interval2 = 10;
								var every2 = dis / (time2 / interval2);
								function meici2() {
									if (every2 < 0 && parseInt(myin2.style.left) > newweizhi2 || every2 > 0 && parseInt(myin2.style.left) < newweizhi2) {
										myin2.style.left = parseInt(myin2.style.left) + every2 + 'px';
										setTimeout(meici2, 10)
									} else {
										myin2.style.left = newweizhi2 + 'px';
										clearInterval(timer2);
										zt2 = true;
										if (newweizhi2 == -3500) {

											myin2.style.left = -1100 + "px";
										}
										if (newweizhi2 == -300) {

											myin2.style.left = -1100 + "px";
										}

									}
								}
								meici2();
							}

							timer12 = setInterval(right2.onclick, 3000);
							out2.onmouseover = function () {
								clearInterval(timer12);
							};
							left2.onmouseover = function () {
								clearInterval(timer12);
							};
							right2.onmouseover = function () {
								clearInterval(timer12);
							};
							out2.onmouseout = function () {
								timer12 = setInterval(right2.onclick, 3000);
							}
							left2.onmouseout = function () {
								timer12 = setInterval(right2.onclick, 3000);
							};
							right2.onmouseout = function () {
								timer12 = setInterval(right2.onclick, 3000);
							};



							// 鼠标移进一出
							$(document).ready(function () {
								var animated2= false;
								$(".pic02").mouseenter(function () {
									$(".test02").stop().animate({ 'height': '67px', opacity: '0.5' },"slow");
								});
								$(".pic02").mouseleave(function () {
									$(".test02").stop().animate({ 'height': '0px', opacity: '0' },"slow");
								})
								$(".pic12").mouseenter(function () {
									$(".test12").stop().animate({ 'height': '67px', opacity: '0.5' },"slow");
								});
								$(".pic12").mouseleave(function () {
									$(".test12").stop().animate({ 'height': '0px', opacity: '0' },"slow");
								})
								$(".pic22").mouseenter(function () {
									$(".test22").stop().animate({ 'height': '67px', opacity: '0.5' },"slow");
								});
								$(".pic22").mouseleave(function () {
									$(".test22").stop().animate({ 'height': '0px', opacity: '0' },"slow");
								})
								$(".pic42").mouseenter(function () {
									// $('.test4').animate({ height: '67px', width:'300px',opacity: '0.5' }, "slow");
									// $('.test4').animate({'height':'67px','marginTop':'303px',opacity: '0.5' }, "slow");
									// $('.test4').animate({ 'height': '67px', opacity: '0.5' }, "slow");
									//$('.test4').animate({'width':'300px','right':'300px',opacity: '0.5' }, "slow");
									$(".test42").stop().animate({ 'height': '67px', opacity: '0.5' },"slow2");
								});
								$(".pic42").mouseleave(function () {
									// $('.test4').animate({ 'height': '0px', opacity: '0' }, "slow");
									$(".test42").stop().animate({ 'height': '0px', opacity: '0' },"slow2");
								})
								$(".pic32").mouseenter(function () {
									// if (!animated) {
									//         animated=true;
									//         $(".test3").animate({ 'height': '67px', opacity: '0.5' }, "slow", function () {
									//             animated=false;
									//         });
									//     }
									$(".test32").stop().animate({ 'height': '67px', opacity: '0.5' },"slow2");
									// $('.test3').animate({ 'height': '67px', opacity: '0.5' }, "slow");
								});
								$(".pic32").mouseleave(function () {
									$(".test32").stop().animate({ 'height': '0px', opacity: '0' },"slow2");
									//$('.test3').animate({ 'height': '0px', opacity: '0' }, "slow");
								})

							});
						</script>
					</ul>

					<ul style="display:none;">
					<%--得到成果展示专区的信息--%>
						<script>
							var path=$("#path").val();
							$.ajax({
								type: "post",
								url: path+"/HomePage/getCount",
								// dataType: "json",
								async:true,
								success: function (data) {
									var map=JSON.parse(data);
									console.log(map);
									$("#employ").text( map.employ);
									$("#job").text(map.post);
									$("#post").text(map.job);
									$("#talent").text(map.talent);


									$("#zcdw").text( map.company);
									$("#qzz").text(map.job);
									$("#tggw").text(map.post);




								},
								error: function (data) {
									console.log(data);
								}

							});
						</script>
						<div class="product-cont3">
							<div class="scene2">
								<div class="out3">
									<div class="in3 clearFix3"  style="left: -1100px;">
										<div class="pic03">
											<div class="childss3 test03">
												<p>就业总数</p>
												<i id="employ"></i>
											</div>
										</div>
										<div class="pic13">
											<div class="childss3 test13">
												<p>求职总数</p>
												<i id="post"></i>
											</div>
										</div>
										<div class="pic23">
											<div class="childss3 test23">
												<p>岗位 总数</p>
												<i id="job"></i>
											</div>
										</div>
										<!-- 第二组 -->
										<div class="pic33">
											<div class="childss3 test33">
												<p>人才总数</p>
												<i id="talent"></i>
											</div>
										</div>

									</div>
									<div class="shodow3"></div>
								</div>
							</div>

							<div class="lunbo3"></div>
						</div>
					<%--鼠标移进一出显示详细信息--%>
						<script>
							// 鼠标移进一出
							$(document).ready(function () {
								var animated = false;
								$(".pic03").mouseenter(function () {
									$(".test03").stop().animate({ 'height': '67px', opacity: '0.8' },"slow");
								});
								$(".pic03").mouseleave(function () {
									$(".test03").stop().animate({ 'height': '0px', opacity: '0' },"slow");
								})
								$(".pic13").mouseenter(function () {
									$(".test13").stop().animate({ 'height': '67px', opacity: '0.8' },"slow");
								});
								$(".pic13").mouseleave(function () {
									$(".test13").stop().animate({ 'height': '0px', opacity: '0' },"slow");
								})
								$(".pic23").mouseenter(function () {
									$(".test23").stop().animate({ 'height': '67px', opacity: '0.8' },"slow");
								});
								$(".pic23").mouseleave(function () {
									$(".test23").stop().animate({ 'height': '0px', opacity: '0' },"slow");
								})
								$(".pic33").mouseenter(function () {

									$(".test33").stop().animate({ 'height': '67px', opacity: '0.8' },"slow");
								});
								$(".pic33").mouseleave(function () {
									$(".test33").stop().animate({ 'height': '0px', opacity: '0' },"slow");
								})

							});
						</script>
					</ul>

				</div>
			</div>
		</div>
	</div>
	<div class="clear"></div>
	<div class="mainCon1">
		<div class="imgbox1">
			<a href="http://www.dippsi.com/" class="box1"><img src="${pageContext.request.contextPath}/images/1.gif" height="71" width="546" /></a>
			<a href="http://www.tcjy-ic.com/" class="box1"><img src="${pageContext.request.contextPath}/images/2.gif" height="71" width="546" /></a>
		</div>
		<div class="clear"></div>
		<div class="imgbox1">
			<a href="http://www.geeetech.cn/" class="box2"><img src="${pageContext.request.contextPath}/images/4.gif" height="71" width="362" /></a>
			<a href="https://chartermate.b2b.hc360.com/" class="box2"><img src="${pageContext.request.contextPath}/images/5.gif" height="71" width="362" /></a>
			<a href="http://www.widehuge.com/" class="box2"><img src="${pageContext.request.contextPath}/images/6.gif" height="71" width="362" /></a>
		</div>
		<div class="clear"></div>
		<div class="imgbox1">
			<a href="http://www.minjiangrc.com/" class="box2"><img src="${pageContext.request.contextPath}/images/7.gif" height="71" width="362" /></a>
			<a href="http://www.likuso.com/city21/2240076.html" class="box3"><img src="${pageContext.request.contextPath}/images/8.gif" height="71" width="178" /></a>
			<a href="http://qy.58.com/21817027955974/" class="box3"><img src="${pageContext.request.contextPath}/images/9.gif" height="71" width="178" /></a>
			<a href="https://szdingrun.d17.cc/" class="box3"><img src="${pageContext.request.contextPath}/images/10.gif" height="71" width="178" /></a>
			<a href="http://www.3d-link.com.cn/" class="box3"><img src="${pageContext.request.contextPath}/images/11.gif" height="71" width="178" /></a>
		</div>
		<div class="clear"></div>
		<div class="imgbox1">
			<a href="http://www.lidaluyun.com/" class="box3"><img src="${pageContext.request.contextPath}/images/12.gif" height="71" width="178" /></a>
			<a href="http://www.likang-inc.com/" class="box3"><img src="${pageContext.request.contextPath}/images/13.gif" height="71" width="178" /></a>
			<a href="http://www.wmfaucets.com/" class="box3"><img src="${pageContext.request.contextPath}/images/14.gif" height="71" width="178" /></a>
			<a href="http://www.app17.com/c22573/" class="box3"><img src="${pageContext.request.contextPath}/images/15.gif" height="71" width="178" /></a>
			<a href="http://www.jinguanauto.com/index.aspx" class="box3"><img src="${pageContext.request.contextPath}/images/16.gif" height="71" width="178" /></a>
			<a href="https://www.job001.cn/cwechat/recruitment?id=1299149" class="box3"><img src="${pageContext.request.contextPath}/images/17.gif" height="71" width="178" /></a>
		</div>
		<div class="clear"></div>
	</div>



	<div class="mainCon2">
		<div class="commontitdiv">
			<div class="title">高薪职位</div>
			<span>高薪就这么任性！</span>
		</div>
		<div class="clear"></div>
		<div class="highMoney">
			<div class="divBox">
				<a href=""><img src="${pageContext.request.contextPath}/images/18.gif" width="84"/></a>
				<p class="tit"><a href="">橱柜设计</a></p>
				<p class="sub"><a href="">深圳维意定制家居用品有限公司</a></p>
				<p class="num"><span>8K-10K</span></p>
			</div>
			<div class="lineBox"></div>
			<div class="divBox">
				<a href=""><img src="${pageContext.request.contextPath}/images/18.gif" width="84"/></a>
				<p class="tit"><a href="">橱柜设计</a></p>
				<p class="sub"><a href="">深圳维意定制家居用品有限公司</a></p>
				<p class="num"><span>8K-10K</span></p>
			</div>
			<div class="lineBox"></div>
			<div class="divBox">
				<a href=""><img src="${pageContext.request.contextPath}/images/18.gif" width="84"/></a>
				<p class="tit"><a href="">橱柜设计</a></p>
				<p class="sub"><a href="">深圳维意定制家居用品有限公司</a></p>
				<p class="num"><span>8K-10K</span></p>
			</div>
			<div class="lineBox"></div>
			<div class="divBox">
				<a href=""><img src="${pageContext.request.contextPath}/images/18.gif" width="84"/></a>
				<p class="tit"><a href="">橱柜设计</a></p>
				<p class="sub"><a href="">深圳维意定制家居用品有限公司</a></p>
				<p class="num"><span>8K-10K</span></p>
			</div>
			<div class="lineBox"></div>
			<div class="divBox">
				<a href=""><img src="${pageContext.request.contextPath}/images/18.gif" width="84"/></a>
				<p class="tit"><a href="">橱柜设计</a></p>
				<p class="sub"><a href="">深圳维意定制家居用品有限公司</a></p>
				<p class="num"><span>8K-10K</span></p>
			</div>
			<div class="lineBox"></div>
			<div class="divBox">
				<a href=""><img src="${pageContext.request.contextPath}/images/18.gif" width="84"/></a>
				<p class="tit"><a href="">橱柜设计</a></p>
				<p class="sub"><a href="">深圳维意定制家居用品有限公司</a></p>
				<p class="num"><span>8K-10K</span></p>
			</div>
			<div class="lineBox"></div>
			<div class="divBox">
				<a href=""><img src="${pageContext.request.contextPath}/images/18.gif" width="84"/></a>
				<p class="tit"><a href="">橱柜设计</a></p>
				<p class="sub"><a href="">深圳维意定制家居用品有限公司</a></p>
				<p class="num"><span>8K-10K</span></p>
			</div>
			<div class="lineBox"></div>
			<div class="divBox">
				<a href=""><img src="${pageContext.request.contextPath}/images/18.gif" width="84"/></a>
				<p class="tit"><a href="">橱柜设计</a></p>
				<p class="sub"><a href="">深圳维意定制家居用品有限公司</a></p>
				<p class="num"><span>8K-10K</span></p>
			</div>
			<div class="lineBox"></div>
			<div class="divBox">
				<a href=""><img src="${pageContext.request.contextPath}/images/18.gif" width="84"/></a>
				<p class="tit"><a href="">橱柜设计</a></p>
				<p class="sub"><a href="">深圳维意定制家居用品有限公司</a></p>
				<p class="num"><span>8K-10K</span></p>
			</div>
			<div class="lineBox"></div>
			<div class="divBox">
				<a href=""><img src="${pageContext.request.contextPath}/images/18.gif" width="84"/></a>
				<p class="tit"><a href="">橱柜设计</a></p>
				<p class="sub"><a href="">深圳维意定制家居用品有限公司</a></p>
				<p class="num"><span>8K-10K</span></p>
			</div>
		</div>
	</div>
	<div class="mainCon3">
		<div class="commontitdiv">
			<div class="title">推荐职位</div>
			<span class="line"></span>
		</div>
		<div class="clear"></div>
		<div class="tuijian">
			<ul>
				<li>
					<a href="javascript:void()">惠州利恒塑胶电子有限公司</a>
					<span><a href="javascript:void()">电子工程师</a><a href="javascript:void()">结构工程师</a></span>
				</li>
				<li>
					<a href="javascript:void()">广州为想互联网科技有限公司</a>
					<span><a href="javascript:void()">培训师</a></span>
				</li>
				<li>
					<a href="javascript:void()">佛山市顺德区奥达信电器有限公司</a>
					<span><a href="javascript:void()">单证员</a><a href="javascript:void()">仓管员</a><a href="javascript:void()">质检员</a></span>
				</li>
				<li>
					<a href="javascript:void()">广州艾浩尔防霉抗菌科技有限公司</a>
					<span><a href="javascript:void()">前台文员</a><a href="javascript:void()">跟单办公室文员</a></span>
				</li>
				<li>
					<a href="javascript:void()">广州阳光社会工作事务中心</a>
					<span><a href="javascript:void()">实习生</a><a href="javascript:void()">服务领域部长</a><a href="javascript:void()">一线社工</a></span>
				</li>
				<li>
					<a href="javascript:void()">惠州利恒塑胶电子有限公司</a>
					<span><a href="javascript:void()">电子工程师</a><a href="javascript:void()">结构工程师</a></span>
				</li>
				<li>
					<a href="javascript:void()">广州为想互联网科技有限公司</a>
					<span><a href="javascript:void()">培训师</a></span>
				</li>
				<li>
					<a href="javascript:void()">佛山市顺德区奥达信电器有限公司</a>
					<span><a href="javascript:void()">单证员</a><a href="javascript:void()">仓管员</a><a href="javascript:void()">质检员</a></span>
				</li>
				<li>
					<a href="javascript:void()">广州艾浩尔防霉抗菌科技有限公司</a>
					<span><a href="javascript:void()">前台文员</a><a href="javascript:void()">跟单办公室文员</a></span>
				</li>
				<li>
					<a href="javascript:void()">广州阳光社会工作事务中心</a>
					<span><a href="javascript:void()">实习生</a><a href="javascript:void()">服务领域部长</a><a href="javascript:void()">一线社工</a></span>
				</li>
				<li>
					<a href="javascript:void()">惠州利恒塑胶电子有限公司</a>
					<span><a href="javascript:void()">电子工程师</a><a href="javascript:void()">结构工程师</a></span>
				</li>
				<li>
					<a href="javascript:void()">广州为想互联网科技有限公司</a>
					<span><a href="javascript:void()">培训师</a></span>
				</li>
				<li>
					<a href="javascript:void()">佛山市顺德区奥达信电器有限公司</a>
					<span><a href="javascript:void()">单证员</a><a href="javascript:void()">仓管员</a><a href="javascript:void()">质检员</a></span>
				</li>
				<li>
					<a href="javascript:void()">广州艾浩尔防霉抗菌科技有限公司</a>
					<span><a href="javascript:void()">前台文员</a><a href="javascript:void()">跟单办公室文员</a></span>
				</li>
				<li>
					<a href="javascript:void()">广州阳光社会工作事务中心</a>
					<span><a href="javascript:void()">实习生</a><a href="javascript:void()">服务领域部长</a><a href="javascript:void()">一线社工</a></span>
				</li>
			</ul>
			<div class="linediv"></div>
			<ul>
				<li>
					<a href="javascript:void()">惠州利恒塑胶电子有限公司</a>
					<span><a href="javascript:void()">电子工程师</a><a href="javascript:void()">结构工程师</a></span>
				</li>
				<li>
					<a href="javascript:void()">广州为想互联网科技有限公司</a>
					<span><a href="javascript:void()">培训师</a></span>
				</li>
				<li>
					<a href="javascript:void()">佛山市顺德区奥达信电器有限公司</a>
					<span><a href="javascript:void()">单证员</a><a href="javascript:void()">仓管员</a><a href="javascript:void()">质检员</a></span>
				</li>
				<li>
					<a href="javascript:void()">广州艾浩尔防霉抗菌科技有限公司</a>
					<span><a href="javascript:void()">前台文员</a><a href="javascript:void()">跟单办公室文员</a></span>
				</li>
				<li>
					<a href="javascript:void()">广州阳光社会工作事务中心</a>
					<span><a href="javascript:void()">实习生</a><a href="javascript:void()">服务领域部长</a><a href="javascript:void()">一线社工</a></span>
				</li>
				<li>
					<a href="javascript:void()">惠州利恒塑胶电子有限公司</a>
					<span><a href="javascript:void()">电子工程师</a><a href="javascript:void()">结构工程师</a></span>
				</li>
				<li>
					<a href="javascript:void()">广州为想互联网科技有限公司</a>
					<span><a href="javascript:void()">培训师</a></span>
				</li>
				<li>
					<a href="javascript:void()">佛山市顺德区奥达信电器有限公司</a>
					<span><a href="javascript:void()">单证员</a><a href="javascript:void()">仓管员</a><a href="javascript:void()">质检员</a></span>
				</li>
				<li>
					<a href="javascript:void()">广州艾浩尔防霉抗菌科技有限公司</a>
					<span><a href="javascript:void()">前台文员</a><a href="javascript:void()">跟单办公室文员</a></span>
				</li>
				<li>
					<a href="javascript:void()">广州阳光社会工作事务中心</a>
					<span><a href="javascript:void()">实习生</a><a href="javascript:void()">服务领域部长</a><a href="javascript:void()">一线社工</a></span>
				</li>
				<li>
					<a href="javascript:void()">惠州利恒塑胶电子有限公司</a>
					<span><a href="javascript:void()">电子工程师</a><a href="javascript:void()">结构工程师</a></span>
				</li>
				<li>
					<a href="javascript:void()">广州为想互联网科技有限公司</a>
					<span><a href="javascript:void()">培训师</a></span>
				</li>
				<li>
					<a href="javascript:void()">佛山市顺德区奥达信电器有限公司</a>
					<span><a href="javascript:void()">单证员</a><a href="javascript:void()">仓管员</a><a href="javascript:void()">质检员</a></span>
				</li>
				<li>
					<a href="javascript:void()">广州艾浩尔防霉抗菌科技有限公司</a>
					<span><a href="javascript:void()">前台文员</a><a href="javascript:void()">跟单办公室文员</a></span>
				</li>
				<li>
					<a href="javascript:void()">广州阳光社会工作事务中心</a>
					<span><a href="javascript:void()">实习生</a><a href="javascript:void()">服务领域部长</a><a href="javascript:void()">一线社工</a></span>
				</li>
			</ul>
			<div class="linediv"></div>
			<ul>
				<li>
					<a href="javascript:void()">惠州利恒塑胶电子有限公司</a>
					<span><a href="javascript:void()">电子工程师</a><a href="javascript:void()">结构工程师</a></span>
				</li>
				<li>
					<a href="javascript:void()">广州为想互联网科技有限公司</a>
					<span><a href="javascript:void()">培训师</a></span>
				</li>
				<li>
					<a href="javascript:void()">佛山市顺德区奥达信电器有限公司</a>
					<span><a href="javascript:void()">单证员</a><a href="javascript:void()">仓管员</a><a href="javascript:void()">质检员</a></span>
				</li>
				<li>
					<a href="javascript:void()">广州艾浩尔防霉抗菌科技有限公司</a>
					<span><a href="javascript:void()">前台文员</a><a href="javascript:void()">跟单办公室文员</a></span>
				</li>
				<li>
					<a href="javascript:void()">广州阳光社会工作事务中心</a>
					<span><a href="javascript:void()">实习生</a><a href="javascript:void()">服务领域部长</a><a href="javascript:void()">一线社工</a></span>
				</li>
				<li>
					<a href="javascript:void()">惠州利恒塑胶电子有限公司</a>
					<span><a href="javascript:void()">电子工程师</a><a href="javascript:void()">结构工程师</a></span>
				</li>
			</ul>
			<div class="more"><a href="javascript:void()">更多>></a></div>
		</div>
	</div>
	<div class="clear"></div>
	<div class="mainCon4">
		<ul>
			<li>
				<img src="${pageContext.request.contextPath}/images/19.gif" width="62" height="62"/>
				<p><a href="javascript:void()">河北华联建设投资管理股份有限公司</a></p>
			</li>
			<li>
				<img src="${pageContext.request.contextPath}/images/20.gif" width="62" height="62"/>
				<p><a href="javascript:void()">广州市富壹贷投资咨询有限公司</a></p>
			</li>
			<li>
				<img src="${pageContext.request.contextPath}/images/21.gif" width="62" height="62"/>
				<p><a href="javascript:void()">广州为想互联网科技有限公司</a></p>
			</li>
			<li>
				<img src="${pageContext.request.contextPath}/images/22.gif" width="62" height="62"/>
				<p><a href="javascript:void()">广州艾浩尔防霉抗菌科技有限公司</a></p>
			</li>
			<li>
				<img src="${pageContext.request.contextPath}/images/23.gif" width="62" height="62"/>
				<p><a href="javascript:void()">河北华联建设投资管理股份有限公司</a></p>
			</li>
			<li>
				<img src="${pageContext.request.contextPath}/images/24.gif" width="62" height="62"/>
				<p><a href="javascript:void()">广州为想互联网科技有限公司</a></p>
			</li>
			<li>
				<img src="${pageContext.request.contextPath}/images/25.gif" width="62" height="62"/>
				<p><a href="javascript:void()">广州艾浩尔防霉抗菌科技有限公司</a></p>
			</li>
			<li>
				<img src="${pageContext.request.contextPath}/images/26.gif" width="62" height="62"/>
				<p><a href="javascript:void()">广州为想互联网科技有限公司</a></p>
			</li>
			<li>
				<img src="${pageContext.request.contextPath}/images/27.gif" width="62" height="62"/>
				<p><a href="javascript:void()">河北华联建设投资管理股份有限公司</a></p>
			</li>
			<li>
				<img src="${pageContext.request.contextPath}/images/28.gif" width="62" height="62"/>
				<p><a href="javascript:void()">广州为想互联网科技有限公司</a></p>
			</li>
			<li>
				<img src="${pageContext.request.contextPath}/images/19.gif" width="62" height="62"/>
				<p><a href="javascript:void()">河北华联建设投资管理股份有限公司</a></p>
			</li>
			<li>
				<img src="${pageContext.request.contextPath}/images/20.gif" width="62" height="62"/>
				<p><a href="javascript:void()">广州市富壹贷投资咨询有限公司</a></p>
			</li>
			<li>
				<img src="${pageContext.request.contextPath}/images/21.gif" width="62" height="62"/>
				<p><a href="javascript:void()">广州为想互联网科技有限公司</a></p>
			</li>
			<li>
				<img src="${pageContext.request.contextPath}/images/22.gif" width="62" height="62"/>
				<p><a href="javascript:void()">广州艾浩尔防霉抗菌科技有限公司</a></p>
			</li>
			<li>
				<img src="${pageContext.request.contextPath}/images/23.gif" width="62" height="62"/>
				<p><a href="javascript:void()">河北华联建设投资管理股份有限公司</a></p>
			</li>
		</ul>
	</div>
	<div class="clear"></div>
	<div class="mainCon5">
		<div class="main5left">
			<div class="Info">
				<a href="javascript:void()" class="infoimg"><img src="${pageContext.request.contextPath}/images/29.GIF" width="213" height="123"/></a>
				<div class="infocon">
					<p class="Title2"><span>精彩专题</span> <a href="javascript:void()">开弓没有回头箭，齐心协力勇者前！</a> </p>
					<p class="Detail"><a href="javascript:void()">年末将至，被各种年度数据总结压的喘不过气来！忙中偷闲和小伙伴们来到射箭俱乐部，体验了一把射箭的快感，将疲劳压力神马的，顿时一扫而光！射箭，即箭术，助弓的弹力将箭射出，在一定的距离内比赛准确性的体育运动项目，为射箭运动。</a></p>
				</div>
			</div>
			<div class="Info">
				<a href="javascript:void()" class="infoimg"><img src="${pageContext.request.contextPath}/images/30.jpg" width="213" height="123"/></a>
				<div class="infocon">
					<p class="Title2"><span class="sspan">职场资讯</span> <a href="javascript:void()">17省市提高最低工资 京沪等4地进入2000元大关</a> </p>
					<p class="Detail"><a href="javascript:void()">2017年提高最低工资标准的地区数量较去年大幅增加。据不完全统计，目前至少已有17个地区公布了2017年最低工资标准。其中，上海、深圳、天津、北京的月最低工资标准≥2000元。17地区提高最低工资标准</a></p>
				</div>
			</div>
		</div>
		<div class="main5rigth">
			<div class="title">
				<span>常用文档下载</span>
				<a href="javascript:void()">更多</a>
			</div>
			<div class="content">
				<div class="divone">
					<a href="javascript:void()" class="a1">[地方公务]</a>
					<a href="javascript:void()" class="a2">2017年上海公务员考试申论真题</a>
				</div>
				<div class="divone">
					<a href="javascript:void()" class="a1">[地方公务]</a>
					<a href="javascript:void()" class="a2">2017年上海公务员考试申论真题</a>
				</div>
				<div class="divone">
					<a href="javascript:void()" class="a1">[地方公务]</a>
					<a href="javascript:void()" class="a2">2017年上海公务员考试申论真题</a>
				</div>
				<div class="divone">
					<a href="javascript:void()" class="a1">[地方公务]</a>
					<a href="javascript:void()" class="a2">2017年上海公务员考试申论真题</a>
				</div>
				<div class="line"></div>
				<div class="divone">
					<a href="javascript:void()" class="a1">[地方公务]</a>
					<a href="javascript:void()" class="a2">2017年上海公务员考试申论真题</a>
				</div>
				<div class="divone">
					<a href="javascript:void()" class="a1">[地方公务]</a>
					<a href="javascript:void()" class="a2">2017年上海公务员考试申论真题</a>
				</div>
				<div class="divone">
					<a href="javascript:void()" class="a1">[地方公务]</a>
					<a href="javascript:void()" class="a2">2017年上海公务员考试申论真题年上海公务员考试申论真题</a>
				</div>
				<div class="divone">
					<a href="javascript:void()" class="a1">[地方公务]</a>
					<a href="javascript:void()" class="a2">2017年上海公务员考试申论真题</a>
				</div>
			</div>
		</div>
	</div>
	<div class="clear"></div>
	<div class="mainCon6">
		<div class="commontitdiv">
			<div class="title">友情链接</div>
			<span class="line"></span>
		</div>
		<div class="clear"></div>
		<div class="contnt6">
			<ul>
				<li><a href="javascript:void()">火电招聘网</a></li>
				<li><a href="javascript:void()">校园招聘</a></li>
				<li><a href="javascript:void()">2018校园招聘</a></li>
				<li><a href="javascript:void()">打工网</a></li>
				<li><a href="javascript:void()">找工作</a></li>
				<li><a href="javascript:void()">黄山人才网</a></li>
				<li><a href="javascript:void()">南通人才网</a></li>
				<li><a href="javascript:void()">深圳人才网</a></li>
				<li><a href="javascript:void()">广州人才网</a></li>
				<li><a href="javascript:void()">信阳招聘网</a></li>
				<li><a href="javascript:void()">物流人才网</a></li>
				<li><a href="javascript:void()">医药招聘网</a></li>
				<li><a href="javascript:void()">黄山人才网</a></li>
				<li><a href="javascript:void()">南通人才网</a></li>
				<li><a href="javascript:void()">深圳人才网</a></li>
				<li><a href="javascript:void()">广州人才网</a></li>
				<li><a href="javascript:void()">信阳招聘网</a></li>
				<li><a href="javascript:void()">物流人才网</a></li>
				<li><a href="javascript:void()">医药招聘网</a></li>
			</ul>
		</div>
		<div class="clear"></div>
	</div>
</div>
<div class="footerLine"></div>
<div class="footer">
	<div class="footertop">
		<div class="footl">
			<div class="footlbox">
				<p>关于蝶飞人才网</p>
				<a href="javascript:void()">关于我们</a>
				<a href="javascript:void()">网站大事记</a>
				<a href="javascript:void()">视频展示</a>
				<a href="javascript:void()">媒体动态</a>
				<a href="javascript:void()">联系我们</a>
				<a href="javascript:void()">网站声明</a>
			</div>
			<div class="footlbox">
				<p>个人求职</p>
				<a href="javascript:void()">查工资</a>
				<a href="javascript:void()">注册/登录 </a>
				<a href="javascript:void()">职位搜索</a>
				<a href="javascript:void()">兼职招聘</a>
				<a href="javascript:void()">手机找工作</a>
			</div>
			<div class="footlbox">
				<p>企业招聘</p>
				<a href="javascript:void()">注册/登录</a>
				<a href="javascript:void()">资费标准</a>
				<a href="javascript:void()">掌中招聘 </a>
			</div>
			<div class="footlbox">
				<p>资讯中心</p>
				<a href="javascript:void()">招聘会</a>
				<a href="javascript:void()">校园招聘</a>
				<a href="javascript:void()">就业资讯</a>
				<a href="javascript:void()">文档下载</a>
			</div>
			<div class="footlbox">
				<p>快速导航</p>
				<a href="javascript:void()">网站地图</a>
				<a href="javascript:void()">职位地图</a>
				<a href="javascript:void()">热门搜索</a>
				<a href="javascript:void()">专业搜索</a>
				<a href="http://www.bootstrapmb.com">推广入口</a>
			</div>
		</div>
		<div class="footr">
			<div class="fr1">400-8**-****</div>
			<div class="fr2">每周一至周日 8:30-17:30</div>
			<div class="fr3">
				<span><img src="${pageContext.request.contextPath}/images/showqrcode.jpg" /><br />个人安卓客户端</span>
				<span><img src="${pageContext.request.contextPath}/images/showqrcode.jpg" /><br />企业安卓客户端</span>
			</div>
		</div>
		<div class="clear"></div>
	</div>
	<div class="footerdown">
		<div class="ssdiv">
			<input name="" type="text" placeholder="请输入关键词" class="sstxt"/>
			<input name="" type="button" value="搜索" class="ssbtn"/>
		</div>
		<div class="clear"></div>
		<div class="subdiv">
			<span>人才生态圈是***权威的专业求职招聘网站，涵盖***人才网，**人才招聘网，提供**人才网招聘信息、**人才市场信息等服务！</span>
			<span>版权所有:人才生态圈本网站所有招聘信息，未经书面授权不得转载 投诉电话：400-8**-****</span>
			<span>京ICP备*****号 京ICP备*****号<a href="javascript:void()">京ICP备*****号</a>
        <a href="javascript:void()">京ICP证0******9号</a>
        <a href="javascript:void()">沪ICP备****1号</a>
        <a href="javascript:void()"></a>
        <a href="javascript:void()" class="aimg"><img src="${pageContext.request.contextPath}/images/gongan.png" />京公网安备8*25******</a></span>
		</div>
		<div class="clear"></div>
		<div class="ffotdiv">
			<div class="fbox">
				<div class="l"><img src="${pageContext.request.contextPath}/images/3.jpg" height="37" width="45"/></div>
				<div class="r"><a href="javascript:void()">中国互联网协会理事成员</a></div>
			</div>
			<div class="fbox">
				<div class="l"><img src="${pageContext.request.contextPath}/images/4.jpg" height="37" width="45"/></div>
				<div class="r"><a href="javascript:void()">工信部网站备案信息</a></div>
			</div>
			<div class="fbox">
				<div class="l"><img src="${pageContext.request.contextPath}/images/5.jpg" height="37" width="45"/></div>
				<div class="r"><a href="javascript:void()">上海人才服务行业协会会员</a></div>
			</div>
			<div class="fbox">
				<div class="l"><img src="${pageContext.request.contextPath}/images/6.jpg" height="37" width="45"/></div>
				<div class="r"><a href="javascript:void()">北京人力资源行业协会会员</a></div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
</div>





</body>
</html>
