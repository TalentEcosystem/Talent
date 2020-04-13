package com.great.talent.controller;

import com.great.talent.service.HomePageService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.annotation.Resources;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/HomePage")
public class HomePageController
{

	@Resource
	private HomePageService homePageService;


	/**
	 * 首页
	 * @return  String
	 */
	@RequestMapping(value = "/index" ,produces = "text/html;charset=UTF-8")
	public String Welcome(){
		return "homepage/index";
	}

	/**
	 *好消息，企业发布新职位
	 * @return String
	 */
	@RequestMapping(value = "/getCount" ,produces = "text/html;charset=UTF-8" )
	@ResponseBody
	public String getGoodNews( HttpServletRequest request)
	{
		System.out.println("getCount被调用了~~~~~~~~~~~~~~~~···");
		String str = homePageService.getCount(request);
		return str;
	}

	/**
	 *得到学校的信息
	 * @return String
	 */
	@RequestMapping(value = "/getSchoolNews" ,produces = "text/html;charset=UTF-8" )
	@ResponseBody
	public String getSchoolNews( )
	{
		String Str=homePageService.getSchoolNews();
		return Str;
	}
	/**
	 *得到课程和讲师的信息
	 * @return String
	 */
	@RequestMapping(value = "/getStudyNews" ,produces = "text/html;charset=UTF-8" )
	@ResponseBody
	public String getStudyNews( )
	{
		System.out.println("getStudyNews被调用了~~~~~~~~~~~~~~~~···");
		String Str=homePageService.getStudyNews();
		return Str;
	}
	/**
	 *得到课程和讲师的信息
	 * @return String
	 */
	@RequestMapping(value = "/getCompanyNews" ,produces = "text/html;charset=UTF-8" )
	@ResponseBody
	public String getCompanyNews( )
	{
		System.out.println("getCompanyNews被调用了~~~~~~~~~~~~~~~~···");
		String Str=homePageService.getCompanyNews();
		return Str;
	}
	/**
	 *找工作页面
	 * @return String
	 */
	@RequestMapping(value = "/searchJob" ,produces = "text/html;charset=UTF-8" )
	public String 	searchJob( )
	{
		return "homepage/searchJob";
	}




}
