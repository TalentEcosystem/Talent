<%--
  Created by IntelliJ IDEA.
  User: Minzg
  Date: 2020/4/8
  Time: 20:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>注册</title>
	<%
		String path=request.getContextPath();
	%>
	<script src=<%=path+"/js/jquery-3.4.1.js" %>></script>
	<link rel="stylesheet" href=<%=path+"/css/login.css" %>>
	<script type="text/javascript" src=<%=path+"/js/front/userRegistered.js" %>></script>
<body style="background:#fff">
<div class="headerCom">
	<div class="mainwarp">
		<div class="logo"><a href="index.html"><img src="images/log.png" /></a></div>
		<div class="welcome">会员中心</div>
		<div class="headerright">
			<div class="r1">手机触屏版<a href="">m.diefeirencai.com</a></div>
			<div class="r2"><a href="">Android客户端下载</a></div>
			<div class="r3"><a href="loginCompany.html">企业登录</a></div>
			<div class="r4"><a href="index.html">返回首页</a></div>
		</div>
	</div>
</div>
<div class="CpRegister">
	<div class="mainwarp">
		<div class="regist1">
			<div class="registL">
				<span>注册企业会员</span>
				<p>面向河北的专业人才招聘网站</p>
			</div>
			<div class="registR">
				<img src="images/log1.jpg" width="516" height="177"/>
			</div>
			<div class="clear"></div>
		</div>
		<div class="regist2">
			<div class="registdiv">
				<div class="registtxt"><span>*</span>企业名称</div>
				<div class="registinput"><input name="" type="text" /></div>
				<div class="registsub"><span>请输入与公司营业执照一致的公司全称，一个公司建议注册一次</span></div>
				<div class="clear"></div>
			</div>
			<div class="registdiv">
				<div class="registtxt"><span>*</span>联 系 人</div>
				<div class="registinput"><input name="" type="text" /></div>
				<div class="registsub"><span>为方便联系，请您填写全名</span></div>
				<div class="clear"></div>
			</div>
			<div class="registdiv">
				<div class="registtxt"><span>*</span>手 机 号</div>
				<div class="registinput"><input name="" type="text" /></div>
				<div class="registsub"><span>注册完成后，您可以设置不对外公开手机号</span></div>
				<div class="clear"></div>
			</div>
			<div class="registdiv">
				<div class="registtxt"><span>*</span>验 证 码</div>
				<div class="registinput1"><input name="" type="text" /></div>
				<div class="registyzm">获取短信验证码</div>
				<div class="clear"></div>
			</div>
			<div class="registdiv">
				<div class="registtxt">固定电话</div>
				<div class="registinput"><input name="" type="text" /></div>
				<div class="clear"></div>
			</div>
			<div class="registdiv">
				<div class="registtxt"><span>*</span>电子邮箱</div>
				<div class="registinput"><input name="" type="text" /></div>
				<div class="registsub" style="padding-top:9px"><span>邮箱不对外公开，用于接收网站重要服务通知，必须正确填写（不建议使用QQ邮箱，可能收不到相关通知）</span></div>
				<div class="clear"></div>
			</div>
			<div class="registdiv">
				<div class="registtxt"><span>*</span>用 户 名</div>
				<div class="registinput"><input name="" type="text" /></div>
				<div class="registsub"><span>请输入6-20个字符</span></div>
				<div class="clear"></div>
			</div>
			<div class="registdiv">
				<div class="registtxt"><span>*</span>密    码</div>
				<div class="registinput"><input name="" type="text" /></div>
				<div class="registsub1">
					<div class="psdbg"></div>
					<span>密码长度8-20位，必须包含数字和字母</span>
				</div>
				<div class="clear"></div>
			</div>
			<div class="registdiv">
				<div class="registtxt"><span>*</span>确认密码</div>
				<div class="registinput"><input name="" type="text" /></div>
				<div class="clear"></div>
			</div>
			<div class="registdiv0">
				<input name="" type="checkbox" value="" /><span>我已阅读并接受<a href="registeragreement.html">用户协议</a></span>
			</div>
			<div class="registdivbtn">
				<input name="" type="button" />
			</div>
		</div>
		<div class="regist3">
			<span>1、</span>
			<span>本网站只能用于企业招聘使用，①谢绝从事人才中介、人力资源、猎头、境外就业、劳务中介、代理招聘、劳务派遣、劳务外包、境外彩票、出国留学、家政服务、招生、招商、直销、经济技术合作、收取求职者培训费用、商务调查、汽车租赁加盟、游戏代练等业务的公司使用。②谢绝从事娱乐公关、休闲会所、演艺传媒（如演员模特）、足浴、美容院、养生会馆等公司使用。③谢绝在家从事工种（如带回家制作的手工艺品）、网上创业开店、商务赚钱、私家侦探隐私调查及发布广告信息等公司使用。</span>
			<br />
			<span>2、</span>
			<span>由于保险公司和船务公司被投诉比例上升速度，我们暂时对保险公司及船务公司数量 进行限制。保险公司及船务公司只有交费后才能正常使用，如需办理会员请联系客服人员。</span>
		</div>
	</div>
</div>

<div class="clear"></div>
<div class="footer">
	<p><a href="">**人才</a>旗下<img src="images/logo_foot.gif" />蝶飞人才网版权所有 <a href="">京ICP证0******9号</a><a href=""></a>本网站所有招聘信息，未经书面授权不得转载 投诉电话：400-8**-****</p>
</div>
</body>
</html>
