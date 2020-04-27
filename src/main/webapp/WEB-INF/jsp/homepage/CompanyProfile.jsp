<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/16
  Time: 11:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>公司信息</title>
	<% String path=request.getContextPath();%>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/js/layui/css/layui.css" charset="UTF-8" />
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/homepage/css/company.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/homepage/js/company.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/layui/layui.js" charset="UTF-8"></script>

</head>
<body>

<c:if test="${not empty CompanyProfile}">
	<input type="hidden" id="cid" value="${CompanyProfile.cid}">
	<input type="hidden" value="<%=path%>" id="path">
<div class="compHeader" style="background-color:orange ">
	<div class="main">
		<div class="header_l">
			<a href="#">
				<img src="${pageContext.request.contextPath}/images/logo_1.png" />
				<img src="${pageContext.request.contextPath}/images/logo_2.png" />
			</a>
			<span>www.diefeirencai.com</span>
		</div>
		<div class="header_c">
		</div>
		<div class="header_r">
			<c:if test="${not empty uname}">

				<div class="nav" >
					<span style="background-color: orange">
			<img src="${pageContext.request.contextPath}/${uhead}" style="width: 32px;height: 30px; border-radius: 25px;">
	        <a href="" style="color: #0C0C0C" >${uname}</a>
            <ul>
	            <a href="${pageContext.request.contextPath}/user/personal"  ><li class="ll" >个人中心</li></a>
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
					<a href="#" class="lo"  >登录</a>
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

		</div>
	</div>
</div>
<div class="compMain">
	<div class="main">
		<div class="CpLogo">
			<img style="width: 140px;height: 140px" src="${pageContext.request.contextPath}/${CompanyProfile.companypic}"/>
		</div>
		<div class="CpDetail">
			<div class="CompanyName">
				<span class="title">${CompanyProfile.companyname}</span>
				<img src="${pageContext.request.contextPath}/images/16.png" />
				<span class="guanzhu">+ 关注</span>
			</div>
			<p>${CompanyProfile.companynature} | ${CompanyProfile.companynum}人 | </p>
			<p><a href="">http://www.**********.com</a></p>
			<p>${CompanyProfile.companyadd}</p>
		</div>
		<div class="CpStatus">
			<div class="statuscon status1">
				<span class="Number">${CompanyProfile.num}</span>
				<span>在招职位</span>
			</div>
			<div class="statuscon status2">
				<span class="Number">0</span>
				<span>企业形象</span>
			</div>
			<div class="statuscon status3">
				<span class="Number">100%</span>
				<span>答复率</span>
			</div>
			<div class="statuscon status4">
				<span class="Number">离线</span>
				<span>当前状态</span>
			</div>
		</div>
	</div>
</div>
<div class="compcontent">
	<div class="brandbox" >
<%--		<a href="">计算机硬件</a>&gt;--%>
		<a href="${pageContext.request.contextPath}/HomePage/index">首页</a> &gt;  <span>${CompanyProfile.companyname}</span>
	</div>
	<div class="comcontentL">
		<ul id="tabcompany">
			<li class="Active" id="licom" onclick="company()">公司介绍</li>
			<li id="lijob" onclick="job()">招聘职位</li>
			<div class="clear"></div>
		</ul>
		<script>
			//鼠标移进一出变色
			$('#tabcompany  #licom').hover(function(){
				$(this).addClass("Active")
			},function(){
				$(this).removeClass("Active")
			});
			$('#tabcompany  #lijob').hover(function(){
				$(this).addClass("Active");
				$("#licom").removeClass("Active");
			},function(){
				$(this).removeClass("Active")
			});

			var path=$("#path").val();
			var cid=$("#cid").val();
			layui.use(['table','form'], function(){
				var table = layui.table;
				var form=layui.form;
				var path=$("#path").val();

				table.render({
					elem: '#ComJob'
					,url:path+ '/HomePage/getComJobNews/'
					,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
					,id:'ComJobMsg'
					,skin:'nob'//风格无格子线
					// ,height:"533"
					,even: true //开启隔行背景
					,cols: [[
						{field:'positionname', width:'15%', title: '职位名称',style:''}
						,{field:'companyname', width:'20%', title: '企业名称',}
						, {field: 'indname', title: '行业', width: 120, hide: true, fixed: 'left', align: 'center'}
						,{field:'positionaddress', width:'25%', title: '工作地点',}
						,{field:'money', title: '薪水', width: '10%', minWidth: 100} //minWidth：局部定义当前单元格的最小宽度，layui 2.2.1 新增
						,{field:'positiontime', title: '发布时间', width: '13%', minWidth: 100,
							templet:"<div>{{layui.util.toDateString(d.positiontime,'MM月dd号 ')}}</div>"
						} //minWidth：局部定义当前单元格的最小宽度，layui 2.2.1 新增
						,{field:'j', title: '查看详情',toolbar:"#bar", width: '17%', minWidth: 100} //minWidth：局部定义当前单元格的最小宽度，layui 2.2.1 新增

					]]
					,page: true,
					limit:10,
					curr: 1,
					limits: [10,20,30], //一页选择显示3,5或10条数据
					where: {
						cid:cid
					}
					,parseData: function(res) { //将原始数据解析成 table 组件所规定的数据，res为从url中get到的数据
						console.log(res);
					}
					,done : function(res, curr, count){

						tableList=res.data;
						//layui表头样式
						$('th').css({'background-color': '#5792c6', 'color': '#fff','font-weight':'bold','border-bottom': '1px #F7B8A6 solid'});
						$('tr').css({})

					}
				});
				//注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
				table.on('tool(test)', function(obj){
					var data = obj.data; //获得当前行数据
					var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
					var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
					// var path1 = $("#path").val();
					console.log("撒飒飒");
					if(layEvent === 'look'){ //查看
						$.ajax({
							async:true,
							method : "POST",
							url :path+'/HomePage/checkJob',
							data: data,
							dataType : "text",
							success:function(msg){
								if ("1111"==msg){
									location.href=path+"/user/jobDetails"
								}else {
									layer.alert("网络繁忙",{icon:2});
								}
							}
						})
					}
				});
			});
			function company() {
				var ulcompany=document.getElementById("pro");
				var uljob=document.getElementById("uljob");
				ulcompany.style.display="block";
				uljob.style.display="none";

			}
			function job() {
				var ulcompany=document.getElementById("pro");
				var uljob=document.getElementById("uljob");
				ulcompany.style.display="none";
				uljob.style.display="block";

			}
		</script>
		<script type="text/html" id="bar">
			<button class="layui-btn layui-btn-sm layui-btn-normal" lay-event="look">
				<i class="layui-icon layui-icon-search ">查看详情</i>
			</button>
		</script>
		<div class="clear"></div>
		<div id="contentcompany">
			<ul style="display:block" id="pro">
				<div class="conts">
					<p>${CompanyProfile.companypro}</p>
