<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/8
  Time: 11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>职位搜索</title>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/js/layui/css/layui.css" charset="UTF-8" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/layui/layui.js" charset="UTF-8"></script>

	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/homepage/css/searchJob.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/homepage/js/searchJob.js"></script>
</head>

<body>
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
<%--			<li class="onmenu"><a href="searchJob.html">职位搜索</a></li>--%>
			<li><a href="personal.html">个人中心</a></li>
			<li><a href="meetingJob.html">招聘会</a></li>
			<li><a href="jobnews.html">就业资讯</a></li>
			<li><a href="download.html">文档下载</a></li>
			<li><a href="helpJob.html">求职互助</a></li>
			<div class="clear"></div>
		</ul>
	</div>
</div>
<div class="clear"></div>
<div class="menuLittle">
	<div class="menuselect"><a href="searchJob.html" class="on">高级搜索</a></div>
	<div class="menuselect"><a href="searchJob_map.html">地图搜索</a></div>
	<div class="menuselect"><a href="searchJob_new.html">最新职位</a></div>
	<div class="menuselect"><a href="searchJob_hot.html">热门搜索</a></div>
	<div class="menuselect"><a href="searchJob_jianzhi.html">兼职招聘</a></div>
	<div class="clear"></div>
</div>
<div class="clear"></div>

<form class="layui-form" action="">
<div class="searchDiv">
	<div class="search1">
		<div class="sea1_1">
			<input name="" type="text" placeholder="请填写关键词或选择职位" class="keyword"/>
			<span class="jiantou"></span>
		</div>

		<div class="sea1_2">
