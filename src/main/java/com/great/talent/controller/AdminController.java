package com.great.talent.controller;

import com.google.gson.Gson;
import com.great.talent.entity.Know;
import com.great.talent.entity.Table;
import com.great.talent.service.AdminService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
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
		return "/admin/UserManager";
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
}
