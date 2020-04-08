package com.great.talent.controller;

import com.google.gson.Gson;
import com.great.talent.entity.Diagis;
import com.great.talent.entity.UserTalent;
import com.great.talent.service.SchoolService;
import com.great.talent.util.ResponseUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
	@RequestMapping("/useResume")
	public String showResume(){
		System.out.println("1111===");
		return "schoolManage/UseResume";
	}
	@RequestMapping("/findResume")
	public void findResume(HttpServletRequest request, HttpServletResponse response){
		String jsonStr=request.getParameter("uid");
		Gson g=new Gson();
		UserTalent userTalent=g.fromJson(jsonStr,UserTalent.class);



	}




}