<%--			<input name="" type="text" placeholder="广东省" class="addtxt"/>--%>
	<div class="layui-form-item">
		<script>
			layui.use('form', function(){
				var form = layui.form;

				/*json数据*/
				var jsonList=[
					{"provice":"北京市","city":["东城区", "西城区", "朝阳区", "丰台区", "石景山区", "海淀区", "门头沟区", "房山区", "通州区", "顺义区", "昌平区", "大兴区", "怀柔区", "平谷区", "密云区", "延庆区"]},
					{"provice":"天津市","city":["和平区", "河东区", "河西区", "南开区", "河北区", "红桥区", "东丽区", "西青区", "津南区", "北辰区", "武清区", "宝坻区", "滨海新区", "宁河区", "静海区", "蓟州区"]},
					{"provice":"河北省","city":["石家庄市", "唐山市", "秦皇岛市", "邯郸市", "邢台市", "保定市", "张家口市", "承德市", "沧州市", "廊坊市", "衡水市"]},
					{"provice":"山西省","city":["太原市", "大同市", "阳泉市", "长治市", "晋城市", "朔州市", "晋中市", "运城市", "忻州市", "临汾市", "吕梁市"]},
					{"provice":"内蒙古自治区","city":["呼和浩特市", "包头市", "乌海市", "赤峰市", "通辽市", "鄂尔多斯市", "呼伦贝尔市", "巴彦淖尔市", "乌兰察布市", "兴安盟", "锡林郭勒盟", "阿拉善盟"]},
					{"provice":"辽宁省","city":["沈阳市", "大连市", "鞍山市", "抚顺市", "本溪市", "丹东市", "锦州市", "营口市", "阜新市", "辽阳市", "盘锦市", "铁岭市", "朝阳市", "葫芦岛市"]},
					{"provice":"吉林省","city":["长春市", "吉林市", "四平市", "辽源市", "通化市", "白山市", "松原市", "白城市", "延边朝鲜族自治州"]},
					{"provice":"黑龙江省","city":["哈尔滨市", "齐齐哈尔市", "鸡西市", "鹤岗市", "双鸭山市", "大庆市", "伊春市", "佳木斯市", "七台河市", "牡丹江市", "黑河市", "绥化市", "大兴安岭地区"]},
					{"provice":"上海市","city":["黄浦区", "徐汇区", "长宁区", "静安区", "普陀区", "虹口区", "杨浦区", "闵行区", "宝山区", "嘉定区", "浦东新区", "金山区", "松江区", "青浦区", "奉贤区", "崇明区"]},
					{"provice":"江苏省","city":["南京市", "无锡市", "徐州市", "常州市", "苏州市", "南通市", "连云港市", "淮安市", "盐城市", "扬州市", "镇江市", "泰州市", "宿迁市"]},
					{"provice":"浙江省","city":["杭州市", "宁波市", "温州市", "嘉兴市", "湖州市", "绍兴市", "金华市", "衢州市", "舟山市", "台州市", "丽水市"]},
					{"provice":"安徽省","city":["合肥市", "芜湖市", "蚌埠市", "淮南市", "马鞍山市", "淮北市", "铜陵市", "安庆市", "黄山市", "滁州市", "阜阳市", "宿州市", "六安市", "亳州市", "池州市", "宣城市"]},
					{"provice":"福建省","city":["福州市", "厦门市", "莆田市", "三明市", "泉州市", "漳州市", "南平市", "龙岩市", "宁德市"]},
					{"provice":"江西省","city":["南昌市", "景德镇市", "萍乡市", "九江市", "新余市", "鹰潭市", "赣州市", "吉安市", "宜春市", "抚州市", "上饶市"]},
					{"provice":"山东省","city":["济南市", "青岛市", "淄博市", "枣庄市", "东营市", "烟台市", "潍坊市", "济宁市", "泰安市", "威海市", "日照市", "莱芜市", "临沂市", "德州市", "聊城市", "滨州市", "菏泽市"]},
					{"provice":"河南省","city":["郑州市", "开封市", "洛阳市", "平顶山市", "安阳市", "鹤壁市", "新乡市", "焦作市", "濮阳市", "许昌市", "漯河市", "三门峡市", "南阳市", "商丘市", "信阳市", "周口市", "驻马店市", "济源市"]},
					{"provice":"湖北省","city":["武汉市", "黄石市", "十堰市", "宜昌市", "襄阳市", "鄂州市", "荆门市", "孝感市", "荆州市", "黄冈市", "咸宁市", "随州市", "恩施土家族苗族自治州", "仙桃市", "潜江市", "天门市", "神农架林区"]},
					{"provice":"湖南省","city":["长沙市", "株洲市", "湘潭市", "衡阳市", "邵阳市", "岳阳市", "常德市", "张家界市", "益阳市", "郴州市", "永州市", "怀化市", "娄底市", "湘西土家族苗族自治州"]},
					{"provice":"广东省","city":["广州市", "韶关市", "深圳市", "珠海市", "汕头市", "佛山市", "江门市", "湛江市", "茂名市", "肇庆市", "惠州市", "梅州市", "汕尾市", "河源市", "阳江市", "清远市", "东莞市", "中山市", "潮州市", "揭阳市", "云浮市"]},
					{"provice":"广西壮族自治区","city":["南宁市", "柳州市", "桂林市", "梧州市", "北海市", "防城港市", "钦州市", "贵港市", "玉林市", "百色市", "贺州市", "河池市", "来宾市", "崇左市"]},
					{"provice":"海南省","city":["海口市", "三亚市", "三沙市", "儋州市", "五指山市", "琼海市", "文昌市", "万宁市", "东方市", "定安县", "屯昌县", "澄迈县", "临高县", "白沙黎族自治县", "昌江黎族自治县", "乐东黎族自治县", "陵水黎族自治县", "保亭黎族苗族自治县", "琼中黎族苗族自治县"]},
					{"provice":"重庆市","city":["万州区", "涪陵区", "渝中区", "大渡口区", "江北区", "沙坪坝区", "九龙坡区", "南岸区", "北碚区", "綦江区", "大足区", "渝北区", "巴南区", "黔江区", "长寿区", "江津区", "合川区", "永川区", "南川区", "璧山区", "铜梁区", "潼南区", "荣昌区", "开州区", "梁平区", "武隆区", "城口县", "丰都县", "垫江县", "忠县", "云阳县", "奉节县", "巫山县", "巫溪县", "石柱土家族自治县", "秀山土家族苗族自治县", "酉阳土家族苗族自治县", "彭水苗族土家族自治县"]},
					{"provice":"四川省","city":["成都市", "自贡市", "攀枝花市", "泸州市", "德阳市", "绵阳市", "广元市", "遂宁市", "内江市", "乐山市", "南充市", "眉山市", "宜宾市", "广安市", "达州市", "雅安市", "巴中市", "资阳市", "阿坝藏族羌族自治州", "甘孜藏族自治州", "凉山彝族自治州"]},
					{"provice":"贵州省","city":["贵阳市", "六盘水市", "遵义市", "安顺市", "毕节市", "铜仁市", "黔西南布依族苗族自治州", "黔东南苗族侗族自治州", "黔南布依族苗族自治州"]},
					{"provice":"云南省","city":["昆明市", "曲靖市", "玉溪市", "保山市", "昭通市", "丽江市", "普洱市", "临沧市", "楚雄彝族自治州", "红河哈尼族彝族自治州", "文山壮族苗族自治州", "西双版纳傣族自治州", "大理白族自治州", "德宏傣族景颇族自治州", "怒江傈僳族自治州", "迪庆藏族自治州"]},
					{"provice":"西藏自治区","city":["拉萨市", "日喀则市", "昌都市", "林芝市", "山南市", "那曲市", "阿里地区"]},
					{"provice":"陕西省","city":["西安市", "铜川市", "宝鸡市", "咸阳市", "渭南市", "延安市", "汉中市", "榆林市", "安康市", "商洛市"]},
					{"provice":"甘肃省","city":["兰州市", "嘉峪关市", "金昌市", "白银市", "天水市", "武威市", "张掖市", "平凉市", "酒泉市", "庆阳市", "定西市", "陇南市", "临夏回族自治州", "甘南藏族自治州"]},
					{"provice":"青海省","city":["西宁市", "海东市", "海北藏族自治州", "黄南藏族自治州", "海南藏族自治州", "果洛藏族自治州", "玉树藏族自治州", "海西蒙古族藏族自治州"]},
					{"provice":"宁夏回族自治区","city":["银川市", "石嘴山市", "吴忠市", "固原市", "中卫市"]},
					{"provice":"新疆维吾尔自治区","city":["乌鲁木齐市", "克拉玛依市", "吐鲁番市", "哈密市", "昌吉回族自治州", "博尔塔拉蒙古自治州", "巴音郭楞蒙古自治州", "阿克苏地区", "克孜勒苏柯尔克孜自治州", "喀什地区", "和田地区", "伊犁哈萨克自治州", "塔城地区", "阿勒泰地区", "石河子市", "阿拉尔市", "图木舒克市", "五家渠市", "铁门关市"]},
					{"provice":"香港","city":["香港"]},
					{"provice":"澳门","city":["澳门"]}];
				/*    资料添加*/
				var provice="";
				var city="";

					for(var i=0;i<jsonList.length;i++){
						provice+="<option data-index="+i+" value='"+jsonList[i].provice+"'>"+jsonList[i].provice+"</option>";
						// $("#").append(provice);
					}

				$(".provinceTarget").append(provice);
				form.on('select(provinceTarget)', function(data){
					$(".xzdivC").empty();
					var opt=$(".provinceTarget option:selected").attr("data-index");

					if(opt == "-1"){
						city="<span data-index='-1' value='城市'>城市</span>";
						$("#xzdivC").append(city);
					}else{
						var length=jsonList[opt].city.length;

						for(var j=0;j<length;j++){
							city="<span data-index="+j+" value="+jsonList[opt].city[j]+">"+jsonList[opt].city[j]+"</span>";
							$("#xzdivC").append(city);
						}
					}
				});

				form.render('select');

			});
		</script>

		<select name="modules"  class="provinceTarget" lay-filter="provinceTarget" >
			<option value="">直接选择或搜索选择</option>
		</select>
		<script type="text/javascript">


		</script>
	</div>


		</div>
		<div class="sea1_3">
			<input name="" type="text" placeholder="请选择行业" class="hytxt"/>
		</div>
		<div class="sea1_4">
			<a href="javascript:void()">搜工作</a>
		</div>
		<div class="sea1_5">
			<span class="span1"><a href="javascript:void()">历史记录</a></span>
			<span class="span2"><a href="javascript:void()">职位分布图</a></span>
		</div>
	</div>
	<div class="search2">
		<div class="xzdiv">
			<div class="xzdivL">工作地点：</div>
			<div class="xzdivC" id="xzdivC">
				<span>广州市</span>
				<span>深圳市</span>
				<span>佛山市</span>
				<span>东莞市</span>
				<span>肇庆市</span>
				<span>珠海市</span>
				<span>江门市</span>
				<span>惠州市</span>
				<span>中山市</span>
				<span>阳江市</span>
				<span>湛江市</span>
				<span>河源市</span>
				<span>云浮市</span>
				<span>汕尾市</span>
				<span>茂名市</span>
				<span>汕头市</span>
				<span>清远市</span>
				<span>揭阳市</span>
			</div>
			<div class="xzdivB"><img src="images/11.png" class="imgshow"/><img src="images/10.png" class="imghidden"/></div>
			<div class="clear"></div>
		</div>
		<div class="xzdiv">
			<div class="xzdivL">职位类别：</div>
			<div class="xzdivC">
				<span>销售人员</span>
				<span>技工/普工</span>
				<span>行政/后勤</span>
				<span>生产制造/运营</span>
				<span>销售管理</span>
				<span>贸易/采购</span>
				<span>客服/技术支持</span>
				<span>IT产品/运营/设</span>
				<span>教育/培训</span>
				<span>影视/媒体</span>
				<span>软硬件开发/系统集</span>
				<span>餐饮/娱乐/旅游</span>
				<span>财务/审计/税务</span>
				<span>艺术设计</span>
				<span>市场/策划/公关</span>
				<span>销售行政/商务</span>
				<span>人力资源</span>
				<span>实习生/社工/科研</span>
				<span>证券/期货/投资</span>
				<span>质量/安全管理</span>
				<span>IT品质/运维/技</span>
				<span>经营管理</span>
				<span>翻译</span>
				<span>广告</span>
				<span>物流/交通/仓储</span>
				<span>汽车</span>
				<span>其他</span>
				<span>机械</span>
				<span>新闻/出版</span>
				<span>百货/零售</span>
				<span>保安/家政</span>
				<span>电子/半导体/电器</span>
				<span>通信</span>
				<span>保险</span>
				<span>法律</span>
				<span>化工</span>
				<span>房地产</span>
				<span>咨询</span>
				<span>物业管理</span>
				<span>电气/电力/能源</span>
				<span>服装/纺织品</span>
				<span>医院/医疗</span>
				<span>美容/健身</span>
				<span>环保</span>
				<span>农/林/牧/渔业</span>
				<span>IT管理</span>
			</div>
			<div class="xzdivB"><img src="images/11.png" class="imgshow"/><img src="images/10.png" class="imghidden"/></div>
			<div class="clear"></div>
		</div>
