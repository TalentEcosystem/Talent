$(function () {
	// 得到课程排名信息
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
					"<div style='height: 20px;float: left'>"+study[i].procount+"次播放</div>"+
					"<div style='float: right;'><button class='layui-btn-danger' style='width: 20px;'>"+(i+1)+"</button></div>"+
				"</div>"+
					"</a>"
				);
			}
		},
		error: function (data) {}
	});


// 鼠标经过 用户名 显示  离开隐藏
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
	layui.use(['carousel','layer'], function() {
		var layer = layui.layer;
		var carousel=layui.carousel;
		// 得到评论信息
		//图片轮播
		carousel.render({
			elem: '#test10'
			,width: '400px'
			,height: '220px'
			,interval: 5000
		});
		$("#tabmeet li").eq(2).click(function(){
			console.log("aa");
			var pid=$("#productid").val();
			$.ajax({
				type: 'post',
				url: path+"/HomePage/getEvaInfo",
				async:true,
				// dataType:"json",
				data:{"pid":pid},
				success:function (data) {
					console.log(data);
					$("#pinglist").empty();
					var comcent=JSON.parse(data);
					for (let i = 0; i <comcent.length ; i++) {
						var time=renderTime(comcent[i].evatime);
						//成功再查询评论数据
				$("#pinglist").append(
				"<li class='gitment-comment'>"+
						"<a class='gitment-comment-avatar'>"+
						"<img class='gitment-comment-avatar-img' src='"+path+"/"+comcent[i].uhead+"'>"+
						"</a>"+
						"<div class='gitment-comment-main'>"+
						"<div class='gitment-comment-header'>"+
						"<a class='gitment-comment-name'>"+comcent[i].uname+"</a>"+
						"<span style='margin-left: 20px'>"+time+"</span>"+
					"<div class='gitment-comment-like-btn'>"+
						"<svg class='gitment-heart-icon' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 50 50'>"+
						"<path d='M25 39.7l-.6-.5C11.5 28.7 8 25 8 19c0-5 4-9 9-9 4.1 0 6.4 2.3 8 4.1 1.6-1.8 3.9-4.1 8-4.1 5 0 9 4 9 9 0 6-3.5 9.7-16.4 20.2l-.6.5zM17 12c-3.9 0-7 3.1-7 7 0 5.1 3.2 8.5 15 18.1 11.8-9.6 15-13 15-18.1 0-3.9-3.1-7-7-7-3.5 0-5.4 2.1-6.9 3.8L25 17.1l-1.1-1.3C22.4 14.1 20.5 12 17 12z'></path>"+
						"</svg>22"+
					"</div>"+
					"</div>"+
					"<div class='gitment-comment-body gitment-markdown'><p>"+
					comcent[i].evainfo+
					"</p></div>"+
					"</div>"+
					"</li>"
				)
					}
				},
				error:function (data) {}
			})
		});
		//时间格式的转换
		function renderTime(date) {
			var dateee = new Date(date).toJSON();
			return new Date(+new Date(dateee) + 8 * 3600 * 1000)
				.toISOString().replace(/T/g, ' ')
				.replace(/\.[\d]{3}Z/, '')
		}

		//用户评论产品包
		$("#pinglun").click(function(){
			// 用户id
			var uid=$("#uid").val();
			// 产品包id
			var productid=$("#productid").val();
			if(uid === undefined){
				layer.confirm('你还没登录是否登录',
					{icon: 2,
						title:'提示',
						offset:['100px','600px'],},
					function(index){
					window.location.href=path+"/user/login"
				});
			}else {
				//评论内容
				var evainfo=$("#comcent").val().trim();
				if(evainfo.length ===0 ){
					layer.alert("请输入内容",{
						icon: 6,
						offset: ['100px','600px']
					})
				}else {
					console.log(evainfo);
				$.ajax({
					type: 'post',
					url: path+"/HomePage/setEvaInfo",
					async:true,
					// dataType:"json",
					data:{
						"uid":uid,
						"evainfo":evainfo,
						"productid":productid
					},
					success:function (data) {
						if(data==='success'){
							console.log("aaaa");
							layer.msg("评论成功",{
								icon: 6,
								offset: ['100px','600px'],
								time: 3000,
								end: function () {
									//成功再查询评论数据
									$.ajax({
										type: 'post',
										url: path+"/HomePage/getEvaInfo",
										async:true,
										// dataType:"json",
										data:{"pid":productid},
										success:function (data) {
											console.log(data);
											var comcent=JSON.parse(data);
											$("#pinglist").empty();
											for (let i = 0; i <comcent.length ; i++) {
												var time=renderTime(comcent[i].evatime);
												//成功再查询评论数据
												$("#pinglist").append(
													"<li class='gitment-comment'>"+
													"<a class='gitment-comment-avatar'>"+
													"<img class='gitment-comment-avatar-img' src='"+path+"/"+comcent[i].uhead+"'>"+
													"</a>"+
													"<div class='gitment-comment-main'>"+
													"<div class='gitment-comment-header'>"+
													"<a class='gitment-comment-name'>"+comcent[i].uname+"</a>"+
													"<span style='margin-left: 20px'>"+time+"</span>"+
													"<div class='gitment-comment-like-btn'>"+
													"<svg class='gitment-heart-icon' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 50 50'>"+
													"<path d='M25 39.7l-.6-.5C11.5 28.7 8 25 8 19c0-5 4-9 9-9 4.1 0 6.4 2.3 8 4.1 1.6-1.8 3.9-4.1 8-4.1 5 0 9 4 9 9 0 6-3.5 9.7-16.4 20.2l-.6.5zM17 12c-3.9 0-7 3.1-7 7 0 5.1 3.2 8.5 15 18.1 11.8-9.6 15-13 15-18.1 0-3.9-3.1-7-7-7-3.5 0-5.4 2.1-6.9 3.8L25 17.1l-1.1-1.3C22.4 14.1 20.5 12 17 12z'></path>"+
													"</svg>22"+
													"</div>"+
													"</div>"+
													"<div class='gitment-comment-body gitment-markdown'><p>"+
													comcent[i].evainfo+
													"</p></div>"+
													"</div>"+
													"</li>"
												)
											}

										},
										error:function (data) {

										}



									})


								}

							})




						}else {
							layer.msg("评论失败",{
								icon:5,
								offset: ['100px','600px']
							})
						}
					},
					error:function (data) {

					}



				})



				}


			}

		})


	});




});

