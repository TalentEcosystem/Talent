<%--
  Created by IntelliJ IDEA.
  User: Minzg
  Date: 2020/4/13
  Time: 16:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title>个人中心-我的收藏</title>
	<%
		String path=request.getContextPath();
	%>
	<link rel="stylesheet" href=<%=path+"/js/layui/css/layui.css"%>>
	<link rel="stylesheet" href=<%=path+"/css/personal.css"%>>
	<script src=<%=path+"/js/jquery-3.4.1.js" %>></script>
	<script type="text/javascript" src=<%=path+"/js/front/personals.js" %>></script>
	<script src=<%=path+"/js/layui/layui.js" %>></script>
</head>
<body>
<input type="hidden" id="path" value="<%=path%>">
<div class="header">
	<div class="headerMain">
		<div class="Notice">
			<span>公告：</span>
			<a href="">有实力就不怕平庸 如何离高薪更进一步</a>
		</div>
	</div>
</div>
<div class="navTop">
	<div class="navTopmain">
		<div class="logo"><a href="index.html"><img src=<%=path+"/images/logo_1.png" %>/><img src=<%=path+"/images/logo_2.png" %> /></a></div>
		<div class="nav">
			<div class="navItem"><a href=<%=path+"/user/index" %>>首页</a></div>
			<div class="navItem"><a href=<%=path+"/HomePage/searchJob" %>>职位搜索</a></div>
			<div class="navItem"><a href="">招聘会</a></div>
			<div class="navItem"><a href="">政府招考</a></div>
			<div class="navItem"><a href="">校园招聘</a></div>
			<div class="navItem other">
				<div style="position:relative;">
					<span>更多</span>
					<div id="TopNavMorePopup">
						<ul>
							<li><a href="">敬请期待</a></li>
							<li><a href="">敬请期待</a></li>
							<li><a href="">敬请期待</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="personalBody" id="searchTable">
	<div class="perLeftnav">
		<div class="NavLeftTop">个人中心</div>
		<div class="NavLeftMain">
			<div class="NavLeftBox">
				<a href=<%=path+"/user/personal" %> class="a7">个人信息</a>
			</div>
			<div class="NavLeftBox">
				<a href=<%=path+"/school/findUserResume" %> class="a2">我的简历</a>
			</div>
			<div class="NavLeftBox">
				<a href=<%=path+"/user/study"%> class="a3">学习记录</a>
			</div>
			<div class="NavLeftBox">
				<a href=<%=path+"/user/collection"%> class="a5">我的收藏</a>
			</div>
			<div class="NavLeftBox">
				<a href=<%=path+"/user/requestFeedback" %> class="a6">求职反馈</a>
			</div>
			<div class="NavLeftBox active">
				<a href=<%=path+"/user/help" %> class="a8">帮助中心</a>
			</div>
		</div>
	</div>
	<div class="perRightcon">
		<div class="commonTit">
			<h1 class="fl">帮助中心</h1>
		</div>
		<div class="sqzwBox">
			<ul id="tabsqzw">
				<li class="currentsqzw">常见问题解答</li>
				<div class="clear"></div>
			</ul>
			<div class="clear"></div>
			<div id="contentsqzw">
				<ul style="display:block;">
					<div class="questionsBox">
						<div class="quesBox">
							<a href="javascript:void(0)">1、我为什么看不到企业的联系方式？</a>
							<p class="Answer"><span>答复：</span>若企业是未认证会员或设置不对外公开，个人是无法查看企业联系方式的。</p>
						</div>
						<div class="quesBox">
							<a href="javascript:void(0)">2、个人注册后有什么好处？需要多长时间？个人注册需要交费吗？</a>
							<p class="Answer"><span>答复：</span>个人完成注册后，简历可以随时进行修改更新。企业在招聘时可以检索我们的简历库，会与适合的简历主动联系，您也将有更多的就业机会。 另外，注册后，可以使用申请职位的方式与心仪的企业联系。同时，个人注册简历是不需要交费的，可以免费求职。</p>
						</div>
						<div class="quesBox">
							<a href="javascript:void(0)">3、我看到了一个职位，如何联系招聘单位？</a>
							<p class="Answer"><span>答复：</span>您可以通过申请职位的方式与招聘单位联系咨询招聘事宜。主动出击有助于提高您的求职机率。因此，建议您如发现合适职位积极主动与企业通过各种方式取得联系。</p>
						</div>
						<div class="quesBox">
							<a href="javascript:void(0)">4、有没有虚假的招聘广告？</a>
							<p class="Answer"><span>答复：</span>在本网站发布招聘广告的公司都是通过网站审核的。同时您可以坚持的一个原则是，任何收取报名费、培训费、上岗费等费用都是违法的，有实力的公司不会在意这些小的费用。不要因为求职心切而轻易上当。由此而造成的损失，我们概不负责，请求职者慎重。</p>
						</div>
						<div class="quesBox">
							<a href="javascript:void(0)">5、我填写了简历，怎么一点反应也没有？</a>
							<p class="Answer"><span>答复：</span>也许您的经历太平淡，也许您的简历写的不够吸引人，所以无法引起企业的注意。事实上，很多人因为太多的企业与之联系而烦恼，您可以主动向企业申请职位，这样可以提高企业对您简历的认识度。另外，网络招聘的周期会比较长，有的用人单位不会马上给您回复，请您耐心等待。</p>
						</div>
						<div class="quesBox">
							<a href="javascript:void(0)">6、感觉好像是招聘的总是那么几家公司？</a>
							<p class="Answer"><span>答复：</span>网站系统会根据公司登录的次数自动刷新显示在网站首页上。建议您可以通过首页"找工作"功能中的多种查询途径进行查询。</p>
						</div>
						<div class="quesBox">
							<a href="javascript:void(0)">7、我感觉网上求职成功率不高，有什么秘诀吗？</a>
							<p class="Answer"><span>答复：</span>您可以按照以下建议来进行网上求职看一下是否对您有帮助：
								(1)详细而且真实地填写个人简历，用人单位对你的初步了解是 从简历开始的，必要时可以上传自己的照片。
								(2)必要的时候公开自己姓名，这将使招聘者有安全感，更有助于您的求职。
								(3)杜绝盲目申请职位，在申请职位前请仔细查看职位要求，否则会引起招聘单位反感。
								(4)建议您尝试使用职位搜索中的多种搜索功能，选择您感兴趣的职位。</p>
						</div>
						<div class="quesBox">
							<a href="javascript:void(0)">8、为什么我的联系方式有些招聘单位看不到，而我朋友的却能被这家单位看到？</a>
							<p class="Answer"><span>答复：</span>您的简历是存放在网站的简历库里的。招聘单位按照网站系统的提示操作即可查看您的联系方式。</p>
						</div>
						<div class="quesBox">
							<a href="javascript:void(0)">9、怎样更新我的简历？</a>
							<p class="Answer"><span>答复：</span>您可以登录会员中心，我的简历，修改后，点击简历后面跟着的"保存"即可。</p>
						</div>
						<div class="quesBox">
							<a href="javascript:void(0)">10、我刚刚修改了我的简历，我需要给前几天投递简历的单位重新投递吗？</a>
							<p class="Answer"><span>答复：</span>您修改简历后，网站系统会根据您最近登录的时间自动刷新。请您放心在您投递过的招聘单位中，看到的都是您最新的简历信息内容，无需重新投递。</p>
						</div>
					</div>
					<div class="sqxwqx">
						<div class="psge">共10条</div>
					</div>
				</ul>
			</div>
		</div>

	</div>
</div>
<div class="clear"></div>
<div class="footer">
	<p><a href="">**人才</a>旗下<img src=<%=path+"/images/logo_foot.gif" %> />蝶飞人才网版权所有 <a href="">京ICP证0******9号</a><a href=""></a>本网站所有招聘信息，未经书面授权不得转载 投诉电话：400-8**-****</p>
</div>
</body>
</html>