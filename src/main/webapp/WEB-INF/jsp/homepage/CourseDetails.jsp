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
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/homepage/css/searchJob.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/homepage/js/searchJob.js"></script>

	<style>
		#meetsx1{
			width: 35%;float: left;
		}
		#meetsx2{
			float: left;width: 65%
		}
		#meetsx2 p{
			padding: 10px
		}
		#contentmeetul{
			display:block;
			overflow-y:auto;
			overflow-x: hidden;
			height: 600px
		}
		#con a{
			height: 40px;
			padding-top: 5px;
		}
		#con img{
			float: left;width: 25px;height: 25px;margin-top: 10px
		}
		.paim{
			float: left;width: 160px;height: 40px;padding: 0 0 0 20px
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
	<!--   <div class="part1">-->
	<!--     <a href="javascript:void()"><img src="images/img1.png" /></a>-->
	<!--   </div>-->
<c:if test="${not empty product}">
	<div class="part2">
		<div class="part2main">
			<div class="meetsx" id="meetsx1" >
				<img style="padding-left: 70px;" src="${pageContext.request.contextPath}/${product.propic}">
			</div>
			<div class="meetsx" id="meetsx2" >
				<p >${product.proname}</p>
				<p >本课程包含${product.num}章节，${product.period}</p>
				<p style="width: 95%">${product.prointro} </p>
				<p ><img src="../images/9.png" alt=""/>${product.num}章节 <img src="../images/04.gif" />${product.procount}次播放<img src="../images/09.gif" alt=""/>2人共同学习</p>
				<p ><button class=""><img src="../images/04.gif" />播放视频</button></p>
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
					<li>心得分享</li>
					<li>作品展示</li>
					<div class="clear"></div>
				</ul>
				<div id="contentmeet">
					<ul id="contentmeetul" style="display: block" >
						<c:if test="${not empty product.date}">
						<c:forEach items="${product.date}" step="1" var="c">
						<div class="item gray">
							<img style="margin-right: 20px" src="../images/04.gif" />${c.chname}
						</div>
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

					<ul style="">
						<div class="item gray">
							<div class="iteml">
								<span class="span1">今天</span><br />
								<span class="span2">(周五)08:00-13:00</span>
							</div>
							<div class="itemr">
								<a href="" class="tit">12月22日珠海市人力资源中心日常综合招聘会</a>
								<div class="sub">
									<span>场馆：</span><a href="">珠海市</a><span>珠海市人力资源大厦</span><span>具体地点： 珠海市香洲区前山金鸡路122号</span><img src="images/22.png" />
								</div>
							</div>
						</div>
						<div class="item">
							<div class="iteml">
								<span class="span1">今天</span><br />
								<span class="span2">(周五)08:00-13:00</span>
							</div>
							<div class="itemr">
								<a href="" class="tit">12月22日佛山市人力资源市场综合人才招聘会</a>
								<div class="sub">
									<span>场馆：</span><a href="">佛山市</a><span>佛山人才大市场</span><span>具体地点： 佛山市禅城区轻工三路18号</span><img src="images/22.png" />
								</div>
							</div>
						</div>
						<div class="item gray">
							<div class="iteml">
								<span class="span1">今天</span><br />
								<span class="span2">(周五)08:00-13:00</span>
							</div>
							<div class="itemr">
								<a href="" class="tit">12月22日"才智辉煌"大型品牌人才交流招聘会</a>
								<div class="sub">
									<span>场馆：</span><a href="">广州市</a><span>花都辉煌人力资源市场</span><span>具体地点： 花都区新华街站前路2号三楼全层（广州北站正对面）</span><img src="images/22.png" />
								</div>
							</div>
						</div>
						<div class="item">
							<div class="iteml">
								<span class="span1">今天</span><br />
								<span class="span2">(周五)08:00-13:00</span>
							</div>
							<div class="itemr">
								<a href="" class="tit">12月22日市场营销、外语外贸、电子商务招聘会</a>
								<div class="sub">
									<span>场馆：</span><a href="">广州市</a><span>广州市南方精典大厦</span><span>具体地点： 广州市天河路198号南方精典大厦6-7楼（广州南方人才市场）</span><img src="images/22.png" />
								</div>
							</div>
						</div>
						<div class="item gray">
							<div class="iteml">
								<span class="span1">今天</span><br />
								<span class="span2">(周五)08:00-13:00</span>
							</div>
							<div class="itemr">
								<a href="" class="tit">12月22日大学城新天地广场校园招聘会</a>
								<div class="sub">
									<span>场馆：</span><a href="">广州市</a><span>广州大学城GOGO新天地正门 </span><span>具体地点： 广州大学城GOGO新天地正门</span><img src="images/22.png" />
								</div>
							</div>
						</div>
						<div class="item">
							<div class="iteml">
								<span class="span1">今天</span><br />
								<span class="span2">(周五)08:00-13:00</span>
							</div>
							<div class="itemr">
								<a href="" class="tit">12月22日周五龙观人才大市场综合类招聘会</a>
								<div class="sub">
									<span>场馆：</span><a href="">深圳市</a><span>深圳市龙观人才大市场</span><span>具体地点： 深圳市龙华新区龙华汽车站三楼 </span><img src="images/22.png" />
								</div>
							</div>
						</div>
						<div class="item gray">
							<div class="iteml">
								<span class="span1">今天</span><br />
								<span class="span2">(周五)08:00-13:00</span>
							</div>
							<div class="itemr">
								<a href="" class="tit">12月22日珠海市人力资源中心日常综合招聘会</a>
								<div class="sub">
									<span>场馆：</span><a href="">珠海市</a><span>珠海市人力资源大厦</span><span>具体地点： 珠海市香洲区前山金鸡路122号</span><img src="images/22.png" />
								</div>
							</div>
						</div>
						<div class="item">
							<div class="iteml">
								<span class="span1">今天</span><br />
								<span class="span2">(周五)08:00-13:00</span>
							</div>
							<div class="itemr">
								<a href="" class="tit">12月22日佛山市人力资源市场综合人才招聘会</a>
								<div class="sub">
									<span>场馆：</span><a href="">佛山市</a><span>佛山人才大市场</span><span>具体地点： 佛山市禅城区轻工三路18号</span><img src="images/22.png" />
								</div>
							</div>
						</div>
						<div class="item gray">
							<div class="iteml">
								<span class="span1">今天</span><br />
								<span class="span2">(周五)08:00-13:00</span>
							</div>
							<div class="itemr">
								<a href="" class="tit">12月22日"才智辉煌"大型品牌人才交流招聘会</a>
								<div class="sub">
									<span>场馆：</span><a href="">广州市</a><span>花都辉煌人力资源市场</span><span>具体地点： 花都区新华街站前路2号三楼全层（广州北站正对面）</span><img src="images/22.png" />
								</div>
							</div>
						</div>
						<div class="item">
							<div class="iteml">
								<span class="span1">今天</span><br />
								<span class="span2">(周五)08:00-13:00</span>
							</div>
							<div class="itemr">
								<a href="" class="tit">12月22日市场营销、外语外贸、电子商务招聘会</a>
								<div class="sub">
									<span>场馆：</span><a href="">广州市</a><span>广州市南方精典大厦</span><span>具体地点： 广州市天河路198号南方精典大厦6-7楼（广州南方人才市场）</span><img src="images/22.png" />
								</div>
							</div>
						</div>
						<div class="item gray">
							<div class="iteml">
								<span class="span1">今天</span><br />
								<span class="span2">(周五)08:00-13:00</span>
							</div>
							<div class="itemr">
								<a href="" class="tit">12月22日大学城新天地广场校园招聘会</a>
								<div class="sub">
									<span>场馆：</span><a href="">广州市</a><span>广州大学城GOGO新天地正门 </span><span>具体地点： 广州大学城GOGO新天地正门</span><img src="images/22.png" />
								</div>
							</div>
						</div>
						<div class="item">
							<div class="iteml">
								<span class="span1">今天</span><br />
								<span class="span2">(周五)08:00-13:00</span>
							</div>
							<div class="itemr">
								<a href="" class="tit">12月22日周五龙观人才大市场综合类招聘会</a>
								<div class="sub">
									<span>场馆：</span><a href="">深圳市</a><span>深圳市龙观人才大市场</span><span>具体地点： 深圳市龙华新区龙华汽车站三楼 </span><img src="images/22.png" />
								</div>
							</div>
						</div>
					</ul>
					<ul>
						<div class="item gray">
							<div class="iteml">
								<span class="span3">12-21</span><br />
								<span class="span2">(周四)14:30-17:30</span>
							</div>
							<div class="itemr">
								<a href="" class="tit">12月21日南方科技大学2018届单周招聘会</a>
								<span class="schoolicon"></span>
								<div class="sub">
									<span>场馆：</span><a href="">深圳市</a><span>南方科技大学</span><span>具体地点： 校内学生事务中心</span><img src="images/22.png" />
								</div>
							</div>
						</div>
						<div class="item">
							<div class="iteml">
								<span class="span3">12-21</span><br />
								<span class="span2">(周四)14:30-17:30</span>
							</div>
							<div class="itemr">
								<a href="" class="tit">12月21日广州达信大厦各大企业岗位免费招聘会</a>
								<div class="sub">
									<span>场馆：</span><a href="">广州市</a><span>广州市越秀区德政北路538号达信大厦28楼</span><span>具体地点： 广州市越秀区德政北路538号达信大厦28楼</span><img src="images/22.png" />
								</div>
							</div>
						</div>
						<div class="item gray">
							<div class="iteml">
								<span class="span3">12-21</span><br />
								<span class="span2">(周四)10:00-15:00</span>
							</div>
							<div class="itemr">
								<a href="" class="tit">12月21日2018届仲恺农业工程学院毕业生供需见面招聘会 </a>
								<span class="schoolicon"></span>
								<div class="sub">
									<span>场馆：</span><a href="">广州市</a><span>仲恺农业工程学院白云校区</span><span>具体地点： 白云校区</span><img src="images/22.png" />
								</div>
							</div>
						</div>
						<div class="item">
							<div class="iteml">
								<span class="span3">12-21</span><br />
								<span class="span2">(周四)09:30-14:00</span>
							</div>
							<div class="itemr">
								<a href="" class="tit">12月21日河北女子职业技术学院 2018届毕业生校园招聘会</a>
								<span class="schoolicon"></span>
								<div class="sub">
									<span>场馆：</span><a href="">广州市</a><span>河北女子职业技术学院</span><span>具体地点： 行政楼广场</span><img src="images/22.png" />
								</div>
							</div>
						</div>
						<div class="item gray">
							<div class="iteml">
								<span class="span3">12-21</span><br />
								<span class="span2">(周四)09:30-14:30</span>
							</div>
							<div class="itemr">
								<a href="" class="tit">12月21日河北农工商职业技术学院2018届粤垦路校区招聘会</a>
								<span class="schoolicon"></span>
								<div class="sub">
									<span>场馆：</span><a href="">广州市</a><span>河北农工商职业技术学院</span><span>具体地点： 河北农工商职业技术学院运动场</span><img src="images/22.png" />
								</div>
							</div>
						</div>
						<div class="item">
							<div class="iteml">
								<span class="span3">12-21</span><br />
								<span class="span2">(周四)09:00-16:00</span>
							</div>
							<div class="itemr">
								<a href="" class="tit">"优职河北"2018届高校毕业生O2O华南理工大学招聘会 </a>
								<span class="schoolicon"></span>
								<div class="sub">
									<span>场馆：</span><a href="">广州市</a><span>华南理工大学五山校区</span><span>具体地点： 五山校区海丽文体中心</span><img src="images/22.png" />
								</div>
							</div>
						</div>
						<div class="item gray">
							<div class="iteml">
								<span class="span3">12-21</span><br />
								<span class="span2">(周四)14:30-17:30</span>
							</div>
							<div class="itemr">
								<a href="" class="tit">12月21日南方科技大学2018届单周招聘会</a>
								<span class="schoolicon"></span>
								<div class="sub">
									<span>场馆：</span><a href="">深圳市</a><span>南方科技大学</span><span>具体地点： 校内学生事务中心</span><img src="images/22.png" />
								</div>
							</div>
						</div>
						<div class="item">
							<div class="iteml">
								<span class="span3">12-21</span><br />
								<span class="span2">(周四)14:30-17:30</span>
							</div>
							<div class="itemr">
								<a href="" class="tit">12月21日广州达信大厦各大企业岗位免费招聘会</a>
								<div class="sub">
									<span>场馆：</span><a href="">广州市</a><span>广州市越秀区德政北路538号达信大厦28楼</span><span>具体地点： 广州市越秀区德政北路538号达信大厦28楼</span><img src="images/22.png" />
								</div>
							</div>
						</div>
						<div class="item gray">
							<div class="iteml">
								<span class="span3">12-21</span><br />
								<span class="span2">(周四)10:00-15:00</span>
							</div>
							<div class="itemr">
								<a href="" class="tit">12月21日2018届仲恺农业工程学院毕业生供需见面招聘会 </a>
								<span class="schoolicon"></span>
								<div class="sub">
									<span>场馆：</span><a href="">广州市</a><span>仲恺农业工程学院白云校区</span><span>具体地点： 白云校区</span><img src="images/22.png" />
								</div>
							</div>
						</div>
						<div class="item">
							<div class="iteml">
								<span class="span3">12-21</span><br />
								<span class="span2">(周四)09:30-14:00</span>
							</div>
							<div class="itemr">
								<a href="" class="tit">12月21日河北女子职业技术学院 2018届毕业生校园招聘会</a>
								<span class="schoolicon"></span>
								<div class="sub">
									<span>场馆：</span><a href="">广州市</a><span>河北女子职业技术学院</span><span>具体地点： 行政楼广场</span><img src="images/22.png" />
								</div>
							</div>
						</div>
						<div class="item gray">
							<div class="iteml">
								<span class="span3">12-21</span><br />
								<span class="span2">(周四)09:30-14:30</span>
							</div>
							<div class="itemr">
								<a href="" class="tit">12月21日河北农工商职业技术学院2018届粤垦路校区招聘会</a>
								<span class="schoolicon"></span>
								<div class="sub">
									<span>场馆：</span><a href="">广州市</a><span>河北农工商职业技术学院</span><span>具体地点： 河北农工商职业技术学院运动场</span><img src="images/22.png" />
								</div>
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

			<%--得到课程信息--%>
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
							$("#con").append(
								"<a href='"+path+"/HomePage/getCourseDetails?proid="+study[i].productid+"'  >"+
								"<img src='"+path+"/images/04.gif' >"+

								"<div class='paim' >"+
								"<div style='height: 20px'>"+study[i].proname+"</div>"+
								"<div style='height: 20px'>"+study[i].procount+"次播放</div>"+
								"</div>"+
								"</a>"
							);
						}
					},
					error: function (data) {
						console.log(data);
					}
				});
			</script>
			<div class="part3_2">
				<h1>课程排行</h1>
				<div class="con" id="con">

				</div>
			</div>
			<div class="part3_3">
				<div class="title">温馨提示</div>
				<div class="content">少数招聘会场次可能临时改变时间、地点、甚至取消。可与相关企业和承办学校联系确认后再前往。</div>
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
