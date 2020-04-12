package com.great.talent.controller;

import com.google.gson.Gson;
import com.great.talent.entity.*;
import com.great.talent.service.AdminService;
import com.great.talent.util.Diagis;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
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
}