<%--		<div class="xzdiv">--%>
<%--			<div class="xzdivL">月薪范围：</div>--%>
<%--			<div class="xzdivC">--%>
<%--				<span>1K-2K</span>--%>
<%--				<span>2K-3K</span>--%>
<%--				<span>3K-4K</span>--%>
<%--				<span>4K-5K</span>--%>
<%--				<span>5K-6K</span>--%>
<%--				<span>6K-8K</span>--%>
<%--				<span>8K-10K</span>--%>
<%--				<span>10K-15K</span>--%>
<%--				<span>15K-20K</span>--%>
<%--				<span>20K以上</span>--%>
<%--				<span>面议</span>--%>
<%--			</div>--%>
<%--			<div class="xzdivB"></div>--%>
<%--			<div class="clear"></div>--%>
<%--		</div>--%>
<%--		<div class="xzdiv hidden">--%>
<%--			<div class="xzdivL">学历要求：</div>--%>
<%--			<div class="xzdivC">--%>
<%--				<span>初中(134)</span>--%>
<%--				<span>高中、中技、中专(321)</span>--%>
<%--				<span>大专(442)</span>--%>
<%--				<span>本科(102)</span>--%>
<%--				<span>硕士(4)</span>--%>
<%--				<span>不限(138)</span>--%>
<%--			</div>--%>
<%--			<div class="xzdivB"></div>--%>
<%--			<div class="clear"></div>--%>
<%--		</div>--%>
<%--		<div class="xzdiv hidden">--%>
<%--			<div class="xzdivL">工作年限：</div>--%>
<%--			<div class="xzdivC">--%>
<%--				<span>不限(539)</span>--%>
<%--				<span>1~2年(365)</span>--%>
<%--				<span>3~5年(135)</span>--%>
<%--				<span>6~10年(19)</span>--%>
<%--				<span>10年以上(6)</span>--%>
<%--				<span>应届毕业生(77)</span>--%>
<%--			</div>--%>
<%--			<div class="xzdivB"></div>--%>
<%--			<div class="clear"></div>--%>
<%--		</div>--%>
		<div class="xzdiv hidden">
			<div class="xzdivL">工作性质：</div>
			<div class="xzdivC">
				<span>全职(1056)</span>
				<span>兼职(53)</span>
				<span>实习(32)</span>
			</div>
			<div class="xzdivB"></div>
			<div class="clear"></div>
		</div>
