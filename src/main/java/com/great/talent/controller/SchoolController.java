package com.great.talent.controller;

import com.google.gson.Gson;
import com.great.talent.entity.*;
import com.great.talent.service.SchoolService;
import com.great.talent.util.Diagis;
import com.great.talent.util.ResponseUtils;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * @author 小和
 * 高校端的控制类
 */
@Controller
@RequestMapping("/school")
public class SchoolController
{
	@Resource
	private SchoolService schoolService;
	@Resource
	private Diagis datagridResult;
	@Resource
	private Recomend recomend;
	@Resource
	private UserTalent userTalent;

	@RequestMapping("/login")
	public String Welcome(){
		return "schoolManage/ManageTalent";
	}


	@RequestMapping("/showTalent")
	public void showTalent(HttpServletRequest request, HttpServletResponse response){
		HashMap<String,Object> condition = new HashMap<>();
		String mindate=request.getParameter("mindate");
		String maxdate=request.getParameter("maxdate");
		String schoolname=request.getParameter("schoolname");
		String pro=request.getParameter("pro");
		String page = request.getParameter("page");
		String limit = request.getParameter("limit");
		if(null!=mindate&&!"".equals(mindate.trim())){
			condition.put("mindate",mindate);
		}
		if(null!=maxdate&&!"".equals(maxdate.trim())){
			condition.put("maxdate",maxdate);
		}
		if(null!=schoolname&&!"".equals(schoolname.trim())){
			condition.put("schoolname",schoolname);
		}
		if(null!=pro&&!"".equals(pro.trim())){
			condition.put("pro",pro);
		}
		int pageInt = Integer.valueOf(page);
		int limitInt = Integer.valueOf(limit);
		condition.put("pageInt",limitInt * (pageInt - 1));
		condition.put("limitInt",limitInt);
		int count=schoolService.findTalentCount(condition);
		datagridResult.setCode(0);
		datagridResult.setMsg("");
		datagridResult.setCount(count);
		List<UserTalent> userTalentList=schoolService.findTalent(condition);
		datagridResult.setData(userTalentList);
		System.out.println("表格数据==="+toJson(datagridResult));
		ResponseUtils.outJson1(response,toJson(datagridResult));

	}
	protected String toJson(Diagis datagridResult){
		Gson gson=new Gson();
		StringBuilder sb = new StringBuilder();
		sb.append("{\"code\":").append(datagridResult.getCode())
				.append(",\"msg\":\"").append(datagridResult.getMsg())
				.append("\",\"count\":").append(datagridResult.getCount())
				.append(",\"data\":[");
		if(datagridResult.getData().size()!=0){
			for(Object object : datagridResult.getData()){
				UserTalent user = (UserTalent) object;
				String sql=gson.toJson(user);
				//[{"id": user.getId(), "userName": user.getUserName()},{'id': user.getId(), 'userName': user.getUserName()}]
				sb.append(sql);
				sb.append(",");
			}
			sb.delete(sb.length() - 1, sb.length());
			sb.append("]}");
		}else{
			for(int i=0;i<7;i++){
				sb.delete(sb.length(),sb.length());
			}
			sb.append("]}");
		}

		return sb.toString();
	}
	//显示用户的简历
	@RequestMapping("/useResume")
	public String showResume(){
		System.out.println("1111===");
		return "schoolManage/UseResume";
	}
	//查找用户简历
	@RequestMapping("/findResume")
	public void findResume(HttpServletRequest request, HttpServletResponse response){
		String jsonStr=request.getParameter("uid");
		Gson g=new Gson();
		UserTalent userTalent=g.fromJson(jsonStr,UserTalent.class);
		Resume resume=schoolService.findUserResume(userTalent);
		List<Social> socials=schoolService.findUserSocial(userTalent);
		List<Aducational> aducationals=schoolService.findUserAducation(userTalent);
		System.out.println(resume+"="+socials+"-"+aducationals);
		request.getSession().setAttribute("resume",resume);
		request.getSession().setAttribute("socials",socials);
		request.getSession().setAttribute("aducationals",aducationals);


	}
	//显示高校简介页面
	@RequestMapping("/schoolInfo")
	public String showSchoolInfo(HttpServletRequest request){
		//这里需要获取登录高校账号的学校id
//		Admin admin= (Admin) request.getSession().getAttribute("admin");
//		admin.getSid();
		SchoolMsg schoolMsg=schoolService.findSchoolInfo(2);
		request.getSession().setAttribute("school",schoolMsg);

		return "schoolManage/IntroductionOfSchool";
	}
	//高校简介修改（图片上传）
	@RequestMapping("/updateSchoolInfo")
	public void updateSchoolInfo(@RequestParam("fileaot") MultipartFile fileaot, SchoolMsg schoolMsg, HttpServletRequest request,HttpServletResponse response){

		String schoolname=schoolMsg.getSchoolname().trim();
		String schoolinfo=schoolMsg.getSchoolinfo().trim();
		schoolMsg.setSchoolinfo(schoolinfo);
		schoolMsg.setSchoolname(schoolname);
		if(fileaot.getOriginalFilename()!=null&&!"".equals(fileaot.getOriginalFilename().trim())){
			String filename = null;
			// 设置上传图片的保存路径
			String savePath = request.getServletContext().getRealPath("/images");
			File file = new File(savePath);
			// 判断上传文件的保存目录是否存在
			if (!file.exists() && !file.isDirectory()) {
				System.out.println(savePath + "目录不存在，需要创建");
				// 创建目录
				file.mkdir();
			}
			DiskFileItemFactory factory = new DiskFileItemFactory();
			// 2、创建一个文件上传解析器
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setHeaderEncoding("UTF-8");
			// 3、判断提交上来的数据是否是上传表单的数据
			if (!ServletFileUpload.isMultipartContent(request)) {
				// 按照传统方式获取数据
				return;
			}
			try {
				// 報錯 需要過濾文件名稱 java.io.FileNotFoundException:
				// G:\测试02\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\FaceUp\WEB-INF\images\C:\Users\Ray\Pictures\2.jpeg
				// (文件名、目录名或卷标语法不正确。)

				filename = fileaot.getOriginalFilename();
				//				System.out.print(filename);
				if (fileaot.getOriginalFilename().split("\\.")[1].equals("png")
						|| fileaot.getOriginalFilename().split("\\.")[1].equals("jpg")
						|| fileaot.getOriginalFilename().split("\\.")[1].equals("jpeg")) {
					schoolMsg.setSchoolpic("images/"+fileaot.getOriginalFilename());
					InputStream in = fileaot.getInputStream();// 獲得上傳的輸入流
					FileOutputStream out = new FileOutputStream(savePath + "\\" + filename);// 指定web-inf目錄下的images文件
					request.setAttribute("path",  "images"+"\\" + filename);
					int len = 0;
					byte buffer[] = new byte[1024];
					while ((len = in.read(buffer)) > 0)// 每次讀取
					{
						out.write(buffer, 0, len);
					}
					in.close();
					out.close();
				} else {  //必须是图片才能上传否则失败
					ResponseUtils.outJson(response,"上传必须是图片");
					return ;
				}

			} catch (FileNotFoundException e)
			{
				e.printStackTrace();
			} catch (IOException e)
			{
				e.printStackTrace();
			}
		}
		//这里需要获取登录高校账号的学校id
		//		Admin admin= (Admin) request.getSession().getAttribute("admin");
		//		admin.getSid();
		schoolMsg.setSid(2);
		int i=schoolService.updateSchool(schoolMsg);
		if(i>0){
			ResponseUtils.outJson(response,"修改成功");
		}else{
			ResponseUtils.outJson(response,"修改失败");
		}

	}
	@RequestMapping("/showRecommend")
	public String showRecommend(){
		return "schoolManage/Recommend";
	}
	@RequestMapping("/recommendTalent")
	public void recommendTalent(HttpServletRequest request,HttpServletResponse response){
		HashMap<String,Object> condition = new HashMap<>();
		String positionname=request.getParameter("positionname");
		String indname=request.getParameter("indname");
		String page = request.getParameter("page");
		String limit = request.getParameter("limit");
		if(null!=positionname&&!"".equals(positionname.trim())){
			condition.put("positionname",positionname);
		}
		if(null!=indname&&!"".equals(indname.trim())){
			condition.put("indname",indname);
		}
		int pageInt = Integer.valueOf(page);
		int limitInt = Integer.valueOf(limit);
		condition.put("pageInt",limitInt * (pageInt - 1));
		condition.put("limitInt",limitInt);
		int count=schoolService.findRcommendCount(condition);
		datagridResult.setCode(0);
		datagridResult.setMsg("");
		datagridResult.setCount(count);
		List<Recommend> recommends=schoolService.findRcommend(condition);
		datagridResult.setData(recommends);
		ResponseUtils.outJson1(response,toJson1(datagridResult));
	}
	protected String toJson1(Diagis datagridResult){
		Gson gson=new Gson();
		StringBuilder sb = new StringBuilder();
		sb.append("{\"code\":").append(datagridResult.getCode())
				.append(",\"msg\":\"").append(datagridResult.getMsg())
				.append("\",\"count\":").append(datagridResult.getCount())
				.append(",\"data\":[");
		if(datagridResult.getData().size()!=0){
			for(Object object : datagridResult.getData()){
				Recommend recommend = (Recommend) object;
				String sql=gson.toJson(recommend);
				//[{"id": user.getId(), "userName": user.getUserName()},{'id': user.getId(), 'userName': user.getUserName()}]
				sb.append(sql);
				sb.append(",");
			}
			sb.delete(sb.length() - 1, sb.length());
			sb.append("]}");
		}else{
			for(int i=0;i<7;i++){
				sb.delete(sb.length(),sb.length());
			}
			sb.append("]}");
		}

		return sb.toString();
	}
	@RequestMapping("/findTalentByState")
	public void findTalentByState(HttpServletRequest request,HttpServletResponse response){
		//这里需要获取登录高校账号的学校id
		//		Admin admin= (Admin) request.getSession().getAttribute("admin");
		//		admin.getSid();
		HashMap<String,Object> condition = new HashMap<>();
		String mindate=request.getParameter("mindate");
		String maxdate=request.getParameter("maxdate");
		String schoolname=request.getParameter("schoolname");
		String pro=request.getParameter("pro");
		String page = request.getParameter("page");
		String limit = request.getParameter("limit");
		if(null!=mindate&&!"".equals(mindate.trim())){
			condition.put("mindate",mindate);
		}
		if(null!=maxdate&&!"".equals(maxdate.trim())){
			condition.put("maxdate",maxdate);
		}
		if(null!=schoolname&&!"".equals(schoolname.trim())){
			condition.put("schoolname",schoolname);
		}
		if(null!=pro&&!"".equals(pro.trim())){
			condition.put("pro",pro);
		}

		condition.put("sid",2);

		int pageInt = Integer.valueOf(page);
		int limitInt = Integer.valueOf(limit);
		condition.put("pageInt",limitInt * (pageInt - 1));
		condition.put("limitInt",limitInt);
		int count=schoolService.findTalentCount1(condition);
		datagridResult.setCode(0);
		datagridResult.setMsg("");
		datagridResult.setCount(count);
		List<UserTalent> userTalentList=schoolService.findTalent1(condition);
		datagridResult.setData(userTalentList);
		System.out.println("表格数据==="+toJson(datagridResult));
		ResponseUtils.outJson1(response,toJson(datagridResult));

	}
	@RequestMapping("/findTalentByState1")
	public String findTalentByState1(){
		return "schoolManage/RecommendTalent";
	}

