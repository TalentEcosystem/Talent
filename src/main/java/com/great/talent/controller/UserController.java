package com.great.talent.controller;

import com.google.gson.Gson;
import com.great.talent.entity.User;
import com.great.talent.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Date;
import java.util.Random;

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

	@RequestMapping("/userLogin")
	@ResponseBody
	public void userLogin(HttpServletRequest request, HttpServletResponse response)throws IOException{
		String msg = request.getParameter("User");
		User user = g.fromJson(msg,User.class);
		String test = user.getTest();
		if (vcode.equalsIgnoreCase(test)){
		    User user1 = userService.login(user);
		    if (null != user1){
		    	if (user1.getUstate().equals("启用")){
				    response.getWriter().print("success");
				    request.getSession().setAttribute("uname", user1.getUname());
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

	@RequestMapping("/userReg")
	@ResponseBody
	public void userReg(HttpServletRequest request, HttpServletResponse response)throws IOException{
		String msg = request.getParameter("User");
		User user = g.fromJson(msg,User.class);
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


}
