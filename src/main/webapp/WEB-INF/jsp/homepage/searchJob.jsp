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
	<% String path=request.getContextPath();%>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/js/layui/css/layui.css" charset="UTF-8" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/layui/layui.js" charset="UTF-8"></script>

	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/homepage/css/searchJob.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.4.1.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/homepage/js/searchJob.js"></script>
</head>
<style>
	.layui-table-cell{

		height:35px;
		line-height: 35px;
	}
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
	.lo{
		width: 200px;
		height: 45px;

		/*background-color: #F6F6F6;*/
		float: left;
		font-size: 23px;
		text-align: right;

	}
	.log ul{
		position: absolute;
		width:160px;
		display: none;
		background: #F6F6F6;
		text-align: center;
		margin: 32px 180px ;
		font-size: 18px;

	}
	.reg ul{
		position: absolute;
		width:160px;
		display: none;
		background: #F6F6F6;
		text-align: center;
		margin: 32px 240px ;
		font-size: 18px;
	}

	.li_yysy{
		background:#6EC7FF;
	}
	.mainWarp ul{
		margin-left: 20px
	}
	.mainWarp ul li{
		font-size: 22px;
		width: 120px;
	}

</style>
<body>
<input type="hidden" value="<%=path%>" id="path">
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
	            <a href="${pageContext.request.contextPath}/user/personal"  ><li class="ll" >个人中心</li></a>
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

				<a href="#" class="lo" style="width: 90px;margin-left: 200px;" >登录</a>
				<ul>
					<a href="${pageContext.request.contextPath}/user/login"><li class="ll" style="padding: 20px">用户登录</li></a>
					<a href="${pageContext.request.contextPath}/Enterprise/path/EnterpriseLogin"><li class="ll" style="padding: 20px">后台登录</li></a>
				</ul>

			</div>
			<div class="reg">
				<a href="#" class="lo" style="width: 80px;text-align: center" >注册</a>
				<ul>
					<a href="${pageContext.request.contextPath}/user/registered"><li class="ll" style="padding: 20px">用户注册</li></a>
					<a href="${pageContext.request.contextPath}/Enterprise/path/EnterpriseRegister"><li class="ll" style="padding: 20px">企业注册</li></a>
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


<%--		<div class="topR0 topR1"><a href="zhuceCompany.html">企业招聘</a></div>--%>
<%--		<div class="topR0 topR2"><a href="zhuce.html">注册</a></div>--%>
<%--		<div class="topR0 topR3"><a href="login.html">个人登录</a></div>--%>
<%--		<div class="topR0 topR4"><a href="javascript:void()">手机找工作</a></div>--%>
		<div class="clear"></div>
	</div>
</div>
<div class="menuDiv">
	<div class="mainWarp">
		<ul>
			<li><a href="${pageContext.request.contextPath}/HomePage/index">首页</a></li>
			<li class="onmenu"><a href="${pageContext.request.contextPath}/HomePage/searchJob">找工作</a></li>
			<li><a href="${pageContext.request.contextPath}/HomePage/getTechnologyArea?curPage=1">技术成长</a></li>
			<li><a href="${pageContext.request.contextPath}/user/personal" id="personal">个人中心</a></li>
<%--			<li><a href="helpJob.html">求职互助</a></li>--%>
			<div class="clear"></div>
		</ul>
	</div>
</div>
<div class="clear"></div>
<div class="menuLittle">
	<div class="menuselect"><a href="#" class="on">高级搜索</a></div>
<%--	<div class="menuselect"><a href="searchJob_map.html">地图搜索</a></div>--%>
<%--	<div class="menuselect"><a href="searchJob_new.html">最新职位</a></div>--%>
<%--	<div class="menuselect"><a href="searchJob_hot.html">热门搜索</a></div>--%>
<%--	<div class="menuselect"><a href="searchJob_jianzhi.html">兼职招聘</a></div>--%>
	<div class="clear"></div>
</div>
<div class="clear"></div>

<form class="layui-form" action="">
<div class="searchDiv">
	<div class="search1">
		<div class="sea1_1">
			<input name="" id="gangwei" type="text" autocomplete="off" placeholder="请填写关键词或选择职位" class="keyword"/>
			<span class="jiantou"></span>
		</div>

		<div class="sea1_2" style="width: 180px">