<%--		<div class="xzdiv hidden">--%>
<%--			<div class="xzdivL">企业规模：</div>--%>
<%--			<div class="xzdivC">--%>
<%--				<span>少于50人(384)</span>--%>
<%--				<span>50~100人(362)</span>--%>
<%--				<span>101~200人(160)</span>--%>
<%--				<span>201~500人(113)</span>--%>
<%--				<span>501~1000人(64)</span>--%>
<%--				<span>1000人以上(58)</span>--%>
<%--			</div>--%>
<%--			<div class="xzdivB"></div>--%>
<%--			<div class="clear"></div>--%>
<%--		</div>--%>
		<div class="xzdiv">

			<div class="search1" style="background: white">
				<div class="sea1_1" style="width: 200px;border: #F6F6F6;margin-left: 10px;font-family: '微软雅黑';">
					<i style="float: left;padding-top: 10px;font-size: 18px">职业类别：</i>
					<div class="layui-input-inline" style="width: 100px;float: right">

						<select name="quiz1"  >
							<option value="">请选择省</option>
							<option value="浙江" selected="">浙江省</option>
							<option value="你的工号">江西省</option>
							<option value="你最喜欢的老师">福建省</option>
						</select>
					</div>
				</div>

				<div class="sea1_2" style="width: 200px;border: #F6F6F6;font-family: '微软雅黑';">

					<i style="float: left;padding-top: 10px;font-size: 18px">月薪范围：</i>
					<div class="layui-input-inline" style="width: 100px;float: right">

						<select name="quiz1"  >
							<option value="不限">不限</option>
							<option value="1000-2000" selected="">1K-2K</option>
							<option value="2000-3000">2K-3K</option>
							<option value="3000-4000">3K-4K</option>
							<option value="4000-5000" selected="">4K-5K</option>
							<option value="5000-6000">5K-6K</option>
							<option value="6000-8000">6K-8K</option>
							<option value="8000-10000" selected="">8K-10K</option>
							<option value="10000-15000">10K-15K</option>
							<option value="15000-20000">15K-20K</option>
							<option value="20000">20K以上</option>
							<option value="面议">面议</option>
						</select>
					</div>




				</div>
				<div class="sea1_3" style="width: 200px;border: #F6F6F6;font-family: '微软雅黑';">

					<i style="float: left;padding-top: 10px;font-size: 18px">学历要求：</i>
					<div class="layui-input-inline" style="width: 100px;float: right">

						<select name="quiz1"  >
							<option value="不限">不限</option>
							<option value="初中" selected="">初中</option>
							<option value="高中">高中</option>
							<option value="中专">中专</option>
							<option value="大专">大专</option>
							<option value="本科" selected="">本科</option>
							<option value="硕士">硕士</option>
							<option value="博士">博士</option>
						</select>
					</div>
				</div>
				<div class="sea1_4" style="background-color:white;font-size:12px;width: 200px;border: #F6F6F6;margin-top: 10px;padding-top: 0">
					<i style="float: left;font-size: 18px">工作年限：</i>
					<div class="layui-input-inline" style="width: 100px;float: right">

						<select name="quiz1"  >
							<option value="不限">不限</option>
							<option value="1-2" selected="">1-2年</option>
							<option value="3-5">3-5年</option>
							<option value="6-10">6~10年</option>
							<option value="10">10年以上</option>
							<option value="应届毕业生">应届毕业生</option>
						</select>
					</div>

				</div>
				<div class="sea1_5" style="width: 200px;border: #F6F6F6;font-family: '微软雅黑';margin-top: 10px;margin-left: 15px;">
					<i style="float: left;padding-top: 10px;font-size: 18px">企业规模：</i>
					<div class="layui-input-inline" style="width: 100px;float: right">

						<select name="quiz1"  >
							<option value="不限">不限</option>
							<option value="50" selected="">少于50人</option>
							<option value="50-100">50~100人</option>
							<option value="101-200">101~200人</option>
							<option value="201-500" selected="">201~500人</option>
							<option value="501-1000">501~1000人</option>
							<option value="1000">1000人以上</option>
						</select>
					</div>

				</div>
			</div>