<%--					<p>本公司拥有一支精诚团结的高水平的工程技术服务队伍，汇聚了计算机工程、电化教学、实验室设备、多媒体技术、自动控制及办公自动化、体育设施等专业的优秀人才，同时与中国科学院广州分院及众多高等院校、产品制造商建立了长期的合作关系，具有丰富的工程经验及雄厚的技术力量。</p>--%>
<%--					<p>公司奉行"面向现代化、开发新产品、服务教育界"的企业宗旨，坚持以优良的产品，完善的服务，合理的价格满足各类学校的需要。为此公司不断跟踪国内外发展动态，加强新产品的研发工作，现有多媒体语言学习系统、多功能电教室、物理、化学、生物、劳技、音乐等全套现代化实验室设备、教学仪器、电子产品、体育用品等，产品经质量技术监督局检验全部合格。</p>--%>
<%--					<p>您的要求是我们的标准，您的满意是我们的追求。在瞬息万变、科技突飞猛进的今天，本公司将一如既往地坚持"创新、诚信、团结、敬业、高质、高效"的原则，秉承"启迪新思维，创建新世纪"的发展思路，"以诚为本"理念，凭借卓越的技术力量和高质量的服务，不断开拓创新，为您提供更新、更先进、更完善的全方位产品和技术服务，赢得您对我们的信赖。</p>--%>
				</div>
			</ul>
			<ul id="uljob">
				<table class="layui-hide" id="ComJob" lay-filter="test" ></table>

			</ul>
		</div>
	</div>
	<div class="comcontentR">
		<div class="sharediv">
			<p>立即分享，推荐给朋友</p>
			<p><img src="images/shareqrcode.gif" width="105" /></p>
			<p style="font-size: 12px;">微信扫一扫</p>
			<div class="shareitem"></div>
		</div>
		<div class="likecompanydiv">
			<p class="Title">--您可能感兴趣的公司--</p>
			<div class="OneItem"><a href="company.html">广州纪光新媒体系统有限公司</a></div>
			<div class="OneItem"><a href="company.html">广州持诚安防工程有限公司</a></div>
			<div class="OneItem"><a href="company.html">广州鼎甲计算机科技有限公司</a></div>
		</div>
		<div class="CpTips">
			<h2>风险提示</h2>
			<p>最近登录时间：<span>2017/12/05 17:06</span></p>
			<p>最近登录IP：<span>58.63.3.*<br>[广东省广州市番禺区]</span></p>
			<p>本单位基本资料已通过 <a href="">网站证实</a></p>
			<p>资料仅供参考，请求职者<a href="">规避求职风险</a></p>
		</div>
	</div>
</div>
</c:if>
<div class="clear"></div>
<div class="footer">
	<p><a href="">**人才</a>旗下<img src="images/logo_foot.gif" />蝶飞人才网版权所有 <a href="">京ICP证0******9号</a><a href=""></a>本网站所有招聘信息，未经书面授权不得转载 投诉电话：400-8**-****</p>
</div>
</body>
</html>
