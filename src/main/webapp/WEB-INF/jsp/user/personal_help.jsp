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
							<p class="Answer"><span>答复：</span>若企业是未认证会员或设置不对外公开，个人是无法查看企业联系方式的。建议您查看网站给您的相应提示。若对职位感兴趣，您也可以通过申请职位、留言的功能主动与单位联系，沟通具体事宜。</p>
						</div>
						<div class="quesBox">
							<a href="javascript:void(0)">2、个人注册后有什么好处？需要多长时间？个人注册需要交费吗？</a>
							<p class="Answer"><span>答复：</span>个人完成注册后，简历可以随时进行修改更新。企业在招聘时可以检索我们的简历库，会与适合的简历主动联系，您也将有更多的就业机会。 另外，注册后，可以使用申请职位、留言、电话等方式与心仪的企业联系。个人注册很简单，只要填上电子邮箱、密码几秒钟即可完成，但完成整个简历的注册取决于您写简历的速度。同时，个人注册简历是不需要交费的，可以免费求职。</p>
						</div>
						<div class="quesBox">
							<a href="javascript:void(0)">3、我目前已经找到工作，能删除注册的账户吗？</a>
							<p class="Answer"><span>答复：</span>如果您暂时不需要求职，请您登录网站后在"我的简历"中把简历设置为隐藏状态，这样除了您投递过简历的单位其他招聘单位都是搜索不到您的简历的，或也可以自行删除简历保留账户。如果您希望注销账户，您可以点击导航条上的 "首页"，在网站下方"关于我们"-"用户反馈"中提出申请，我们会在一个工作日进行处理。谢谢您的支持，祝您一切顺利！</p>
						</div>
						<div class="quesBox">
							<a href="javascript:void(0)">4、我看到了一个职位，如何联系招聘单位？</a>
							<p class="Answer"><span>答复：</span>您可以通过申请职位、留言或电话的方式与招聘单位联系咨询招聘事宜。主动出击有助于提高您的求职机率。因此，建议您如发现合适职位积极主动与企业通过各种方式取得联系。</p>
						</div>
						<div class="quesBox">
							<a href="javascript:void(0)">5、有没有虚假的招聘广告？</a>
							<p class="Answer"><span>答复：</span>建议您首先可以查看公司是否通过网站审核，公司名称后"执照小图标"，亮色的则表示该公司执照已通过本网站的审核，暗色的则说明没有通过网站审核。同时您也要参考网站为您提供的"规避求职风险"一文。可以坚持的一个原则是，任何收取报名费、培训费、上岗费等费用都是违法的，有实力的公司不会在意这些小的费用。不要因为求职心切而轻易上当。由此而造成的损失，我们概不负责，请求职者慎重。</p>
						</div>
						<div class="quesBox">
							<a href="javascript:void(0)">6、我填写了简历，怎么一点反应也没有？</a>
							<p class="Answer"><span>答复：</span>也许您的经历太平淡，也许您的简历写的不够吸引人，所以无法引起企业的注意。事实上，很多人因为太多的企业与之联系而烦恼，您可以主动向企业申请职位，这样可以提高企业对您简历的认识度。另外，网络招聘的周期会比较长，有的用人单位不会马上给您回复，请您耐心等待。同时每个单位的招聘情况都有所不同，您可以给对方公司留言或拨打电话进行咨询。</p>
						</div>
						<div class="quesBox">
							<a href="javascript:void(0)">7、接到了骚扰电话？</a>
							<p class="Answer"><span>答复：</span>您登录网站后，可以在左侧菜单栏的"我的简历"-&gt;"屏蔽公司"中，新增您要屏蔽的关键字即可，比如"保险"。成功屏蔽后，公司名称中包含您所屏蔽关键字的公司虽然可以看到您的简历（在"谁在关注我"中有显示），但无法看到您简历的详细信息。</p>
						</div>
						<div class="quesBox">
							<a href="javascript:void(0)">8、感觉好像是招聘的总是那么几家公司？</a>
							<p class="Answer"><span>答复：</span>网站系统会根据公司登录的次数自动刷新显示在网站首页上。建议您可以通过"职位搜索"功能中的多种查询途径进行查询。此外，每个单位的招聘情况都有所不同，长期或短期招聘都会在网站上发布招聘信息，更多招聘方面的疑问建议您通过留言等方式直接和单位联系沟通。</p>
						</div>
						<div class="quesBox">
							<a href="javascript:void(0)">9、我感觉网上求职成功率不高，有什么秘诀吗？</a>
							<p class="Answer"><span>答复：</span>您可以按照以下建议来进行网上求职看一下是否对您有帮助：
								(1)详细而且真实地填写个人简历，用人单位对你的初步了解是 从简历开始的，必要时可以上传自己的照片。
								(2)必要的时候公开自己姓名，这将使招聘者有安全感，更有助于您的求职。
								(3)使用预览简历功能，排版要美观大方，可以反复不断地修改
								(4)杜绝盲目申请职位，在申请职位前请仔细查看职位要求，否则会引起招聘单位反感。
								(5)建议您尝试使用职位搜索中的多种搜索功能，选择您感兴趣的职位。
								(6)鼓励多使用留言功能，并及时给对方回复留言。</p>
						</div>
						<div class="quesBox">
							<a href="javascript:void(0)">10、为什么我的联系方式有些招聘单位看不到，而我朋友的却能被这家单位看到？</a>
							<p class="Answer"><span>答复：</span>您的简历是公开的。招聘单位按照网站系统的提示操作即可查看您的联系方式。</p>
						</div>
						<div class="quesBox">
							<a href="javascript:void(0)">11、怎样刷新我的简历？</a>
							<p class="Answer"><span>答复：</span>您可以登录会员中心，我的简历，每份简历后面都跟着一个"更新"点击即可。更新时间近的简历会出现在查搜索列表的前列。</p>
						</div>
						<div class="quesBox">
							<a href="javascript:void(0)">12、我刚刚修改了我的简历，我需要给前几天投递简历的单位重新投递吗？</a>
							<p class="Answer"><span>答复：</span>您修改简历后，网站系统会根据您最近登录的时间自动刷新。请您放心在您投递过的招聘单位中，看到的都是您最新的简历信息内容，无需重新投递。</p>
						</div>
						<div class="quesBox">
							<a href="javascript:void(0)">13、如何删除申请的职位？删除后还可以找回么？</a>
							<p class="Answer"><span>答复：</span>您登录网站后，可以在左侧菜单栏的"职位申请"-&gt;"申请的职位"中，勾选要删除的职位，点击下面的"删除已选"。如果想找回删除的职位，可以在左侧菜单栏的"职位申请"-&gt;"申请的职位"页面右上角"职位回收站"中还原职位（也可以在这里彻底删除职位）。</p>
						</div>
						<div class="quesBox">
							<a href="javascript:void(0)">14、有个职位很适合我的一个朋友，怎么告诉他（她）？</a>
							<p class="Answer"><span>答复：</span>您可以使用职位页面"分享"功能，将职位分享给他（她）。也可以直接分享到朋友圈，这样您所有的朋友就可以看到您分享的职位。</p>
						</div>
					</div>
					<div class="sqxwqx">
						<div class="psge">共14条</div>
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