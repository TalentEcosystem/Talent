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
	 *好消息，企业发布新职位
	 * @return String
	 */
	@RequestMapping(value = "/goodNews" ,produces = "text/html;charset=UTF-8" )
	@ResponseBody
	public String getGoodNews( )
	{
		System.out.println("getGoodNews被调用了~~~~~~~~~~~~~~~~···");
//		String goodStr=homePageService.getGoodNews();
		return "";
	}

	/**
	 *得到学校的信息
	 * @return String
	 */
	@RequestMapping(value = "/getSchoolNews" ,produces = "text/html;charset=UTF-8" )
	@ResponseBody
	public String getSchoolNews( )
	{
		System.out.println("getSchoolNews被调用了~~~~~~~~~~~~~~~~···");
		String Str=homePageService.getSchoolNews();
		return Str;
	}

}
