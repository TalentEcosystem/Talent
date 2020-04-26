package com.great.talent.controller;

import com.google.gson.Gson;
import com.great.talent.entity.*;
import com.great.talent.service.SchoolService;
import com.great.talent.util.*;
import com.sun.net.httpserver.HttpHandler;
import net.lingala.zip4j.core.ZipFile;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import sun.misc.BASE64Encoder;
import sun.misc.BASE64Encoder;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.*;
import java.net.URLEncoder;
import java.util.*;

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
	@Resource
	private Social social1, social2;
	@Resource
	private Aducational aducational1, aducational2;
	@Resource
	private Interview interview;
	@Resource
	private Resume resume;



	@RequestMapping("/findTalent")
	public String Welcome()
	{
		return "schoolManage/ManageTalent";
	}


	@RequestMapping("/showTalent")
	public void showTalent(HttpServletRequest request, HttpServletResponse response)
	{
		HashMap<String, Object> condition = new HashMap<>();
		String mindate = request.getParameter("mindate");
		String maxdate = request.getParameter("maxdate");
		String schoolname = request.getParameter("schoolname");
		String pro = request.getParameter("pro");
		String page = request.getParameter("page");
		String limit = request.getParameter("limit");
		if (null != mindate && !"".equals(mindate.trim()))
		{
			condition.put("mindate", mindate);
		}
		if (null != maxdate && !"".equals(maxdate.trim()))
		{
			condition.put("maxdate", maxdate);
		}
		if (null != schoolname && !"".equals(schoolname.trim()))
		{
			condition.put("schoolname", schoolname);
		}
		if (null != pro && !"".equals(pro.trim()))
		{
			condition.put("pro", pro);
		}
		int pageInt = Integer.valueOf(page);
		int limitInt = Integer.valueOf(limit);
		request.getSession().setAttribute("pageInt",pageInt);
		request.getSession().setAttribute("limitInt",limitInt);
		condition.put("pageInt", limitInt * (pageInt - 1));
		condition.put("limitInt", limitInt);
		int count = schoolService.findTalentCount(condition);
		datagridResult.setCode(0);
		datagridResult.setMsg("");
		datagridResult.setCount(count);
		List<UserTalent> userTalentList = schoolService.findTalent(condition);
		datagridResult.setData(userTalentList);
		System.out.println("表格数据===" + toJson(datagridResult));
		ResponseUtils.outJson1(response, toJson(datagridResult));

	}

	protected String toJson(Diagis datagridResult)
	{
		Gson gson = new Gson();
		StringBuilder sb = new StringBuilder();
		sb.append("{\"code\":").append(datagridResult.getCode()).append(",\"msg\":\"").append(datagridResult.getMsg()).append("\",\"count\":").append(datagridResult.getCount()).append(",\"data\":[");
		if (datagridResult.getData().size() != 0)
		{
			for (Object object : datagridResult.getData())
			{
				UserTalent user = (UserTalent) object;
				String sql = gson.toJson(user);
				//[{"id": user.getId(), "userName": user.getUserName()},{'id': user.getId(), 'userName': user.getUserName()}]
				sb.append(sql);
				sb.append(",");
			}
			sb.delete(sb.length() - 1, sb.length());
			sb.append("]}");
		} else
		{
			for (int i = 0; i < 7; i++)
			{
				sb.delete(sb.length(), sb.length());
			}
			sb.append("]}");
		}

		return sb.toString();
	}

	//显示用户的简历
	@RequestMapping("/useResume")
	public String showResume()
	{
		System.out.println("1111===");
		return "schoolManage/UseResume";
	}

	//查找用户简历
	@RequestMapping("/findResume")
	public void findResume(HttpServletRequest request, HttpServletResponse response)
	{
		String jsonStr = request.getParameter("uid");
		Gson g = new Gson();
		UserTalent userTalent = g.fromJson(jsonStr, UserTalent.class);
		Resume resume = schoolService.findUserResume(userTalent);
		List<Social> socials = schoolService.findUserSocial(userTalent);
		List<Aducational> aducationals = schoolService.findUserAducation(userTalent);
		System.out.println(resume + "=" + socials + "-" + aducationals);
		ResponseUtils.outJson1(response, g.toJson(resume) + "%" + g.toJson(socials) + "%" + g.toJson(aducationals));

	}

	//显示高校简介页面
	@RequestMapping("/schoolInfo")
	public String showSchoolInfo(HttpServletRequest request)
	{
		//这里需要获取登录高校账号的学校id
		Admin admin = (Admin) request.getSession().getAttribute("admin");

		SchoolMsg schoolMsg = schoolService.findSchoolInfo(admin.getSid());
		request.getSession().setAttribute("school", schoolMsg);

		return "schoolManage/IntroductionOfSchool";
	}

	//高校简介修改（图片上传）
	@RequestMapping("/updateSchoolInfo")
	public void updateSchoolInfo(@RequestParam("fileaot") MultipartFile fileaot, SchoolMsg schoolMsg, HttpServletRequest request, HttpServletResponse response)
	{

		String schoolname = schoolMsg.getSchoolname().trim();
		String schoolinfo = schoolMsg.getSchoolinfo().trim();
		schoolMsg.setSchoolinfo(schoolinfo);
		schoolMsg.setSchoolname(schoolname);
		if (fileaot.getOriginalFilename() != null && !"".equals(fileaot.getOriginalFilename().trim()))
		{
			String filename = null;
			// 设置上传图片的保存路径
			String savePath = request.getServletContext().getRealPath("/images/");
			File file = new File(savePath);
			// 判断上传文件的保存目录是否存在
			if (!file.exists() && !file.isDirectory())
			{
				System.out.println(savePath + "目录不存在，需要创建");
				// 创建目录
				file.mkdir();
			}
			DiskFileItemFactory factory = new DiskFileItemFactory();
			// 2、创建一个文件上传解析器
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setHeaderEncoding("UTF-8");
			// 3、判断提交上来的数据是否是上传表单的数据
			if (!ServletFileUpload.isMultipartContent(request))
			{
				// 按照传统方式获取数据
				return;
			}
			try
			{
				// 報錯 需要過濾文件名稱 java.io.FileNotFoundException:
				// G:\测试02\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\FaceUp\WEB-INF\images\C:\Users\Ray\Pictures\2.jpeg
				// (文件名、目录名或卷标语法不正确。)

				filename = fileaot.getOriginalFilename();
				//				System.out.print(filename);
				if (fileaot.getOriginalFilename().split("\\.")[1].equals("png") || fileaot.getOriginalFilename().split("\\.")[1].equals("jpg") || fileaot.getOriginalFilename().split("\\.")[1].equals("jpeg"))
				{
					schoolMsg.setSchoolpic("images/" + fileaot.getOriginalFilename());
					InputStream in = fileaot.getInputStream();// 獲得上傳的輸入流
					FileOutputStream out = new FileOutputStream(savePath + filename);// 指定web-inf目錄下的images文件
					request.setAttribute("path", "images" + "/" + filename);
					int len = 0;
					byte buffer[] = new byte[1024];
					while ((len = in.read(buffer)) > 0)// 每次讀取
					{
						out.write(buffer, 0, len);
					}
					in.close();
					out.close();
				} else
				{  //必须是图片才能上传否则失败
					ResponseUtils.outJson(response, "上传必须是图片");
					return;
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
				Admin admin= (Admin) request.getSession().getAttribute("admin");
//				admin.getSid();
		schoolMsg.setSid(admin.getSid());
		int i = schoolService.updateSchool(schoolMsg);
		if (i > 0)
		{
			ResponseUtils.outJson(response, "修改成功");
		} else
		{
			ResponseUtils.outJson(response, "修改失败");
		}

	}

	@RequestMapping("/showRecommend")
	public String showRecommend()
	{
		return "schoolManage/Recommend";
	}

	@RequestMapping("/recommendTalent")
	public void recommendTalent(HttpServletRequest request, HttpServletResponse response)
	{
		HashMap<String, Object> condition = new HashMap<>();
		String positionname = request.getParameter("positionname");
		String indname = request.getParameter("indname");
		String page = request.getParameter("page");
		String limit = request.getParameter("limit");
		if (null != positionname && !"".equals(positionname.trim()))
		{
			condition.put("positionname", positionname);
		}
		if (null != indname && !"".equals(indname.trim()))
		{
			condition.put("indname", indname);
		}
		int pageInt = Integer.valueOf(page);
		int limitInt = Integer.valueOf(limit);
		condition.put("pageInt", limitInt * (pageInt - 1));
		condition.put("limitInt", limitInt);
		int count = schoolService.findRcommendCount(condition);
		datagridResult.setCode(0);
		datagridResult.setMsg("");
		datagridResult.setCount(count);
		List<Recommend> recommends = schoolService.findRcommend(condition);
		datagridResult.setData(recommends);
		ResponseUtils.outJson1(response, toJson1(datagridResult));
	}

	protected String toJson1(Diagis datagridResult)
	{
		Gson gson = new Gson();
		StringBuilder sb = new StringBuilder();
		sb.append("{\"code\":").append(datagridResult.getCode()).append(",\"msg\":\"").append(datagridResult.getMsg()).append("\",\"count\":").append(datagridResult.getCount()).append(",\"data\":[");
		if (datagridResult.getData().size() != 0)
		{
			for (Object object : datagridResult.getData())
			{
				Recommend recommend = (Recommend) object;
				String sql = gson.toJson(recommend);
				//[{"id": user.getId(), "userName": user.getUserName()},{'id': user.getId(), 'userName': user.getUserName()}]
				sb.append(sql);
				sb.append(",");
			}
			sb.delete(sb.length() - 1, sb.length());
			sb.append("]}");
		} else
		{
			for (int i = 0; i < 7; i++)
			{
				sb.delete(sb.length(), sb.length());
			}
			sb.append("]}");
		}

		return sb.toString();
	}

	@RequestMapping("/findTalentByState")
	public void findTalentByState(HttpServletRequest request, HttpServletResponse response)
	{
		//这里需要获取登录高校账号的学校id
		Admin admin = (Admin) request.getSession().getAttribute("admin");

		HashMap<String, Object> condition = new HashMap<>();
		String mindate = request.getParameter("mindate");
		String maxdate = request.getParameter("maxdate");
		String schoolname = request.getParameter("schoolname");
		String pro = request.getParameter("pro");
		String page = request.getParameter("page");
		String limit = request.getParameter("limit");
		if (null != mindate && !"".equals(mindate.trim()))
		{
			condition.put("mindate", mindate);
		}
		if (null != maxdate && !"".equals(maxdate.trim()))
		{
			condition.put("maxdate", maxdate);
		}
		if (null != schoolname && !"".equals(schoolname.trim()))
		{
			condition.put("schoolname", schoolname);
		}
		if (null != pro && !"".equals(pro.trim()))
		{
			condition.put("pro", pro);
		}
		System.out.println(admin);
		//这个要改
		condition.put("sid", admin.getSid());

		int pageInt = Integer.valueOf(page);
		int limitInt = Integer.valueOf(limit);
		condition.put("pageInt", limitInt * (pageInt - 1));
		condition.put("limitInt", limitInt);
		int count = schoolService.findTalentCount1(condition);
		datagridResult.setCode(0);
		datagridResult.setMsg("");
		datagridResult.setCount(count);
		List<UserTalent> userTalentList = schoolService.findTalent1(condition);
		datagridResult.setData(userTalentList);
		System.out.println("表格数据===" + toJson(datagridResult));
		ResponseUtils.outJson1(response,toJson(datagridResult));

	}

	@RequestMapping("/findTalentByState1")
	public String findTalentByState1()
	{
		return "schoolManage/RecommendTalent";
	}

	//给企业推荐人才
	@RequestMapping("/recommend")
	public void recommend(HttpServletRequest request, HttpServletResponse response)
	{
		//这里需要获取登录高校账号的学校id
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		String[] ids = request.getParameterValues("ids");
		String cid = request.getParameter("cid");
		String positionid = request.getParameter("positionid");
		recomend.setSid(admin.getSid());
		recomend.setCid(Integer.valueOf(cid));
		recomend.setPositionid(Integer.valueOf(positionid));
		recomend.setRecommendtime(new Date());
		recomend.setPresenter(schoolService.findSchoolnameBySid(admin.getSid()));
		for (int i = 0; i < ids.length; i++)
		{
			recomend.setUid(Integer.valueOf(ids[i]));
			schoolService.insertRecommend(recomend);
			//还要插入面试表
			interview.setUid(Integer.valueOf(ids[i]));
			interview.setPositionid(Integer.valueOf(positionid));
			interview.setIntertime(new Date());
			schoolService.userInsertInterview(interview);
		}
		ResponseUtils.outJson(response, "推荐成功");
	}

	//用户端的简历显示
	@RequestMapping("/findUserResume")
	public String findUserResume(HttpServletRequest request)
	{
		int uid = (Integer)request.getSession().getAttribute("uid");
//		user.getUid();
		userTalent.setUid(uid);
		Resume resume = schoolService.findUserResume(userTalent);
		List<Social> socials = schoolService.findUserSocial(userTalent);
		List<Aducational> aducationals = schoolService.findUserAducation(userTalent);
		System.out.println(resume + "=" + socials + "-" + aducationals);
		request.getSession().setAttribute("resume", resume);
		request.getSession().setAttribute("socials", socials);
		request.getSession().setAttribute("aducationals", aducationals);
		return "schoolManage/User_Resume";
	}

	@RequestMapping("/updateResume")
	public void updateResume(@RequestParam("file")MultipartFile fileaot, Resume resume, Social social, Aducational aducational, HttpServletRequest request, HttpServletResponse response)
	{
//		User user = (User) request.getSession().getAttribute("user");
		int uid = (Integer)request.getSession().getAttribute("uid");
		List<Social> social3 = (List<Social>) request.getSession().getAttribute("socials");
		List<Aducational> aducational3 = (List<Aducational>) request.getSession().getAttribute("aducationals");
		System.out.println("resume=" + resume);
		System.out.println("social=" + social + "aducational=" + aducational);
		System.out.println(social.getCompany().split(",")[0]);
		System.out.println(aducational.getSname().split(",")[0]);
		if (fileaot.getOriginalFilename() != null && !"".equals(fileaot.getOriginalFilename().trim()))
		{
			String filename = null;
			// 设置上传图片的保存路径
			String savePath = request.getServletContext().getRealPath("/images/");
			File file = new File(savePath);
			// 判断上传文件的保存目录是否存在
			if (!file.exists() && !file.isDirectory())
			{
				System.out.println(savePath + "目录不存在，需要创建");
				// 创建目录
				file.mkdir();
			}
			DiskFileItemFactory factory = new DiskFileItemFactory();
			// 2、创建一个文件上传解析器
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setHeaderEncoding("UTF-8");
			// 3、判断提交上来的数据是否是上传表单的数据
			if (!ServletFileUpload.isMultipartContent(request))
			{
				// 按照传统方式获取数据
				return;
			}
			try
			{
				// 報錯 需要過濾文件名稱 java.io.FileNotFoundException:
				// G:\测试02\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\FaceUp\WEB-INF\images\C:\Users\Ray\Pictures\2.jpeg
				// (文件名、目录名或卷标语法不正确。)

				filename = fileaot.getOriginalFilename();
				//				System.out.print(filename);
				if (fileaot.getOriginalFilename().split("\\.")[1].equals("png") || fileaot.getOriginalFilename().split("\\.")[1].equals("jpg") || fileaot.getOriginalFilename().split("\\.")[1].equals("jpeg"))
				{
					resume.setRepic("images/" + fileaot.getOriginalFilename());
					InputStream in = fileaot.getInputStream();// 獲得上傳的輸入流
					FileOutputStream out = new FileOutputStream(savePath + filename);// 指定web-inf目錄下的images文件
					request.setAttribute("path", "images" + "/" + filename);
					int len = 0;
					byte buffer[] = new byte[1024];
					while ((len = in.read(buffer)) > 0)// 每次讀取
					{
						out.write(buffer, 0, len);
					}
					in.close();
					out.close();
				} else
				{  //必须是图片才能上传否则失败
					ResponseUtils.outJson(response, "上传必须是图片");
					return;
				}

			} catch (FileNotFoundException e)
			{
				e.printStackTrace();
			} catch (IOException e)
			{
				e.printStackTrace();
			}
		}
		if (social3.size() != 0)
		{
			//社会关系更新
			social1.setCompany(social.getCompany().split(",")[0]);
			social1.setContent(social.getContent().split(",")[0]);
			social1.setSocialtime(social.getSocialtime().split(",")[0]);
			String s = (social.getSocialid() + "").split(",")[0];
			int socialid1 = Integer.valueOf(s);
			social1.setUid(uid);
			social1.setSocialid(socialid1);
			schoolService.updateSocial(social1);
			if (social3.size() > 1)
			{
				social2.setCompany(social.getCompany().split(",")[1]);
				social2.setContent(social.getContent().split(",")[1]);
				social2.setSocialtime(social.getSocialtime().split(",")[1]);
				social2.setUid(uid);
				String s1 = (social.getSocialid() + "").split(",")[1];
				int socialid2 = Integer.valueOf(s);
				social1.setSocialid(socialid2);
				schoolService.updateSocial(social2);
			}
			if (social3.size() == 1 && social.getCompany().split(",").length > 1)
			{
				social2.setCompany(social.getCompany().split(",")[1]);
				social2.setContent(social.getContent().split(",")[1]);
				social2.setSocialtime(social.getSocialtime().split(",")[1]);
				social2.setUid(uid);
				schoolService.insertSocial(social2);
			}
		} else
		{
			//插入
			social1.setCompany(social.getCompany().split(",")[0]);
			social1.setContent(social.getContent().split(",")[0]);
			social1.setSocialtime(social.getSocialtime().split(",")[0]);
			social1.setUid(uid);
			schoolService.insertSocial(social1);
			if (social3.size() == 1 && social.getCompany().split(",")[1].length() > 1)
			{
				social2.setCompany(social.getCompany().split(",")[1]);
				social2.setContent(social.getContent().split(",")[1]);
				social2.setSocialtime(social.getSocialtime().split(",")[1]);
				social2.setUid(uid);
				schoolService.insertSocial(social2);
			}
		}
		if (aducational3.size() != 0)
		{
			//学校更新
			aducational1.setAdtime(aducational.getAdtime().split(",")[0]);
			aducational1.setSname(aducational.getSname().split(",")[0]);
			aducational1.setProfession(aducational.getProfession().split(",")[0]);
			aducational1.setUid(uid);
			String s = (aducational.getAducationid() + "").split(",")[0];
			int aducationid1 = Integer.valueOf(s);
			aducational1.setAducationid(aducationid1);
			schoolService.updateAducation(aducational1);
			if (aducational3.size() > 1)
			{
				aducational2.setAdtime(aducational.getAdtime().split(",")[1]);
				aducational2.setSname(aducational.getSname().split(",")[1]);
				aducational2.setProfession(aducational.getProfession().split(",")[1]);
				aducational2.setUid(uid);
				String s1 = (aducational.getAducationid() + "").split(",")[1];
				int aducationid2 = Integer.valueOf(s1);
				aducational1.setAducationid(aducationid2);
				schoolService.updateAducation(aducational2);
			}
			if (aducational3.size() == 1 && aducational.getAdtime().split(",").length > 1)
			{
				aducational2.setAdtime(aducational.getAdtime().split(",")[1]);
				aducational2.setSname(aducational.getSname().split(",")[1]);
				aducational2.setProfession(aducational.getProfession().split(",")[1]);
				aducational2.setUid(uid);
				schoolService.insertAducation(aducational2);
			}
		} else
		{
			//插入
			aducational1.setAdtime(aducational.getAdtime().split(",")[0]);
			aducational1.setSname(aducational.getSname().split(",")[0]);
			aducational1.setProfession(aducational.getProfession().split(",")[0]);
			aducational1.setUid(uid);
			schoolService.insertAducation(aducational1);
			if (aducational3.size() == 1 && aducational.getAdtime().split(",")[1].length() > 1)
			{
				aducational2.setAdtime(aducational.getAdtime().split(",")[1]);
				aducational2.setSname(aducational.getSname().split(",")[1]);
				aducational2.setProfession(aducational.getProfession().split(",")[1]);
				aducational2.setUid(uid);
				schoolService.insertAducation(aducational2);
			}
		}
		//简历就更新就行
		int degreeid = schoolService.findDegreeidByDegreeName(resume);
		int professid = schoolService.findProfessidByProfessName(resume);
		int sid = schoolService.findSidBySchoolName(resume);
		resume.setDegreeid(degreeid);
		resume.setSid(sid);
		resume.setProfessid(professid);
		resume.setUid(uid);
		System.out.println(resume);
		schoolService.updateUserresume(resume);
		ResponseUtils.outJson(response, "保存成功");
	}

	//显示用户端的填写简历页面
	@RequestMapping("/showUserFillResume")
	public String showUserFillResume(HttpServletRequest request)
	{
		//查找一下学历的集合
		List<Degree> degrees = schoolService.findDegreeList();
		System.out.println(degrees);
		request.getSession().setAttribute("degrees", degrees);
		return "schoolManage/User_FillOutResume";
	}

	//发送验证码
	@RequestMapping("/sendMsg")
	public void sendMsg(HttpServletRequest request, HttpServletResponse response)
	{
		String phone = request.getParameter("retel"); //发送短信验证码
		Gson gson = new Gson();
		String ph = gson.fromJson(phone, String.class);
		PhoneCode.getPhonemsg(ph);
		System.out.println(PhoneCode.code);
		ResponseUtils.outJson1(response, PhoneCode.code);
	}

	//用户端的简历填写
	@RequestMapping("/fillOutResume")
	public void fillOutResume(@RequestParam("file") MultipartFile fileaot, Resume resume, HttpServletRequest request, HttpServletResponse response)
	{
		System.out.println(resume);
		int uid = (Integer)request.getSession().getAttribute("uid");

//		User user= (User) request.getSession().getAttribute("user");
		//		//插入数据库
		//		//拿到user.getUid()
		if (fileaot.getOriginalFilename() != null && !"".equals(fileaot.getOriginalFilename().trim()))
		{
			String filename = null;
			// 设置上传图片的保存路径
			String savePath = request.getServletContext().getRealPath("/images/");
			File file = new File(savePath);
			// 判断上传文件的保存目录是否存在
			if (!file.exists() && !file.isDirectory())
			{
				System.out.println(savePath + "目录不存在，需要创建");
				// 创建目录
				file.mkdir();
			}
			DiskFileItemFactory factory = new DiskFileItemFactory();
			// 2、创建一个文件上传解析器
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setHeaderEncoding("UTF-8");
			// 3、判断提交上来的数据是否是上传表单的数据
			if (!ServletFileUpload.isMultipartContent(request))
			{
				// 按照传统方式获取数据
				return;
			}
			try
			{
				// 報錯 需要過濾文件名稱 java.io.FileNotFoundException:
				// G:\测试02\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\FaceUp\WEB-INF\images\C:\Users\Ray\Pictures\2.jpeg
				// (文件名、目录名或卷标语法不正确。)

				filename = fileaot.getOriginalFilename();
				//				System.out.print(filename);
				if (fileaot.getOriginalFilename().split("\\.")[1].equals("png") || fileaot.getOriginalFilename().split("\\.")[1].equals("jpg") || fileaot.getOriginalFilename().split("\\.")[1].equals("jpeg"))
				{
					resume.setRepic("images/" + fileaot.getOriginalFilename());
					InputStream in = fileaot.getInputStream();// 獲得上傳的輸入流
					FileOutputStream out = new FileOutputStream(savePath +filename);// 指定web-inf目錄下的images文件
					request.setAttribute("path", "images" + "/" + filename);
					int len = 0;
					byte buffer[] = new byte[1024];
					while ((len = in.read(buffer)) > 0)// 每次讀取
					{
						out.write(buffer, 0, len);
					}
					in.close();
					out.close();
				} else
				{  //必须是图片才能上传否则失败
					ResponseUtils.outJson(response, "上传必须是图片");
					return;
				}

			} catch (FileNotFoundException e)
			{
				e.printStackTrace();
			} catch (IOException e)
			{
				e.printStackTrace();
			}
		}

		resume.setUid(uid);
		int i = schoolService.userInsertResume(resume);

		System.out.println("保存==" + i);
		if (i > 0)
		{
			ResponseUtils.outJson1(response, "{\"code\":0, \"msg\":\"\", \"data\":{}}");
		} else
		{
			ResponseUtils.outJson1(response, "{\"code\":1, \"msg\":\"\", \"data\":{}}");

		}

	}


	@RequestMapping("/userResumeStatu")
	public String findUserResumeStatus()
	{
		return "schoolManage/User_ResumeStatus";
	}


	//用户端简历情况
	@RequestMapping("/userResumeStatus")
	public void userResumeStatus(HttpServletRequest request, HttpServletResponse response)
	{
		int uid = (Integer)request.getSession().getAttribute("uid");

//		User user = (User) request.getSession().getAttribute("user");
		//插入数据库
		//拿到user.getUid()
		datagridResult.setCode(0);
		datagridResult.setMsg("");
		int count = schoolService.findUserResumeStatusCount(uid);
		List<ResumeStatus> resumeStatuses = schoolService.findUserResumeStatus(uid);
		datagridResult.setCount(count);
		datagridResult.setData(resumeStatuses);
		ResponseUtils.outJson1(response, toJson2(datagridResult));
	}

	protected String toJson2(Diagis datagridResult)
	{
		Gson gson = new Gson();
		StringBuilder sb = new StringBuilder();
		sb.append("{\"code\":").append(datagridResult.getCode()).append(",\"msg\":\"").append(datagridResult.getMsg()).append("\",\"count\":").append(datagridResult.getCount()).append(",\"data\":[");
		if (datagridResult.getData().size() != 0)
		{
			for (Object object : datagridResult.getData())
			{
				ResumeStatus recommend = (ResumeStatus) object;
				String sql = gson.toJson(recommend);
				//[{"id": user.getId(), "userName": user.getUserName()},{'id': user.getId(), 'userName': user.getUserName()}]
				sb.append(sql);
				sb.append(",");
			}
			sb.delete(sb.length() - 1, sb.length());
			sb.append("]}");
		} else
		{
			for (int i = 0; i < 7; i++)
			{
				sb.delete(sb.length(), sb.length());
			}
			sb.append("]}");
		}

		return sb.toString();
	}

	@RequestMapping("/inputResumePage")
	public String inputResume()
	{

		return "schoolManage/InputResume";
	}

	@RequestMapping("/downLoadExcel")
	public ResponseEntity<byte[]> downLoadExcel(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		//得到要下载的文件名
			String destinationfileName = "jianli.xlsx";
			String uploadpath = request.getServletContext().getRealPath("/excel");

			// 得到要下载的文件
			File file = new File(uploadpath + "/" + destinationfileName);

			System.out.println(file.getAbsoluteFile());
			HttpHeaders httpHeaders=new HttpHeaders();
			String filename=new String(destinationfileName.getBytes("UTF-8"),"iso-8859-1");
			httpHeaders.setContentDispositionFormData("attachment",filename);
			httpHeaders.setContentType(MediaType.APPLICATION_OCTET_STREAM);

			return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),httpHeaders, HttpStatus.CREATED);
	}
	@RequestMapping("/uploadTalent")
	public void uploadTalent(@RequestParam("file") MultipartFile fileaot,HttpServletRequest request,HttpServletResponse response){
		if (fileaot.getOriginalFilename() != null && !"".equals(fileaot.getOriginalFilename().trim()))
		{
			String filename = "";
			filename = fileaot.getOriginalFilename();
			String savePath = request.getServletContext().getRealPath("/excel");
			File file = new File(savePath);
			// 判断上传文件的保存目录是否存在
			if (!file.exists() && !file.isDirectory())
			{
				System.out.println(savePath + "目录不存在，需要创建");
				// 创建目录
				file.mkdir();
			}
			DiskFileItemFactory factory = new DiskFileItemFactory();
			// 2、创建一个文件上传解析器
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setHeaderEncoding("UTF-8");
			// 3、判断提交上来的数据是否是上传表单的数据
			if (!ServletFileUpload.isMultipartContent(request))
			{
				// 按照传统方式获取数据
				return;
			}
			try
			{
			if (fileaot.getOriginalFilename().split("\\.")[1].equals("xls") || fileaot.getOriginalFilename().split("\\.")[1].equals("xlsx") || fileaot.getOriginalFilename().split("\\.")[1].equals("excel"))
			{InputStream in = fileaot.getInputStream();// 獲得上傳的輸入流
				FileOutputStream out = new FileOutputStream(savePath + "/" + "upload"+filename);// 指定web-inf目錄下的images文件
				request.setAttribute("path", "excel" + "/" + filename);
				int len = 0;
				byte buffer[] = new byte[1024];
				while ((len = in.read(buffer)) > 0)// 每次讀取
				{
					out.write(buffer, 0, len);
				}
				in.close();
				out.close();
				try {
					String fileName = savePath + "/" + "upload"+filename;
					List<Object[]> list = ExcelUtil.importExcel(fileName);
					for (int i = 0; i < list.size(); i++) {
						//先去查手机号是否重复，不重复插入，重复return
						String tel= list.get(i)[6]+"";
						System.out.println(list.get(i)[6]);
						Resume resume1=schoolService.findResumeTel(tel);
						if(resume1==null){
							resume.setProfessname((String) list.get(i)[3]);
							resume.setDegreename((String) list.get(i)[5]);
							int degreeid = schoolService.findDegreeidByDegreeName(resume);
							int professid = schoolService.findProfessidByProfessName(resume);
							resume.setResname((String) list.get(i)[0]);
							resume.setSchoolname((String) list.get(i)[1]);
							resume.setRebirth((String) list.get(i)[2]);
							resume.setRepol((String) list.get(i)[4]);
							resume.setRetel((String) list.get(i)[6]);
							resume.setReaddress((String) list.get(i)[7]);
							resume.setReskill((String) list.get(i)[8]);
							resume.setReeva((String) list.get(i)[9]);
							resume.setDegreeid(degreeid);
							resume.setProfessid(professid);

							aducational1.setAdtime((String) list.get(i)[8]);
							aducational1.setSname((String) list.get(i)[9]);
							aducational1.setProfession((String) list.get(i)[10]);
							social1.setSocialtime((String) list.get(i)[11]);
							social1.setCompany((String) list.get(i)[12]);
							social1.setContent((String) list.get(i)[13]);
							//插入数据库
							schoolService.insertresume(resume);
							schoolService.insertSocial(social1);
							schoolService.insertAducation(aducational2);



						}else{
							continue;//跳出本次循环
						}


					}
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else
			{  //必须是图片才能上传否则失败
				return;
			}
			} catch (FileNotFoundException e)
			{
				e.printStackTrace();
			} catch (IOException e)
			{
				e.printStackTrace();
			}


		}
		ResponseUtils.outJson1(response,"{\"code\":0, \"msg\":\"\", \"data\":{}}");
	}
	@RequestMapping("/outputTalent")
	public void outputTalent(HttpServletRequest request,HttpServletResponse response){
		String imagePath=request.getServletContext().getRealPath("/images/");
		//查询当前页
		HashMap<String, Object> condition = new HashMap<>();
		String mindate = request.getParameter("mindate");
		String maxdate = request.getParameter("maxdate");
		String schoolname = request.getParameter("schoolname");
		String pro = request.getParameter("pro");
		int pageInt= (int) request.getSession().getAttribute("pageInt");
		int limitInt= (int) request.getSession().getAttribute("limitInt");
		if (null != mindate && !"".equals(mindate.trim()))
		{
			condition.put("mindate", mindate);
		}
		if (null != maxdate && !"".equals(maxdate.trim()))
		{
			condition.put("maxdate", maxdate);
		}
		if (null != schoolname && !"".equals(schoolname.trim()))
		{
			condition.put("schoolname", schoolname);
		}
		if (null != pro && !"".equals(pro.trim()))
		{
			condition.put("pro", pro);
		}

		condition.put("pageInt", limitInt * (pageInt - 1));
		condition.put("limitInt", limitInt);
		//查询简历信息然后循环遍历
		List<Resume> resumes=schoolService.outPutUserResume(condition);
		System.out.println(resumes.size());
		List<String> tittlelist=new ArrayList<>();
		List<Map<String, Object>> mapList=new ArrayList<>();
		for (int i = 0; i < resumes.size(); i++)
		{
			List<Social> socials = schoolService.outPutUserSocial(resumes.get(i));
			List<Aducational> aducationals = schoolService.outPutUserAducation(resumes.get(i));
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("resume", resumes.get(i));
			map.put("socials", socials);
			map.put("aducations",aducationals);
			map.put("repic",this.getImageBase(imagePath+resumes.get(i).getRepic().split("/")[1]));
			tittlelist.add("resume"+resumes.get(i).getResname());
			mapList.add(map);
		}
		WordUtil.exportWordBatch(request, response, mapList,tittlelist , "template.ftl");


	}
	@SuppressWarnings("deprecation")
	public String getImageBase(String src) {
		if(src==null||src==""){
			return "";
		}
		File file = new File(src);
		if(!file.exists()) {
			return "";
		}
		InputStream in = null;
		byte[] data = null;
		try {
			in = new FileInputStream(file);
		} catch (FileNotFoundException e1) {
			e1.printStackTrace();
		}
		try {
			data = new byte[in.available()];
			in.read(data);
			in.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		BASE64Encoder encoder = new BASE64Encoder();
		return encoder.encode(data);
	}

}