<%--			<input name="" type="text" placeholder="广东省" class="addtxt"/>--%>
	<div class="layui-form-item">
		<select name="modules"   class="provinceTarget" lay-filter="provinceTarget" id="province" >
			<option value="" data-index="-1" >选择省份</option>
		</select>
	</div>


		</div>

		<div class="sea1_3" style="width: 180px">
			<div class="layui-form-item">

				<select name="modules"  class="cityTarget"  id="city" >
					<option value="" data-index="-1" >选择城市</option>
				</select>
			</div>
		</div>
		<script>
			layui.use(['form','table','layer',], function(){
				var form = layui.form;
				var table=layui.table;
				var layer=layui.layer;
				var path=$("#path").val();
				/*省市二级联动json数据*/
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
				}
				$(".provinceTarget").append(provice);


				//薪资下拉框
				var money='';
				var moneyList=[
					{"name":"不限","value":"不限"},
					{"name":"1k-2k","value":"1000-2000"},
					{"name":"2k-3k","value":"2000-3000"},
					{"name":"3k-6k","value":"3000-6000"},
					{"name":"6k-10k","value":"6000-10000"},
					{"name":"10k-15k","value":"10000-15000"},
					{"name":"15k以上","value":"15000-99999999"},
					// {"name":"面议","value":"面议"},
				];
				for(var i=0;i<moneyList.length;i++){
					money+="<option data-index="+i+" value='"+moneyList[i].value+"'>"+moneyList[i].name+"</option>";
				}
				$("#money").append(money);
				//学历下拉框
				var degreeid='';
				var degreeidList=[
					{"name":"不限","value":8},
					{"name":"小学","value":7},
					{"name":"初中","value":6},
					{"name":"高中、中技、中专","value":5},
					{"name":"专科","value":4},
					{"name":"本科","value":3},
					{"name":"硕士","value":2},
					{"name":"博士及以上","value":1},
				];
				for(var i=0;i<degreeidList.length;i++){
					degreeid+="<option data-index="+i+" value='"+degreeidList[i].value+"'>"+degreeidList[i].name+"</option>";
				}
				$("#degreeid").append(degreeid);

				//企业规模下拉框
				var companynum='';
				var companynumList=[
					{"name":"不限","value":"不限"},
					{"name":"少于50人","value":'0-50'},
					{"name":"50~100人","value":'51-100'},
					{"name":"101~200人","value":'101-200'},
					{"name":"201~500人","value":'201-500'},
					{"name":"501~1000","value":'501-1000'},
					{"name":"1000以上","value":'1001-99999999'}
				];
				for(var i=0;i<companynumList.length;i++){
					companynum+="<option data-index="+i+" value='"+companynumList[i].value+"'>"+companynumList[i].name+"</option>";
				}
				$("#companynum").append(companynum);

				// 获取行业、工作经验 下拉框的数据
				$.ajax({
					type: "post",
					url: path+"/HomePage/getSelect",
					dataType: "json",
					async:true,
					success: function (data) {
						console.log(data);
						var html = '<option value ="-1">'+"不限"+  '</option>';
						if (data.length == 0){
							html += "<option value='-1'>不限</option>";
							$("#industryid").empty().append(html);
						}else{
							for(var x in data){
								html += '<option value = "' + data[x].industryid + '">' + data[x].indname + '</option>'
							}
							$("#industryid").empty().append(html);
						}
						$.ajax({
							type: "post",
							url: path+"/HomePage/getExperSelect",
							dataType: "json",
							async:true,
							success: function (data) {
								console.log(data);
								var html = '<option value ="不限">'+"不限"+  '</option>';
								if (data.length == 0){
									html += "<option value='不限'>不限</option>";
									$("#positionexper").empty().append(html);
								}else{
									for(var x in data){
										html += '<option value = "' + data[x]+ '">' + data[x] + '</option>'
									}
									$("#positionexper").empty().append(html);
								}
								form.render('select');
							},
							error: function (data) {
								layer.msg("数据获取失败,重新刷新");
							}
						});
						form.render();
					},
					error: function (data) {
							layer.msg("数据获取失败,重新刷新");
					}

				});



				form.on('select(provinceTarget)', function(data){
					$(".cityTarget").empty();
					var opt=$(".provinceTarget option:selected").attr("data-index");
					if(opt == "-1"){
						console.log(opt);
						city="<option  data-index='-1' value=''>选择城市</option >";
						$(".cityTarget").append(city);
					}else{
						var length=jsonList[opt].city.length;

						for(var j=0;j<length;j++){
							city="<option  data-index="+j+" value="+jsonList[opt].city[j]+">"+jsonList[opt].city[j]+"</option >";
							$(".cityTarget").append(city);
						}
					}
					form.render('select');
				});
				form.render('select');
			});
		</script>

		<div class="sea1_4">
			<input id="searchJob" type="button" style="color: #FFF;width: 116px;height: 37px;background-color:transparent" value="搜工作" />
		</div>
		<div class="sea1_5">

		</div>
	</div>
	<div class="search2">
