package com.great.talent.controller;

import com.google.gson.Gson;
import com.great.talent.entity.*;
import com.great.talent.service.UserService;
import com.great.talent.util.Diagis;
import com.great.talent.util.MD5Utils;
import com.great.talent.util.PhoneCode;
import com.great.talent.util.ResponseUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController
{
	Gson g = new Gson();
	private String vcode;

	@Resource
	private UserService userService;
    //用户登录页面
	@RequestMapping("/login")
	public String Welcome(){
		return "user/login";
	}
	//首页页面
	@RequestMapping("/index")
	public String Index(){
		return "homepage/index";
	}
	//用户注册页面
	@RequestMapping("/registered")
	public String Registered(){ return "user/userRegistered"; }
	//用户协议页面
	@RequestMapping("/registeragreement")
	public String Registeragreement(){ return "user/registeragreement"; }
	//找回密码页面
	@RequestMapping("/rpassword")
	public String rpassword(){
		return "user/retrievePassword_1";
	}
	//找回密码页面2
	@RequestMapping("/rpassword2")
	public String rpassword2(){
		return "user/retrievePassword_2";
	}
	//找回密码页面3
	@RequestMapping("/rpassword3")
	public String rpassword3(){
		return "user/retrievePassword_3";
	}
	//找回密码页面4
	@RequestMapping("/rpassword4")
	public String rpassword4(){ return "user/retrievePassword_4"; }
	//个人中心页面
	@RequestMapping("/personal")
	public String personal(HttpServletRequest request){
		String str1 = (String) request.getSession().getAttribute("uaccount");//用户名
		if(null!=str1){
		    return "user/personal";
		}else {
			return "user/login";
		}
	}
	//个人中心-修改密码
	@RequestMapping("/updatepsd")
	public String updatepsd(HttpServletRequest request){
		String str1 = (String) request.getSession().getAttribute("uaccount");//用户名
		if(null!=str1){
			return "user/personal_updatepsd";
		}else {
			return "user/login";
		}
	}
	//个人中心-修改手机号
	@RequestMapping("/updatenum")
	public String updatenum(HttpServletRequest request){
		String str1 = (String) request.getSession().getAttribute("uaccount");//用户名
		if(null!=str1){
			return "user/personal_updatenum";
		}else {
			return "user/login";
		}
	}
	//个人中心-修改手机号2
	@RequestMapping("/updateComplete")
	public String updateComplete(HttpServletRequest request){
		String str1 = (String) request.getSession().getAttribute("uaccount");//用户名
		if(null!=str1){
			return "user/personal_updatenum2";
		}else {
			return "user/login";
		}
	}
	//个人中心-我的收藏
	@RequestMapping("/collection")
	public String collection(HttpServletRequest request){
		String str1 = (String) request.getSession().getAttribute("uaccount");//用户名
		if(null!=str1){
			return "user/personal_collection";
		}else {
			return "user/login";
		}
	}
	//个人中心-学习记录
	@RequestMapping("/study")
	public String study(HttpServletRequest request)throws ParseException{
		String str1 = (String) request.getSession().getAttribute("uaccount");//用户名
		if(null!=str1){
			int uid = userService.findUserIdByUaccount(str1);
			List<MyStudy> list = userService.findMyStudy(uid);
			for (int i=0;i<list.size();i++){
				SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String sDate=sdf2.format(list.get(i).getStudytime());
				list.get(i).setStudytime2(sDate);
			}
			request.getSession().setAttribute("myStudy",list);
			return "user/personal_study";
		}else {
			return "user/login";
		}
	}
	//个人中心-求职反馈
	@RequestMapping("/requestFeedback")
	public String requestFeedback(HttpServletRequest request){
		String str1 = (String) request.getSession().getAttribute("uaccount");//用户名
		if(null!=str1){
			return "user/personal_requestFeedback";
		}else {
			return "user/login";
		}
	}
	//找工作-岗位详情
	@RequestMapping("/jobDetails")
	public String jobDetails(HttpServletRequest request){
		JobData jobData = (JobData) request.getSession().getAttribute("jobData");//用户名
		if (null!=jobData){
		    return "user/job_details";
		}else {
			return "homepage/searchJob";
		}
	}
	//个人中心-帮助中心
	@RequestMapping("/help")
	public String help(HttpServletRequest request){
		String str1 = (String) request.getSession().getAttribute("uaccount");//用户名
		if(null!=str1){
			return "user/personal_help";
		}else {
			return "user/login";
		}
	}
	//用户登陆
	@RequestMapping("/userLogin")
	@ResponseBody
	public void userLogin(HttpServletRequest request, HttpServletResponse response)throws IOException{
		response.setContentType("text/text;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		String msg = request.getParameter("User");
		User user = g.fromJson(msg,User.class);
		String test = user.getTest();
		if (null!=test&&vcode.equalsIgnoreCase(test)){
			String userPassword = MD5Utils.md5(user.getUpassword());
			user.setUpassword(userPassword);
		    User user1 = userService.login(user);
		    if (null != user1){
		    	if (user1.getUstate().equals("启用")){
				    response.getWriter().print("1111");
				    request.getSession().setAttribute("uid",user1.getUid());
				    request.getSession().setAttribute("uname", user1.getUname());
				    request.getSession().setAttribute("uaccount",user1.getUaccount());
				    request.getSession().setAttribute("usex",user1.getUsex());
				    request.getSession().setAttribute("utel",user1.getUtel());
				    request.getSession().setAttribute("uaddress",user1.getUaddress());
				    request.getSession().setAttribute("uscore",user1.getUscore());
				    request.getSession().setAttribute("uhead",user1.getUhead());
				    request.getSession().setAttribute("uage",user1.getUage());
			    }else {
				    response.getWriter().print("stateError");
			    }
		    }else {
			    response.getWriter().print("userError");
		    }
		}else {
			response.getWriter().print("testError");
		}


	}
	//验证码
	@RequestMapping("/loginCode")
	public void cherkCode(HttpServletRequest request, HttpServletResponse response) {
		try {
			int width = 60;
			int height = 30;
			String data = "QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm0123456789";    //随机字符字典，其中0，o，1，I 等难辨别的字符最好不要
			Random random = new Random();//随机类
			//1 创建图片数据缓存区域（核心类）
			BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);//创建一个彩色的图片
			//2 获得画板(图片，ps图层)，绘画对象。
			Graphics g = image.getGraphics();
			//3 选择颜色，画矩形3，4步是画一个有内外边框的效果
			g.setColor(Color.BLACK);
			g.fillRect(0, 0, width, height);
			//4白色矩形
			g.setColor(Color.WHITE);
			g.fillRect(1, 1, width - 2, height - 2);
			/**1 提供缓存区域，为了存放4个随机字符，以便存入session */
			StringBuilder builder = new StringBuilder();
			//5 随机生成4个字符
			//设置字体颜色
			g.setFont(new Font("宋体", Font.BOLD & Font.ITALIC, 20));
			for (int i = 0; i < 4; i++) {
				//随机颜色
				g.setColor(new Color(random.nextInt(255), random.nextInt(255), random.nextInt(255)));
				//随机字符
				int index = random.nextInt(data.length());
				String str = data.substring(index, index + 1);
				/**2 缓存*/
				builder.append(str);
				//写入
				g.drawString(str, (width / 6) * (i + 1), 20);
			}
			//给图中绘制噪音点，让图片不那么好辨别
			for (int j = 0, n = random.nextInt(100); j < n; j++) {
				g.setColor(Color.RED);
				g.fillRect(random.nextInt(width), random.nextInt(height), 1, 1);//随机噪音点
			}
			/**3 获得随机数据，并保存session*/
			vcode = builder.toString();
			request.getSession().setAttribute("vcode", vcode);
			//.. 生成图片发送到浏览器 --相当于下载
			ImageIO.write(image, "jpg", response.getOutputStream());
			response.getOutputStream().flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	//用户注册
	@RequestMapping("/userReg")
	@ResponseBody
	public void userReg(HttpServletRequest request, HttpServletResponse response)throws IOException{
		response.setContentType("text/text;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		String msg = request.getParameter("User");
		User user = g.fromJson(msg,User.class);
		String userPassword = MD5Utils.md5(user.getUpassword());
		user.setUpassword(userPassword);
		user.setUname(user.getUaccount());
		user.setUstate("启用");
		user.setUdate(new Date());
		String uaccount = user.getUaccount();
		Integer uaccount1 = userService.userNameCheck(uaccount);
		if (uaccount1==0){
			Boolean flag = userService.addUser(user);
			if (flag){
				response.getWriter().print("1111");
			}else {
				response.getWriter().print("error");
			}
		}else {
			response.getWriter().print("UserAlreadyExists");
		}
	}
	//根据用户名查用户手机号
	@RequestMapping("/findPhoneByAccount")
	@ResponseBody
	public void findPhoneByAccount(HttpServletRequest request, HttpServletResponse response)throws IOException{
		response.setContentType("text/text;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		String uaccount = request.getParameter("username");
		String test = request.getParameter("test");
		if (vcode.equalsIgnoreCase(test)){
			String utel = userService.findPhoneByAccount(uaccount);
			if (null!=utel){
//				String phone = utel; //发送短信验证码
//				PhoneCode.getPhonemsg(phone);
				response.getWriter().print("1111");
				request.getSession().setAttribute("retrieveName",uaccount);
				request.getSession().setAttribute("retrievePhone",utel);
			}else {
				response.getWriter().print("error");
			}
		}else {
			response.getWriter().print("testError");
		}
	}
    //获取短信验证码
	@RequestMapping("/sendMsg")
	@ResponseBody
	public void sendMsg(HttpServletRequest request, HttpServletResponse response)throws IOException{
		response.setContentType("text/text;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		String phone = request.getParameter("utel"); //发送短信验证码
		PhoneCode.getPhonemsg(phone);
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(PhoneCode.code);
	}
	//找回-新密码修改
	@RequestMapping("/updatePwd")
	@ResponseBody
	public void updatePwd(HttpServletRequest request, HttpServletResponse response)throws IOException{
		response.setContentType("text/text;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		String uaccount = request.getParameter("retrieveName");
		String upassword = MD5Utils.md5(request.getParameter("newPwd"));
		User user = new User();
		user.setUpassword(upassword);
		user.setUaccount(uaccount);
		Boolean flag = userService.updateUser(user);
		if (flag){
			response.getWriter().print("1111");
		}else {
			response.getWriter().print("error");
		}
	}
	//个人中心-个人信息修改
	@RequestMapping("/updatePersonal")
	@ResponseBody
	public void updatePersonal(HttpServletRequest request, HttpServletResponse response)throws IOException{
		response.setContentType("text/text;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		String str = request.getParameter("userTAT");
		User user = g.fromJson(str,User.class);
		String str1 = (String) request.getSession().getAttribute("uaccount");
		user.setUaccount(str1);
		Boolean flag = userService.updatePersonal(user);
		if (flag){
			response.getWriter().print("1111");
			request.getSession().setAttribute("uname",user.getUname());
			request.getSession().setAttribute("usex",user.getUsex());
			request.getSession().setAttribute("uage",user.getUage());
			request.getSession().setAttribute("uaddress",user.getUaddress());
		}else {
			response.getWriter().print("error");
		}
	}
	//个人中心-密码修改
	@RequestMapping("/updatePsd")
	@ResponseBody
	public void updatePsd(HttpServletRequest request, HttpServletResponse response)throws IOException{
		response.setContentType("text/text;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		String upsd = MD5Utils.md5(request.getParameter("upsd"));//原密码
		String cpsd = MD5Utils.md5(request.getParameter("cpsd"));//新密码
		String str1 = (String) request.getSession().getAttribute("uaccount");//用户名
		User user = new User();
		user.setUpassword(upsd);
		user.setUaccount(str1);
		User checkUser = userService.login(user);
		if (null!=checkUser){
			user.setUpassword(cpsd);
			Boolean flag = userService.updateUser(user);
			if (flag){
				response.getWriter().print("1111");
			}else {
				response.getWriter().print("error");
			}
		}else {
			response.getWriter().print("upsdError");
		}

	}
	//个人中心-手机号修改
	@RequestMapping("/updatePhone")
	@ResponseBody
	public void updatePhone(HttpServletRequest request, HttpServletResponse response)throws IOException{
		response.setContentType("text/text;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		String utel = request.getParameter("utel");//新手机号
		String str1 = (String) request.getSession().getAttribute("uaccount");//用户名
		User user = new User();
		user.setUtel(utel);
		user.setUaccount(str1);
		Boolean flag = userService.updatePhone(user);
		if (flag){
			response.getWriter().print("1111");
			request.getSession().setAttribute("utel",utel);
		}else {
			response.getWriter().print("error");
		}
	}
    //个人中心-头像修改
	@RequestMapping("/uheadUpLoad")
	@ResponseBody
	public void uheadUpLoad(@RequestParam("file") MultipartFile file, HttpServletRequest request, HttpServletResponse response)throws IOException {
		response.setContentType("text/text;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		if (file.getOriginalFilename()!=null&&!"".equals(file.getOriginalFilename().trim()))
		{
			String str1 = (String) request.getSession().getAttribute("uaccount");//用户名
			String filename = file.getOriginalFilename(); //是得到上传时的文件名
			String savePath = request.getSession().getServletContext().getRealPath("/images");
			String projectPath = savePath + "\\" + filename;
			file.transferTo(new File(projectPath));//文件存放位置
			User user = new User();
			user.setUaccount(str1);
			user.setUhead("images/"+filename);
			Boolean flag = userService.uheadUpLoad(user);
			if (flag){
				ResponseUtils.outHtml(response, "{\"code\":0, \"msg\":\"\", \"data\":{}}");
				request.getSession().setAttribute("uhead",user.getUhead());
			}else {
				ResponseUtils.outHtml(response, "{\"code\":1, \"msg\":\"\", \"data\":{}}");
			}
		}else {
			ResponseUtils.outHtml(response, "{\"code\":3, \"msg\":\"\", \"data\":{}}");
		}
	}
	//个人中心-我的收藏
	@RequestMapping("/myCollection")
	@ResponseBody
	public Diagis myCollection(HttpServletRequest request, HttpServletResponse response)throws IOException {
		response.setContentType("text/text;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		int page= Integer.parseInt(request.getParameter("page"));
		int limit= Integer.parseInt(request.getParameter("limit"));
		String indname= request.getParameter("indname");
		String positionname =request.getParameter("positionname");
		String str1 = (String) request.getSession().getAttribute("uaccount");//用户名
		int uid = userService.findUserIdByUaccount(str1);
		Map<String,Object> map = new LinkedHashMap<>();
		int minLimit = (page-1)*limit;
		int maxLimit = limit;
		map.put("uid",uid);
		if (null!=indname && !"".equals(indname)){
			map.put("indname","%"+indname+"%");
		}
		if (null!=positionname && !"".equals(positionname)){
			map.put("positionname","%"+positionname+"%");
		}
		map.put("minLimit",minLimit);
		map.put("maxLimit",maxLimit);
		List<MyCollection> list=userService.findMyCollection(map);
		Integer a = userService.findMyCollectionCount(map);
		if (null!=list){
			Diagis diagis = new Diagis();
			diagis.setData(list);
			diagis.setCode(0);
			diagis.setCount(a);//总条数
			return diagis;
		}
		return null;
	}
	//个人中心-求职反馈
	@RequestMapping("/myRequestFeedback")
	@ResponseBody
	public Diagis myRequestFeedback(HttpServletRequest request, HttpServletResponse response)throws IOException {
		response.setContentType("text/text;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		int page= Integer.parseInt(request.getParameter("page"));
		int limit= Integer.parseInt(request.getParameter("limit"));
		String indname= request.getParameter("indname");
		String positionname =request.getParameter("positionname");
		String str1 = (String) request.getSession().getAttribute("uaccount");//用户名
		int uid = userService.findUserIdByUaccount(str1);
		Map<String,Object> map = new LinkedHashMap<>();
		int minLimit = (page-1)*limit;
		int maxLimit = limit;
		map.put("uid",uid);
		if (null!=indname && !"".equals(indname)){
			map.put("indname","%"+indname+"%");
		}
		if (null!=positionname && !"".equals(positionname)){
			map.put("positionname","%"+positionname+"%");
		}
		map.put("minLimit",minLimit);
		map.put("maxLimit",maxLimit);
		List<RequestFeedback> list=userService.findRequestFeedback(map);
		Integer a = userService.findRequestFeedbackCount(map);
		if (null!=list){
			Diagis diagis = new Diagis();
			diagis.setData(list);
			diagis.setCode(0);
			diagis.setCount(a);//总条数
			return diagis;
		}
		return null;
	}
	//找工作-岗位详情
	@RequestMapping("/checkJob")
	@ResponseBody
	public void checkJob(HttpServletRequest request, HttpServletResponse response)throws IOException,ParseException {
		response.setContentType("text/text;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		String indname = request.getParameter("indname");
		String companyname = request.getParameter("companyname");
		String positionname = request.getParameter("positionname");
		String positiontime1 = request.getParameter("positiontime");
		System.out.print("时间："+positiontime1);
		System.out.print("行业："+indname);
		System.out.print("公司："+companyname);
		System.out.print("岗位："+positionname);
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZZZ");
//		Date date = sdf.parse(positiontime1);
		SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date positiontime = sdf2.parse(positiontime1);
		JobData jobData1 = new JobData();
		jobData1.setPositiontime(positiontime);
		jobData1.setPositionname(positionname);
		jobData1.setCompanyname(companyname);
		jobData1.setIndname(indname);
		JobData jobData = userService.checkJob(jobData1);
		Map<String,Object> map = new LinkedHashMap<>();
		map.put("positionid",jobData.getPositionid());
		List<Welfare> list= userService.findWelfare(map);
		if (null!=jobData&&!"".equals(jobData)){
			response.getWriter().print("1111");
			request.getSession().setAttribute("jobData",jobData);
			request.getSession().setAttribute("welfare",list);
		}else {
			response.getWriter().print("error");
		}
	}
	//找工作-岗位申请
	@RequestMapping("/jobApplication")
	@ResponseBody
	public void jobApplication(HttpServletRequest request, HttpServletResponse response)throws IOException {
		response.setContentType("text/text;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		String positionid1 = request.getParameter("positionid");
		Integer positionid = Integer.parseInt(positionid1);
		int uid = (int) request.getSession().getAttribute("uid");//用户名
		if (uid>0){
			int sid = userService.findSidByUid(uid);
			Date intertime = new Date();
			if (sid>0){
				Interview interview = new Interview();
				interview.setUid(uid);
				interview.setSid(sid);
				interview.setIntertime(intertime);
				interview.setPositionid(positionid);
				Interview checkInterview = userService.checkInterview(interview);
				if (null==checkInterview){
					Boolean flag = userService.jobApplication(interview);
					if (flag){
						response.getWriter().print("1111");
					}else {
						response.getWriter().print("error");
					}
				}else {
					response.getWriter().print("2222");
				}
			}else {
				response.getWriter().print("notResume");
			}

		}else {
			response.getWriter().print("notLogin");
		}
	}
	//找工作-岗位收藏
	@RequestMapping("/addCollection")
	@ResponseBody
	public void addCollection(HttpServletRequest request, HttpServletResponse response)throws IOException {
		response.setContentType("text/text;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		String positionid1 = request.getParameter("positionid");
		Integer positionid = Integer.parseInt(positionid1);
		int uid = (int) request.getSession().getAttribute("uid");//用户名
		if (uid>0){
			MyCollection myCollection1 = new MyCollection();
			myCollection1.setUid(uid);
			myCollection1.setPositionid(positionid);
			MyCollection myCollection = userService.checkCollection(myCollection1);
			if (null==myCollection){
				Boolean flag = userService.addCollection(myCollection);
				if (flag){
					response.getWriter().print("1111");
				}else {
					response.getWriter().print("error");
				}
			}else {
				response.getWriter().print("2222");
			}
		}else {
			response.getWriter().print("notLogin");
		}
	}
}
