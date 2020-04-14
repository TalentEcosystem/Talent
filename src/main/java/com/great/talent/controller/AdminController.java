package com.great.talent.controller;

import com.google.gson.Gson;
import com.great.talent.entity.*;
import com.great.talent.service.AdminService;
import com.great.talent.util.Diagis;
import com.great.talent.util.ResponseUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController
{
	@Resource
	private AdminService adminService;

	//跳转网页只用来测试功能
	@RequestMapping("/test")
	public String Test(){
		return "/admin/MenuManager";
	}

	@RequestMapping("path/{url}")
	public String MatchUrl(@PathVariable("url")String url){
		return "/admin/"+url;
	}

	@RequestMapping("/findKnow")
	@ResponseBody
	public String findKnow(String limit,String page,String knowname,String domainid){
		Map map=new HashMap();
		map.put("knowname",knowname);
		map.put("begin",(Integer.parseInt(page)-1)*Integer.parseInt(limit));
		map.put("end",Integer.parseInt(limit));
		map.put("domainid",domainid);
		List<Know> list=adminService.findKnow(map);
		int count=adminService.findCountKnow(map);
		Table table=new Table(0,"",count,list);
		Gson g=new Gson();
		String ss=g.toJson(table);
		return ss;
	}

	@RequestMapping("/addKnow")
	@ResponseBody
	public String addKnow(Know know){
		adminService.addKnow(know);
		return "新增成功!";
	}

	@RequestMapping("/updateKnow")
	@ResponseBody
	public String updateKnow(Know know){
		adminService.updateKnow(know);
		return "修改成功!";
	}

	@RequestMapping("/deleteKnow")
	@ResponseBody
	public String deleteKnow(String knowledgeid){
		adminService.deleteKnow(knowledgeid);
		return "删除成功!";
	}

	/**
	 * 条件搜索所有用户信息
	 * @param limit
	 * @param page
	 * @param schoolname
	 * @param ustate
	 * @return
	 */
	@RequestMapping("/userManager")
	@ResponseBody
	public String userManager(String limit,String page,String schoolname,String ustate){
		Map map=new HashMap();
		map.put("schoolname",schoolname);
		map.put("begin",(Integer.parseInt(page)-1)*Integer.parseInt(limit));
		map.put("end",Integer.parseInt(limit));
		map.put("ustate",ustate);
		List<User> list = adminService.findUser(map);
		int count = adminService.findCountUser(map);
		Diagis diagis=new Diagis();
		diagis.setCode(0);
		diagis.setMsg("");
		diagis.setCount(count);
		diagis.setData(list);
		Gson g=new Gson();
		String ss=g.toJson(diagis);
		return ss;
	}

	/**
	 * 用户状态禁用
	 * @param uid
	 * @return
	 */
	@RequestMapping("/userForbid")
	@ResponseBody
	public String userForbid(String uid){
		adminService.userForbid(uid);
		return "禁用成功!";
	}

	/**
	 * 用户状态启用
	 * @param uid
	 * @return
	 */
	@RequestMapping("/userEnable")
	@ResponseBody
	public String userEnable(String uid){
		adminService.userEnable(uid);
		return "启用成功!";
	}

	/**
	 * 条件搜索所有岗位信息
	 * @param limit
	 * @param page
	 * @param industryid
	 * @return
	 */
	@RequestMapping("/postManager")
	@ResponseBody
	public String postManager(String limit, String page, String industryid){
		Map map=new HashMap();
		map.put("industryid",industryid);
		map.put("begin",(Integer.parseInt(page)-1)*Integer.parseInt(limit));
		map.put("end",Integer.parseInt(limit));
		List<Post> list = adminService.findPost(map);
		int count = adminService.findCountPost(map);
		Diagis diagis=new Diagis();
		diagis.setCode(0);
		diagis.setMsg("");
		diagis.setCount(count);
		diagis.setData(list);
		Gson g=new Gson();
		String ss=g.toJson(diagis);
		return ss;
	}

	/**
	 * 用于跳转岗位管理页面,同时查询所有行业信息
	 * @param session
	 * @return
	 */
	@RequestMapping("/test1")
	public ModelAndView findPositionInfo(HttpSession session){
		ModelAndView mv = new ModelAndView();
		List<Industry> industryList = adminService.findAllIndustry();
		session.setAttribute("industryList",industryList);
		mv.setViewName("/admin/PostManager");
		return mv;
	}

	/**
	 * 新增岗位
	 * @param post
	 * @return
	 */
	@RequestMapping("/addPost")
	@ResponseBody
	public String addPost(Post post){
		adminService.addPost(post);
		return "新增成功";
	}

	/**
	 * 修改岗位
	 * @param post
	 * @return
	 */
	@RequestMapping("/updatePost")
	@ResponseBody
	public String updatePost(Post post){
		adminService.updatePost(post);
		return "修改成功";
	}

	/**
	 * 删除岗位
	 * @param postid
	 * @return
	 */
	@RequestMapping("/deletePost")
	@ResponseBody
	public String deletePost(String postid){
		adminService.deletePost(postid);
		return "删除成功";
	}

	/**
	 * 查询企业信息
	 * @param limit
	 * @param page
	 * @param companyname
	 * @param state
	 * @return
	 */
	@RequestMapping("/checkManager")
	@ResponseBody
	public String chackManager(String limit, String page, String companyname,String state){
		Map map=new HashMap();
		map.put("companyname",companyname);
		map.put("state",state);
		map.put("begin",(Integer.parseInt(page)-1)*Integer.parseInt(limit));
		map.put("end",Integer.parseInt(limit));
		List<Admin> list = adminService.findCompany(map);
		int count = adminService.findCountCompany(map);
		Diagis diagis=new Diagis();
		diagis.setCode(0);
		diagis.setMsg("");
		diagis.setCount(count);
		diagis.setData(list);
		Gson g=new Gson();
		String ss=g.toJson(diagis);
		return ss;
	}

	/**
	 * 企业审核通过
	 * @param aid
	 * @return
	 */
	@RequestMapping("/checkConfirm")
	@ResponseBody
	public String checkConfirm(String aid){
		adminService.checkConfirm(aid);
		return "提交成功";
	}

	/**
	 * 企业审核不通过
	 * @param aid
	 * @return
	 */
	@RequestMapping("/checkRefuse")
	@ResponseBody
	public String checkRefuse(String aid){
		adminService.checkRefuse(aid);
		return "提交成功";
	}

	/**
	 * 跳转权限管理页面
	 * @param roleid
	 * @param request
	 * @return
	 */
	@RequestMapping("/menuManager")
	public ModelAndView menuManager(String roleid, HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		if(roleid==null||roleid==""){
			roleid="3";
		}
		List<RoleMenu> allList = adminService.selectAllMenu();
		List<RoleMenu> hasList = adminService.selectRoleMenu(roleid);
		List<RoleMenu> list1;
		if(hasList.size()==allList.size()){
			list1=new ArrayList();
		}else if(hasList.size()==0){
			list1=allList;
		}else {

			List<RoleMenu> has = new ArrayList<>();
			boolean flag = true;
			for (int i = 0; i < allList.size(); i++)
			{
				for (int j = 0; j < hasList.size(); j++)
				{
					if (hasList.get(j).getMenuid()==allList.get(i).getMenuid() || allList.get(i).getParentid()== 0)
					{
						flag = false;
						break;
					}
				}
				if (flag)
				{
					has.add(allList.get(i));
				}
				flag = true;
			}
			list1 = adminService.selectParentMenu(has);
			for(int i=0;i<has.size();i++){
				list1.add(has.get(i));
			}
		}
		request.setAttribute("hasList",hasList);
		request.setAttribute("allList",list1);
		request.setAttribute("roleid",roleid);

		mv.setViewName("/admin/MenuManager");
		return mv;
	}

	/**
	 * 权限管理(新增几条权限)
	 * @param arr
	 * @param roleid
	 * @param request
	 * @return
	 */
	@RequestMapping("/menuManagerLeft")
	@ResponseBody
	public String menuManagerLeft(String[] arr,String roleid,HttpServletRequest request){
		List<String> list = adminService.selectChileMenu(roleid);
		for(int i=0;i<arr.length;i++){
			list.add(arr[i]);
		}
		List<String> list1 = adminService.selectNewMenu(list);
		adminService.deleteMenu(roleid);
		for(int i=0;i<list.size();i++){
			list1.add(list.get(i));
		}
		List<RoleMenu> list2=new ArrayList<>();
		for(int i=0;i<list1.size();i++){
			RoleMenu menu=new RoleMenu();
			menu.setRoleid(Integer.parseInt(roleid));
			menu.setMenuid(Integer.parseInt(list1.get(i)));
			list2.add(menu);
		}
		adminService.addMenu(list2);
		request.setAttribute("roleid",roleid);
		return "success";
	}

	/**
	 * 权限管理(新增全部权限)
	 * @param roleid
	 * @param request
	 * @return
	 */
	@RequestMapping("/menuManagerLeftMore")
	@ResponseBody
	public String menuManagerLeftMore(String roleid,HttpServletRequest request){
		List<RoleMenu> allList = adminService.selectAllMenu();
		adminService.deleteMenu(roleid);
		List<RoleMenu> list1=new ArrayList<>();
		for(int i=0;i<allList.size();i++){
			RoleMenu menu=new RoleMenu();
			menu.setRoleid(Integer.parseInt(roleid));
			menu.setMenuid(allList.get(i).getMenuid());
			list1.add(menu);
		}
		adminService.addMenu(list1);
		request.setAttribute("roleid",roleid);
		return "success";
	}

	/**
	 * 权限管理(删除几条权限)
	 * @param arr
	 * @param roleid
	 * @param request
	 * @return
	 */
	@RequestMapping("/menuManagerRight")
	@ResponseBody
	public String menuManagerRight(String[] arr,String roleid,HttpServletRequest request){
		Map map=new HashMap();
		map.put("roleid",roleid);
		for(int i=0;i<arr.length;i++){
			map.put("menuid",arr[i]);
			adminService.deleteFirst(map);
		}
		List<String> list = adminService.selectChileMenu(roleid);
		List<String> list1 = adminService.selectNewMenu(list);
		for(int i=0;i<list.size();i++){
			list1.add(list.get(i));
		}
		adminService.deleteMenu(roleid);
		List<RoleMenu> list2=new ArrayList<>();
		for(int i=0;i<list1.size();i++){
			RoleMenu menu=new RoleMenu();
			menu.setRoleid(Integer.parseInt(roleid));
			menu.setMenuid(Integer.parseInt(list1.get(i)));
			list2.add(menu);
		}
		adminService.addMenu(list2);
		request.setAttribute("roleid",roleid);
		return "success";
	}

	/**
	 * 权限管理(删除全部权限)
	 * @param roleid
	 * @param request
	 * @return
	 */
	@RequestMapping("/menuManagerRightMore")
	@ResponseBody
	public String menuManagerRightMore(String roleid,HttpServletRequest request){
		adminService.deleteMenu(roleid);
		request.setAttribute("roleid",roleid);
		return "success";
	}

	/**
	 * 参数管理
	 * @param limit
	 * @param page
	 * @param paraname
	 * @param paratype
	 * @return
	 */
	@RequestMapping("/paraManager")
	@ResponseBody
	public String paraManager(String limit, String page, String paraname,String paratype){
		Map map=new HashMap();
		map.put("paraname",paraname);
		map.put("paratype",paratype);
		map.put("begin",(Integer.parseInt(page)-1)*Integer.parseInt(limit));
		map.put("end",Integer.parseInt(limit));
		List<Parameter> list = adminService.findPara(map);
		int count = adminService.findCountPara(map);
		Diagis diagis=new Diagis();
		diagis.setCode(0);
		diagis.setMsg("");
		diagis.setCount(count);
		diagis.setData(list);
		Gson g=new Gson();
		String ss=g.toJson(diagis);
		return ss;
	}

	/**
	 * 删除参数
	 * @param paraid
	 * @return
	 */
	@RequestMapping("/deletePara")
	@ResponseBody
	public String deletePara(String paraid){
		adminService.deletePara(paraid);
		return "删除成功";
	}

	/**
	 * 修改参数
	 * @param parameter
	 * @return
	 */
	@RequestMapping("/updatePara")
	@ResponseBody
	public String updatePara(Parameter parameter){
		adminService.updatePara(parameter);
		return "修改成功";
	}

	/**
	 * 新增参数
	 * @param parameter
	 * @return
	 */
	@RequestMapping("/addPara")
	@ResponseBody
	public String addPara(Parameter parameter){
		adminService.addPara(parameter);
		return "新增成功";
	}

	@RequestMapping("/logManager")
	@ResponseBody
	public String logManager(String beginTime,String endTime,String limit, String page){
		Map map=new HashMap();
		System.out.println("开始时间:"+beginTime);
		System.out.println("结束时间:"+endTime);
		map.put("beginTime",beginTime);
		map.put("endTime",endTime);
		map.put("begin",(Integer.parseInt(page)-1)*Integer.parseInt(limit));
		map.put("end",Integer.parseInt(limit));
		List<SystemLog> list = adminService.findLog(map);
		int count = adminService.findCountLog(map);
		Diagis diagis=new Diagis();
		diagis.setCode(0);
		diagis.setMsg("");
		diagis.setCount(count);
		diagis.setData(list);
		Gson g=new Gson();
		String ss=g.toJson(diagis);
		return ss;
	}
	/**
	 * 查询下拉框的信息,并跳转查询求职的页面
	 * @param request
	 * @return
	 */
	@RequestMapping("/findInterviewInfo")
	public ModelAndView findInterviewInfo(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		List<Degree> industry  = adminService.findPositionInfo();
		request.getSession().setAttribute("industry", industry);
		mv.setViewName("/admin/JobManager");
		return mv;
	}

	/**
	 * 查询面试信息
	 *
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping("/findInterviews")
	@ResponseBody
	public void findInterviews(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		String page = request.getParameter("page");
		String limit = request.getParameter("limit");
		String industryid = request.getParameter("industryid");
		String positionname = request.getParameter("positionname");
        System.out.println("industryid="+industryid+"positionname="+positionname);
		int pageInt = Integer.valueOf(page);
		int limitInt = Integer.parseInt(limit);
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		HashMap<String, Object> condition = new HashMap<>();
		if (null != industryid && !"".equals((industryid.trim())) && !"0".equals(industryid.trim())) {
			condition.put("industryid", industryid);
		}
		if (null != positionname && !"".equals((positionname.trim()))) {
			condition.put("positionname", positionname);
		}
		int pageInts = (pageInt - 1) * limitInt;
		condition.put("pageInts", pageInts);
		condition.put("limitInt", limitInt);
		condition.put("aid",admin.getAid());
		Map map = adminService.findInterview(condition);
        System.out.println(map);
        System.out.println(map.get("interviewList"));
		Diagis diagis = new Diagis();
		if (map.size() != 0) {
			diagis.setCode(0);
			diagis.setMsg("");
			diagis.setCount((Integer) map.get("count"));
			diagis.setData((List<Interview>) map.get("interviewList"));
			ResponseUtils.outJson(response, diagis);
		}
	}

	@RequestMapping("/jobProgress")
	@ResponseBody
   public void jobProgress(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String interviewid = request.getParameter("interviewid");
		List<Interview> interview = adminService.jobProgress(Integer.parseInt(interviewid));
		Diagis diagis = new Diagis();
        if (interview != null){
			diagis.setCode(0);
			diagis.setMsg("");
			diagis.setCount(1);
			diagis.setData(interview);
			ResponseUtils.outJson(response, diagis);
		}
   }
}