<%--		<div class="xzdiv">--%>
<%--			<div class="xzdivL">工作地点：</div>--%>
<%--			<div class="xzdivC" id="xzdivC">--%>
<%--				<span>广州市</span>--%>
<%--				<span>深圳市</span>--%>
<%--				<span>佛山市</span>--%>
<%--				<span>东莞市</span>--%>
<%--				<span>肇庆市</span>--%>
<%--				<span>珠海市</span>--%>
<%--				<span>江门市</span>--%>
<%--				<span>惠州市</span>--%>
<%--				<span>中山市</span>--%>
<%--				<span>阳江市</span>--%>
<%--				<span>湛江市</span>--%>
<%--				<span>河源市</span>--%>
<%--				<span>云浮市</span>--%>
<%--				<span>汕尾市</span>--%>
<%--				<span>茂名市</span>--%>
<%--				<span>汕头市</span>--%>
<%--				<span>清远市</span>--%>
<%--				<span>揭阳市</span>--%>
<%--			</div>--%>
<%--			<div class="xzdivB"><img src="images/11.png" class="imgshow"/><img src="images/10.png" class="imghidden"/></div>--%>
<%--			<div class="clear"></div>--%>
<%--		</div>--%>
<%--		<div class="xzdiv">--%>
<%--			<div class="xzdivL">职位类别：</div>--%>
<%--			<div class="xzdivC">--%>
<%--				<span>销售人员</span>--%>
<%--				<span>技工/普工</span>--%>
<%--				<span>行政/后勤</span>--%>
<%--				<span>生产制造/运营</span>--%>
<%--				<span>销售管理</span>--%>
<%--				<span>贸易/采购</span>--%>
<%--				<span>客服/技术支持</span>--%>
<%--				<span>IT产品/运营/设</span>--%>
<%--				<span>教育/培训</span>--%>
<%--				<span>影视/媒体</span>--%>
<%--				<span>软硬件开发/系统集</span>--%>
<%--				<span>餐饮/娱乐/旅游</span>--%>
<%--				<span>财务/审计/税务</span>--%>
<%--				<span>艺术设计</span>--%>
<%--				<span>市场/策划/公关</span>--%>
<%--				<span>销售行政/商务</span>--%>
<%--				<span>人力资源</span>--%>
<%--				<span>实习生/社工/科研</span>--%>
<%--				<span>证券/期货/投资</span>--%>
<%--				<span>质量/安全管理</span>--%>
<%--				<span>IT品质/运维/技</span>--%>
<%--				<span>经营管理</span>--%>
<%--				<span>翻译</span>--%>
<%--				<span>广告</span>--%>
<%--				<span>物流/交通/仓储</span>--%>
<%--				<span>汽车</span>--%>
<%--				<span>其他</span>--%>
<%--				<span>机械</span>--%>
<%--				<span>新闻/出版</span>--%>
<%--				<span>百货/零售</span>--%>
<%--				<span>保安/家政</span>--%>
<%--				<span>电子/半导体/电器</span>--%>
<%--				<span>通信</span>--%>
<%--				<span>保险</span>--%>
<%--				<span>法律</span>--%>
<%--				<span>化工</span>--%>
<%--				<span>房地产</span>--%>
<%--				<span>咨询</span>--%>
<%--				<span>物业管理</span>--%>
<%--				<span>电气/电力/能源</span>--%>
<%--				<span>服装/纺织品</span>--%>
<%--				<span>医院/医疗</span>--%>
<%--				<span>美容/健身</span>--%>
<%--				<span>环保</span>--%>
<%--				<span>农/林/牧/渔业</span>--%>
<%--				<span>IT管理</span>--%>
<%--			</div>--%>
<%--			<div class="xzdivB"><img src="images/11.png" class="imgshow"/><img src="images/10.png" class="imghidden"/></div>--%>
<%--			<div class="clear"></div>--%>
<%--		</div>--%>

