package com.great.talent.service;

import com.google.gson.Gson;
import com.great.talent.entity.Company;
import com.great.talent.entity.GoodNews;
import com.great.talent.entity.SchoolNews;
import com.great.talent.entity.Study;
import com.great.talent.mapper.EnterpriseMapper;
import com.great.talent.mapper.HomePageMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class HomePageService
{
	@Resource
	private HomePageMapper homePageMapper;
	Gson gson=new Gson();

	/**
	 * 得到企业发布的好消息，返回json字符串
	 * @return
	 */
	public List<GoodNews> getGoodNews(){
		List<GoodNews> goodNewsList=new ArrayList<>();
		goodNewsList=homePageMapper.getGoodNews();
		return goodNewsList;
	};

	/**
	 * 得到学校的信息
	 * @return
	 */
	public String getSchoolNews(){

		List<SchoolNews> schoolNewsList=homePageMapper.getSchoolNews();
		String Str=gson.toJson(schoolNewsList);
		System.out.println("x学校信息"+Str);
		return Str;
	}
	/**
	 * 得到学校的信息
	 * @return
	 */
	public String getStudyNews(){

		List<Study> studyList=homePageMapper.getStudyNews();
		String Str=gson.toJson(studyList);
		System.out.println("x课程信息"+Str);
		return Str;
	}

	/**
	 * 得到企业发布招聘的信息
	 * @return
	 */
	public String getCompanyNews(){

		List<Company> companyList=homePageMapper.getCompanyNews();
		String Str=gson.toJson(companyList);
		System.out.println("x课程信息"+Str);
		return Str;
	}

	/**
	 * 统计人才 就业 岗位数
	 * @param request
	 */
	public String getCount(HttpServletRequest request){

		Map<Object,Object> map=homePageMapper.getCount();


		String str=gson.toJson(map);
		System.out.println(str);
		return str;
	}

}