	//给企业推荐人才
	@RequestMapping("/recommend")
	public void recommend( HttpServletRequest request,HttpServletResponse response){
		//这里需要获取登录高校账号的学校id
		//		Admin admin= (Admin) request.getSession().getAttribute("admin");
		//		admin.getSid();
		String[] ids=request.getParameterValues("ids");
		String cid=request.getParameter("cid");
		String positionid=request.getParameter("positionid");
		String uid="";
		recomend.setCid(Integer.valueOf(cid));
		recomend.setPositionid(Integer.valueOf(positionid));
		recomend.setRecommendtime(new Date());
		for (int i = 0; i <ids.length ; i++)
		{
			recomend.setUid(Integer.valueOf(ids[i]));
			schoolService.insertRecommend(recomend);
		}
		ResponseUtils.outJson(response,"推荐成功");
	}
	//用户端的简历显示
	@RequestMapping("/findUserResume")
	public String findUserResume(HttpServletRequest request){
//		User user= (User) request.getSession().getAttribute("user");
//		user.getUid();
		userTalent.setUid(1);
		Resume resume=schoolService.findUserResume(userTalent);
		List<Social> socials=schoolService.findUserSocial(userTalent);
		List<Aducational> aducationals=schoolService.findUserAducation(userTalent);
		System.out.println(resume+"="+socials+"-"+aducationals);
		request.getSession().setAttribute("resume",resume);
		request.getSession().setAttribute("socials",socials);
		request.getSession().setAttribute("aducationals",aducationals);
		return "schoolManage/User_Resume";
	}
	@RequestMapping("/updateResume")
	public void updateResume(@RequestParam("fileaot") MultipartFile fileaot,Resume resume,Social social,Aducational aducational, HttpServletRequest request,HttpServletResponse response){
		System.out.println("fileaot="+fileaot+"resume="+resume+"social="+social+"aducational="+aducational);




	}

}