<%--		<div class="xzdiv hidden">--%>
<%--			<div class="xzdivL">工作性质：</div>--%>
<%--			<div class="xzdivC">--%>
<%--				<span>全职(1056)</span>--%>
<%--				<span>兼职(53)</span>--%>
<%--				<span>实习(32)</span>--%>
<%--			</div>--%>
<%--			<div class="xzdivB"></div>--%>
<%--			<div class="clear"></div>--%>
<%--		</div>--%>

		<div class="xzdiv">

			<div class="search1" style="background: white">
				<div class="sea1_1" style="width: 200px;border: #F6F6F6;margin-left: 10px;font-family: '微软雅黑';">
					<i style="float: left;padding-top: 10px;font-size: 18px">行业类别：</i>
					<div class="layui-input-inline" style="width: 100px;float: right" >

						<select name="quiz1" autocomplete="off"  lay-filter="industryid" id="industryid">

						</select>
					</div>
				</div>

				<div class="sea1_2" style="width: 200px;border: #F6F6F6;font-family: '微软雅黑';">

					<i style="float: left;padding-top: 10px;font-size: 18px">月薪范围：</i>
					<div class="layui-input-inline" style="width: 100px;float: right">

						<select name="quiz1" id="money"  lay-filter="money">

						</select>
					</div>




				</div>
				<div class="sea1_3" style="width: 200px;border: #F6F6F6;font-family: '微软雅黑';">

					<i style="float: left;padding-top: 10px;font-size: 18px">学历要求：</i>
					<div class="layui-input-inline" style="width: 100px;float: right">

						<select name="quiz1"  id="degreeid" lay-filter="degreeid">

						</select>
					</div>
				</div>
				<div class="sea1_4" style="background-color:white;font-size:12px;width: 200px;border: #F6F6F6;margin-top: 10px;padding-top: 0">
					<i style="float: left;font-size: 18px">工作经验：</i>
					<div class="layui-input-inline" style="width: 100px;float: right">
						<select name="quiz1"  id="positionexper"  lay-filter="positionexper">

						</select>
					</div>

				</div>
				<div class="sea1_5" style="width: 200px;border: #F6F6F6;font-family: '微软雅黑';margin-top: 10px;margin-left: 15px;">
					<i style="float: left;padding-top: 10px;font-size: 18px">企业规模：</i>
					<div class="layui-input-inline" style="width: 100px;float: right">

						<select name="quiz1" id="companynum"  lay-filter="companynum" >

						</select>
					</div>

				</div>
			</div>

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
<%--			<span class="zhaoyao">摘要</span>--%>
		</div>
		<div class="tj2">
<%--			<input name="" type="checkbox" value="" />--%>
<%--			<span>只显示在线 </span>--%>
		</div>
		<div class="tj2">
<%--			<input name="" type="checkbox" value="" />--%>
<%--			<span>只显示有环境照片 </span>--%>
		</div>
		<div class="tj3">

		</div>
	</div>
	<div class="clear"></div>
	<div class="listcon">
		<input type="hidden" value="${sypositionname}" id="sypositionname">
		<input type="hidden" value="${sypositionaddress}" id="sypositionaddress">
		<table class="layui-hide" id="test" lay-filter="test"  > </table>
		<script type="text/html" id="bar">
			<button class="layui-btn layui-btn-sm   layui-btn-normal" lay-event="look" >
				<i class="layui-icon layui-icon-search ">查看详情</i>
			</button>

		</script>
