package com.great.talent.controller;

import com.google.gson.Gson;
import com.great.talent.entity.*;
import com.great.talent.service.SchoolService;
import com.great.talent.util.Diagis;
import com.great.talent.util.ResponseUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.util.ClassUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
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

	@RequestMapping("/updateSchoolInfo")
	public void updateSchoolInfo(@RequestParam("fileaot") MultipartFile fileaot, SchoolMsg schoolMsg, HttpServletRequest request,HttpServletResponse response){
		//这里需要获取登录高校账号的学校id
		//		Admin admin= (Admin) request.getSession().getAttribute("admin");
		//		admin.getSid();
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
		schoolMsg.setSid(2);
		int i=schoolService.updateSchool(schoolMsg);
		if(i>0){
			ResponseUtils.outJson(response,"修改成功");
		}else{
			ResponseUtils.outJson(response,"修改失败");
		}





	}




}