<%--			<div class="xzdivC" >--%>
<%--				<div class="dydiv" >--%>
<%--					<select name="modules"  class="provinceTarget" lay-filter="provinceTarget" >--%>
<%--						<option value="">直接选择或搜索选择</option>--%>
<%--						<option value="">直接选择或搜索选择</option>--%>
<%--						<option value="">直接选择或搜索选择</option>--%>
<%--					</select>--%>
<%--				</div>--%>
<%--				<div class="dydiv">--%>
<%--					<select name="modules"  class="provinceTarget" lay-filter="provinceTarget" >--%>
<%--						<option value="">直接选择或搜索选择</option>--%>
<%--						<option value="">直接选择或搜索选择</option>--%>
<%--						<option value="">直接选择或搜索选择</option>--%>
<%--					</select>--%>
<%--				</div>--%>
<%--				<div class="dydiv">--%>
<%--					<input name="" type="checkbox" value="" />--%>
<%--					<span>奖金提成</span>--%>
<%--				</div>--%>
<%--				<div class="dydiv">--%>
<%--					<input name="" type="checkbox" value="" />--%>
<%--					<span>双休</span>--%>
<%--				</div>--%>
<%--				<div class="dydiv">--%>
<%--					<input name="" type="checkbox" value="" />--%>
<%--					<span>8小时工作制</span>--%>
<%--				</div>--%>
<%--				<div class="dydiv">--%>
<%--					<input name="" type="checkbox" value="" />--%>
<%--					<span>提供住宿</span>--%>
<%--				</div>--%>
<%--			</div>--%>
<%--			<div class="xzdivB"></div>--%>
<%--			<div class="clear"></div>--%>
		</div>
	</div>

	<div class="search3">
		<span class="down">更多选项</span>
	</div>
</div>
</form>