<%--		<script>--%>
<%--			function look() {--%>
<%--				var path=$("#path").val();--%>
<%--				--%>
<%--				$.ajax({--%>
<%--					method:"post",--%>
<%--					url:path+"/user/checkJob",--%>
<%--					async:true,--%>
<%--					success:function () {--%>
<%--					window.location.href=path+"/user/jobDetails"--%>
<%--					},--%>
<%--					error:function () {--%>

<%--					}--%>


<%--				});--%>



<%--			}--%>
<%--		</script>--%>
		<script>
			layui.use(['table','form'], function(){
				var table = layui.table;
				var form=layui.form;
				var path=$("#path").val();
				var sypositionaddress=$("#sypositionaddress").val();
				var sypositionname=$("#sypositionname").val();

				// console.log(sypositionaddress+sypositionname);
				table.render({
					elem: '#test'
					,url:path+ '/HomePage/getJobTableNews/'
					,cellMinWidth: 80 //全局定义常规单元格的最小宽度，layui 2.2.1 新增
					,id:'serviceCode'
					,skin:'nob'
					,even: true //开启隔行背景
					,cols: [[
						{field:'positionname', width:'10%', title: '职位名称',style:''}
						,{field:'companyname', width:'20%', title: '企业名称',}
						, {field: 'indname', title: '行业', width: 120, hide: true, fixed: 'left', align: 'center'}
						,{field:'positionaddress', width:'25%', title: '工作地点',}
						,{field:'money', title: '薪水', width: '10%', minWidth: 100} //minWidth：局部定义当前单元格的最小宽度，layui 2.2.1 新增
						,{field:'positiontime', title: '发布时间', width: '18%', minWidth: 100,
						templet:"<div>{{layui.util.toDateString(d.positiontime,'MM月dd号 ')}}</div>"
					} //minWidth：局部定义当前单元格的最小宽度，layui 2.2.1 新增
						,{field:'j', title: '查看详情',toolbar:"#bar", width: '17%', minWidth: 100} //minWidth：局部定义当前单元格的最小宽度，layui 2.2.1 新增

					]]
					,page: true,
					limit:10,
					curr: 1,
					limits: [10,20,30], //一页选择显示3,5或10条数据
					where: {
						sypositionname: sypositionname,
						sypositionaddress:sypositionaddress
					}
					,parseData: function(res) { //将原始数据解析成 table 组件所规定的数据，res为从url中get到的数据
						console.log(res);
					}
					,done : function(res, curr, count){

						tableList=res.data;
						$('th').css({'background-color': '#5792c6', 'color': '#fff','font-weight':'bold','border-bottom': '1px #F7B8A6 solid'});
						$('tr').css({})

					}
				});
				//查看详情
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
				$('#searchJob').on('click', function(){

					var positionname = $('#gangwei').val();

					var positionaddress = $("#province").find("option:selected").val()+$("#city").find("option:selected").val();
					console.log(positionname+positionaddress);
					console.log(positionaddress);
					//执行重载
					table.reload('serviceCode', {
						page: {
							curr: 1
						}
						,where: {
							sypositionname: sypositionname,
							sypositionaddress: sypositionaddress,
							positionname:positionname,
							positionaddress:positionaddress
						}
					});
					// }
				});

				form.on('select(industryid)', function(data){
					var positionname = $('#gangwei').val();//岗位的名称
					var positionaddress = $("#province").find("option:selected").val()+$("#city").find("option:selected").val();//工作的地址
					var industryid=data.value;//行业id
					var money=$("#money").find("option:selected").val();//资薪
					var degreeid=$("#degreeid").find("option:selected").val();//学历的id
					var positionexper=$("#positionexper").find("option:selected").val();//工作经验
					var companynum=$("#companynum").find("option:selected").val();//企业规模

					// console.log(data.elem); //得到select原始DOM对象
					console.log(data.value); //得到被选中的值
					// console.log(data.othis); //得到美化后的DOM对象
					table.reload('serviceCode', {
						page: {
							curr: 1
						}
						,where: {
							sypositionname: sypositionname,
							sypositionaddress: sypositionaddress,
							positionname:positionname,
							positionaddress:positionaddress,
							industryid:industryid,
							money:money,
							degreeid:degreeid,
							positionexper:positionexper,
							companynum:companynum



						}
					});



				});
				form.on('select(money)', function(data){
					var positionname = $('#gangwei').val();//岗位的名称
					var positionaddress = $("#province").find("option:selected").val()+$("#city").find("option:selected").val();//工作的地址
					var industryid=$("#industryid").find("option:selected").val();//行业id
					var money=data.value;//资薪
					var degreeid=$("#degreeid").find("option:selected").val();//学历的id
					var positionexper=$("#positionexper").find("option:selected").val();//工作经验
					var companynum=$("#companynum").find("option:selected").val();//企业规模

					// console.log(data.elem); //得到select原始DOM对象
					console.log(data.value); //得到被选中的值
					// console.log(data.othis); //得到美化后的DOM对象
					table.reload('serviceCode', {
						page: {
							curr: 1
						}
						,where: {
							sypositionname: sypositionname,
							sypositionaddress: sypositionaddress,
							positionname:positionname,
							positionaddress:positionaddress,
							industryid:industryid,
							money:money,
							degreeid:degreeid,
							positionexper:positionexper,
							companynum:companynum



						}
					});



				});
				form.on('select(degreeid)', function(data){
					var positionname = $('#gangwei').val();//岗位的名称
					var positionaddress = $("#province").find("option:selected").val()+$("#city").find("option:selected").val();//工作的地址
					var industryid=$("#industryid").find("option:selected").val();//行业id
					var money=$("#money").find("option:selected").val();//资薪
					var degreeid=data.value;//学历的id
					var positionexper=$("#positionexper").find("option:selected").val();//工作经验
					var companynum=$("#companynum").find("option:selected").val();//企业规模

					// console.log(data.elem); //得到select原始DOM对象
					console.log(data.value); //得到被选中的值
					console.log(data.value); //得到被选中的值
					// console.log(data.othis); //得到美化后的DOM对象
					table.reload('serviceCode', {
						page: {
							curr: 1
						}
						,where: {
							sypositionname: sypositionname,
							sypositionaddress: sypositionaddress,
							positionname:positionname,
							positionaddress:positionaddress,
							industryid:industryid,
							money:money,
							degreeid:degreeid,
							positionexper:positionexper,
							companynum:companynum



						}
					});



				});
				form.on('select(positionexper)', function(data){
					var positionname = $('#gangwei').val();//岗位的名称
					var positionaddress = $("#province").find("option:selected").val()+$("#city").find("option:selected").val();//工作的地址
					var industryid=$("#industryid").find("option:selected").val();//行业id
					var money=$("#money").find("option:selected").val();//资薪
					var degreeid=$("#degreeid").find("option:selected").val();//学历的id
					var positionexper=data.value;//工作经验
					var companynum=$("#companynum").find("option:selected").val();//企业规模

					// console.log(data.elem); //得到select原始DOM对象
					console.log(data.value); //得到被选中的值
					// console.log(data.othis); //得到美化后的DOM对象
					table.reload('serviceCode', {
						page: {
							curr: 1
						}
						,where: {
							sypositionname: sypositionname,
							sypositionaddress: sypositionaddress,
							positionname:positionname,
							positionaddress:positionaddress,
							industryid:industryid,
							money:money,
							degreeid:degreeid,
							positionexper:positionexper,
							companynum:companynum



						}
					});



				});
				form.on('select(companynum)', function(data){
					var positionname = $('#gangwei').val();//岗位的名称
					var positionaddress = $("#province").find("option:selected").val()+$("#city").find("option:selected").val();//工作的地址
					var industryid=$("#industryid").find("option:selected").val();//行业id
					var money=$("#money").find("option:selected").val();//资薪
					var degreeid=$("#degreeid").find("option:selected").val();//学历的id
					var positionexper=$("#positionexper").find("option:selected").val();//工作经验
					var companynum=data.value;//企业规模

					// console.log(data.elem); //得到select原始DOM对象
					console.log(data.value); //得到被选中的值
					// console.log(data.othis); //得到美化后的DOM对象
					table.reload('serviceCode', {
						page: {
							curr: 1
						}
						,where: {
							sypositionname: sypositionname,
							sypositionaddress: sypositionaddress,
							positionname:positionname,
							positionaddress:positionaddress,
							industryid:industryid,
							money:money,
							degreeid:degreeid,
							positionexper:positionexper,
							companynum:companynum



						}
					});



				});



			});
		</script>

	</div>
	<div class="clear"></div>
	<div class="listbottom">

		<div class="lb2">
<%--			<a href="javascript:void()">浏览职位</a>--%>
<%--			<a href="javascript:void()" class="sqzw">申请职位</a>--%>
<%--			<a href="javascript:void()">关注职位</a>--%>
		</div>
		<div class="lb3">
		</div>
	</div>
	<div class="clear"></div>
	<div class="fenyediv">

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