<div class="clear"></div>
<div class="seachlist">
	<div class="listtop">
		<div class="tj1">
			<span class="list on">列表</span>
			<span class="zhaoyao">摘要</span>
		</div>
		<div class="tj2">
			<input name="" type="checkbox" value="" />
			<span>只显示在线 </span>
		</div>
		<div class="tj2">
			<input name="" type="checkbox" value="" />
			<span>只显示有环境照片 </span>
		</div>
		<div class="tj3">
			<span>共1141条  第1/39页</span>
		</div>
	</div>
	<div class="clear"></div>
	<div class="listcon">
		<table border="0" width="100%" cellpadding="0" cellspacing="0" class="listtab">
			<thead>
			<tr>
				<th width="24%" style="padding-left:17px">职位名称</th>
				<th width="30%">企业名称</th>
				<th width="8%">企业答复率</th>
				<th width="16%">工作地点</th>
				<th width="8%">薪水</th>
				<th width="10%">刷新时间</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td>
					<input name="" type="checkbox" value="" />
					<a href="javascript:void()" class="jobname"><img src="images/Top.gif" />后勤文员<img src="images/qq.gif" /></a>
				</td>
				<td>
					<div class="company">
						<a href="javascript:void()">广东同源科技发展有限公司</a>
						<span><img src="images/16.png" /></span>
					</div>
				</td>
				<td><font style="color: red">100.0%</font></td>
				<td>广东佛山南海区</td>
				<td><span>2.5K-3.5K</span></td>
				<td>1小时</td>
			</tr>
			<tr class="xxdetail none">
				<td colspan="5">
					<div class="yaoqiu">学历要求：中专 | 工作经验：1~2年 | 公司规模：少于50人 | 招聘方式：全职<br />
						岗位职责：1、 负责公司资产管理、办公用品采购及劳保用品的管理工作,避免公司资产流失和浪费； 2、 负责书刊资料印刷、快递、物流及办公室的其他事情； 3、 ...<br />
						岗位要求：1、1年以上行政工作经验； 2、熟悉行政工作流程，办公用品采购流程，企业资产管理； 3、较强的责任心和敬业精神，良好的组织协调能力及沟通能力，较...</div>
				</td>
				<td>
					<div class="applydiv">
						<a href="" class="ljsqbtn">立即申请</a>
						<span class="ygz">已关注</span>
					</div>
				</td>
			</tr>
			<tr style="background: rgb(247, 248, 250)">
				<td>
					<input name="" type="checkbox" value="" />
					<a href="javascript:void()" class="jobname">国际贸易专员<img src="images/qq.gif" /></a>
				</td>
				<td>
					<div class="company">
						<a href="javascript:void()">深圳市鼎润轻纺进出口有限公司</a>
						<span><img src="images/16.png" /></span>
					</div>
				</td>
				<td></td>
				<td>广东深圳福田区</td>
				<td>3.5K-6K</td>
				<td>刚刚</td>
			</tr>
			<tr style="background: rgb(247, 248, 250)" class="xxdetail none">
				<td colspan="5">
					<div class="yaoqiu">学历要求：中专 | 工作经验：1~2年 | 公司规模：少于50人 | 招聘方式：全职<br />
						岗位职责：1、 负责公司资产管理、办公用品采购及劳保用品的管理工作,避免公司资产流失和浪费； 2、 负责书刊资料印刷、快递、物流及办公室的其他事情； 3、 ...<br />
						岗位要求：1、1年以上行政工作经验； 2、熟悉行政工作流程，办公用品采购流程，企业资产管理； 3、较强的责任心和敬业精神，良好的组织协调能力及沟通能力，较...</div>
				</td>
				<td>
					<div class="applydiv">
						<a href="" class="ljsqbtn">立即申请</a>
						<span>关注</span>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<input name="" type="checkbox" value="" />
					<a href="javascript:void()" class="jobname">外贸业务员</a>
				</td>
				<td>
					<div class="company">
						<a href="javascript:void()">深圳市鼎润轻纺进出口有限公司</a>
						<span><img src="images/16.png" /></span>
					</div>
				</td>
				<td></td>
				<td>广东深圳福田区</td>
				<td>3.5K-6K</td>
				<td>刚刚</td>
			</tr>
			<tr class="xxdetail none">
				<td colspan="5">
					<div class="yaoqiu">学历要求：中专 | 工作经验：1~2年 | 公司规模：少于50人 | 招聘方式：全职<br />
						岗位职责：1、 负责公司资产管理、办公用品采购及劳保用品的管理工作,避免公司资产流失和浪费； 2、 负责书刊资料印刷、快递、物流及办公室的其他事情； 3、 ...<br />
						岗位要求：1、1年以上行政工作经验； 2、熟悉行政工作流程，办公用品采购流程，企业资产管理； 3、较强的责任心和敬业精神，良好的组织协调能力及沟通能力，较...</div>
				</td>
				<td>
					<div class="applydiv">
						<a href="" class="ljsqbtn">立即申请</a>
						<span>关注</span>
					</div>
				</td>
			</tr>
			<tr style="background: rgb(247, 248, 250)">
				<td>
					<input name="" type="checkbox" value="" />
					<a href="javascript:void()" class="jobname">家具设计师</a>
				</td>
				<td>
					<div class="company">
						<a href="javascript:void()">深圳市鼎润轻纺进出口有限公司</a>
						<span><img src="images/16.png" /></span>
					</div>
				</td>
				<td></td>
				<td>广东深圳福田区</td>
				<td>3.5K-6K</td>
				<td>刚刚</td>
			</tr>
			<tr style="background: rgb(247, 248, 250)" class="xxdetail none">
				<td colspan="5">
					<div class="yaoqiu">学历要求：中专 | 工作经验：1~2年 | 公司规模：少于50人 | 招聘方式：全职<br />
						岗位职责：1、 负责公司资产管理、办公用品采购及劳保用品的管理工作,避免公司资产流失和浪费； 2、 负责书刊资料印刷、快递、物流及办公室的其他事情； 3、 ...<br />
						岗位要求：1、1年以上行政工作经验； 2、熟悉行政工作流程，办公用品采购流程，企业资产管理； 3、较强的责任心和敬业精神，良好的组织协调能力及沟通能力，较...</div>
				</td>
				<td>
					<div class="applydiv">
						<a href="" class="ljsqbtn">立即申请</a>
						<span>关注</span>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<input name="" type="checkbox" value="" />
					<a href="javascript:void()" class="jobname">项目客户代表<img src="images/qq.gif" /></a>
				</td>
				<td>
					<div class="company">
						<a href="javascript:void()">深圳市鼎润轻纺进出口有限公司</a>
						<span><img src="images/16.png" /></span>
					</div>
				</td>
				<td></td>
				<td>广东深圳福田区</td>
				<td>3.5K-6K</td>
				<td>30分钟</td>
			</tr>
			<tr class="xxdetail none">
				<td colspan="5">
					<div class="yaoqiu">学历要求：中专 | 工作经验：1~2年 | 公司规模：少于50人 | 招聘方式：全职<br />
						岗位职责：1、 负责公司资产管理、办公用品采购及劳保用品的管理工作,避免公司资产流失和浪费； 2、 负责书刊资料印刷、快递、物流及办公室的其他事情； 3、 ...<br />
						岗位要求：1、1年以上行政工作经验； 2、熟悉行政工作流程，办公用品采购流程，企业资产管理； 3、较强的责任心和敬业精神，良好的组织协调能力及沟通能力，较...</div>
				</td>
				<td>
					<div class="applydiv">
						<a href="" class="ljsqbtn">立即申请</a>
						<span>关注</span>
					</div>
				</td>
			</tr>
			<tr style="background: rgb(247, 248, 250)">
				<td>
					<input name="" type="checkbox" value="" />
					<a href="javascript:void()" class="jobname">项目客户代表</a>
				</td>
				<td>
					<div class="company">
						<a href="javascript:void()">深圳市鼎润轻纺进出口有限公司</a>
						<span><img src="images/16.png" /></span>
					</div>
				</td>
				<td></td>
				<td>广东深圳福田区</td>
				<td>3.5K-6K</td>
				<td>30分钟</td>
			</tr>
			<tr style="background: rgb(247, 248, 250)" class="xxdetail none">
				<td colspan="5">
					<div class="yaoqiu">学历要求：中专 | 工作经验：1~2年 | 公司规模：少于50人 | 招聘方式：全职<br />
						岗位职责：1、 负责公司资产管理、办公用品采购及劳保用品的管理工作,避免公司资产流失和浪费； 2、 负责书刊资料印刷、快递、物流及办公室的其他事情； 3、 ...<br />
						岗位要求：1、1年以上行政工作经验； 2、熟悉行政工作流程，办公用品采购流程，企业资产管理； 3、较强的责任心和敬业精神，良好的组织协调能力及沟通能力，较...</div>
				</td>
				<td>
					<div class="applydiv">
						<a href="" class="ljsqbtn">立即申请</a>
						<span>关注</span>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<input name="" type="checkbox" value="" />
					<a href="javascript:void()" class="jobname">车险续约客服</a>
				</td>
				<td>
					<div class="company">
						<a href="javascript:void()">深圳市鼎润轻纺进出口有限公司</a>
						<span><img src="images/16.png" /></span>
					</div>
				</td>
				<td></td>
				<td>广东深圳福田区</td>
				<td>3.5K-6K</td>
				<td>30分钟</td>
			</tr>
			<tr class="xxdetail none">
				<td colspan="5">
					<div class="yaoqiu">学历要求：中专 | 工作经验：1~2年 | 公司规模：少于50人 | 招聘方式：全职<br />
						岗位职责：1、 负责公司资产管理、办公用品采购及劳保用品的管理工作,避免公司资产流失和浪费； 2、 负责书刊资料印刷、快递、物流及办公室的其他事情； 3、 ...<br />
						岗位要求：1、1年以上行政工作经验； 2、熟悉行政工作流程，办公用品采购流程，企业资产管理； 3、较强的责任心和敬业精神，良好的组织协调能力及沟通能力，较...</div>
				</td>
				<td>
					<div class="applydiv">
						<a href="" class="ljsqbtn">立即申请</a>
						<span>关注</span>
					</div>
				</td>
			</tr>
			<tr style="background: rgb(247, 248, 250)">
				<td>
					<input name="" type="checkbox" value="" />
					<a href="javascript:void()" class="jobname">项目编写专员</a>
				</td>
				<td>
					<div class="company">
						<a href="javascript:void()">深圳市鼎润轻纺进出口有限公司</a>
						<span><img src="images/16.png" /></span>
					</div>
				</td>
				<td></td>
				<td>广东深圳福田区</td>
				<td>3.5K-6K</td>
				<td>30分钟</td>
			</tr>
			<tr style="background: rgb(247, 248, 250)" class="xxdetail none">
				<td colspan="5">
					<div class="yaoqiu">学历要求：中专 | 工作经验：1~2年 | 公司规模：少于50人 | 招聘方式：全职<br />
						岗位职责：1、 负责公司资产管理、办公用品采购及劳保用品的管理工作,避免公司资产流失和浪费； 2、 负责书刊资料印刷、快递、物流及办公室的其他事情； 3、 ...<br />
						岗位要求：1、1年以上行政工作经验； 2、熟悉行政工作流程，办公用品采购流程，企业资产管理； 3、较强的责任心和敬业精神，良好的组织协调能力及沟通能力，较...</div>
				</td>
				<td>
					<div class="applydiv">
						<a href="" class="ljsqbtn">立即申请</a>
						<span>关注</span>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<input name="" type="checkbox" value="" />
					<a href="javascript:void()" class="jobname">电话客服<img src="images/qq.gif" /></a>
				</td>
				<td>
					<div class="company">
						<a href="javascript:void()">深圳市鼎润轻纺进出口有限公司</a>
						<span><img src="images/16.png" /></span>
					</div>
				</td>
				<td></td>
				<td>广东深圳福田区</td>
				<td>3.5K-6K</td>
				<td>30分钟</td>
			</tr>
			<tr class="xxdetail none">
				<td colspan="5">
					<div class="yaoqiu">学历要求：中专 | 工作经验：1~2年 | 公司规模：少于50人 | 招聘方式：全职<br />
						岗位职责：1、 负责公司资产管理、办公用品采购及劳保用品的管理工作,避免公司资产流失和浪费； 2、 负责书刊资料印刷、快递、物流及办公室的其他事情； 3、 ...<br />
						岗位要求：1、1年以上行政工作经验； 2、熟悉行政工作流程，办公用品采购流程，企业资产管理； 3、较强的责任心和敬业精神，良好的组织协调能力及沟通能力，较...</div>
				</td>
				<td>
					<div class="applydiv">
						<a href="" class="ljsqbtn">立即申请</a>
						<span>关注</span>
					</div>
				</td>
			</tr>
			<tr style="background: rgb(247, 248, 250)">
				<td>
					<input name="" type="checkbox" value="" />
					<a href="javascript:void()" class="jobname">跟单人员</a>
				</td>
				<td>
					<div class="company">
						<a href="javascript:void()">深圳市鼎润轻纺进出口有限公司</a>
						<span><img src="images/16.png" /></span>
					</div>
				</td>
				<td></td>
				<td>广东深圳福田区</td>
				<td>3.5K-6K</td>
				<td>30分钟</td>
			</tr>
			<tr style="background: rgb(247, 248, 250)" class="xxdetail none">
				<td colspan="5">
					<div class="yaoqiu">学历要求：中专 | 工作经验：1~2年 | 公司规模：少于50人 | 招聘方式：全职<br />
						岗位职责：1、 负责公司资产管理、办公用品采购及劳保用品的管理工作,避免公司资产流失和浪费； 2、 负责书刊资料印刷、快递、物流及办公室的其他事情； 3、 ...<br />
						岗位要求：1、1年以上行政工作经验； 2、熟悉行政工作流程，办公用品采购流程，企业资产管理； 3、较强的责任心和敬业精神，良好的组织协调能力及沟通能力，较...</div>
				</td>
				<td>
					<div class="applydiv">
						<a href="" class="ljsqbtn">立即申请</a>
						<span>关注</span>
					</div>
				</td>
			</tr>
			</tbody>
		</table>
	</div>
	<div class="clear"></div>
	<div class="listbottom">
		<div class="lb1">
			<input name="" type="checkbox" value="" />
			<span>全选</span>
		</div>
		<div class="lb2">
			<a href="javascript:void()">浏览职位</a>
			<a href="javascript:void()" class="sqzw">申请职位</a>
			<a href="javascript:void()">关注职位</a>
		</div>
		<div class="lb3"><span>共1141条  第1/39页</span></div>
	</div>
	<div class="clear"></div>
	<div class="fenyediv">
		<a href="javascript:void()" class="fy1">首页</a>
		<a href="javascript:void()" class="fy1">上一页</a>
		<a href="javascript:void()" class="fy2 on">1</a>
		<a href="javascript:void()" class="fy2">2</a>
		<a href="javascript:void()" class="fy2">3</a>
		<a href="javascript:void()" class="fy2">4</a>
		<a href="javascript:void()" class="fy2">5</a>
		<a href="javascript:void()" class="fy2">6</a>
		<a href="javascript:void()" class="fy2">7</a>
		<a href="javascript:void()" class="fy2">8</a>
		<a href="javascript:void()" class="fy2">9</a>
		<a href="javascript:void()" class="fy2">10</a>
		<a href="javascript:void()" class="fy1">下一页</a>
		<a href="javascript:void()" class="fy1">尾页</a>
	</div>
	<div class="clear"></div>
	<div class="RegionSearch">
		<div class="title">
			<span>你也许还对这些感兴趣</span>
		</div>
		<div class="RegionList">
			<a href="javascript:void()">广州招聘</a>
			<a href="javascript:void()">深圳招聘</a>
			<a href="javascript:void()">珠海招聘</a>
			<a href="javascript:void()">汕头招聘</a>
			<a href="javascript:void()">韶关招聘</a>
			<a href="javascript:void()">河源招聘</a>
			<a href="javascript:void()">梅州招聘</a>
			<a href="javascript:void()">惠州招聘</a>
			<a href="javascript:void()">汕尾招聘</a>
			<a href="javascript:void()">东莞招聘</a>
			<a href="javascript:void()">中山招聘</a>
			<a href="javascript:void()">江门招聘</a>
			<a href="javascript:void()">佛山招聘</a>
			<a href="javascript:void()">阳江招聘</a>
			<a href="javascript:void()">湛江招聘</a>
			<a href="javascript:void()">茂名招聘</a>
			<a href="javascript:void()">肇庆招聘</a>
			<a href="javascript:void()">清远招聘</a>
			<a href="javascript:void()">潮州招聘</a>
			<a href="javascript:void()">揭阳招聘</a>
			<a href="javascript:void()">云浮招聘</a>
		</div>
	</div>
</div>
<div class="clear"></div>
<div class="footer">
	<p><a href="">**人才</a>旗下<img src="images/logo_foot.gif" />蝶飞人才网版权所有 <a href="">京ICP证0******9号</a><a href=""></a>本网站所有招聘信息，未经书面授权不得转载 投诉电话：400-8**-****</p>
</div>
</body>
</html>
