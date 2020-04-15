package com.great.talent.service;

import com.google.gson.Gson;
import com.great.talent.entity.*;
import com.great.talent.mapper.EnterpriseMapper;
import com.great.talent.mapper.HomePageMapper;
import com.great.talent.util.Diagis;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class HomePageService
{
	@Resource
	private HomePageMapper homePageMapper;
	Gson gson=new Gson();

	/**
	 * 得到企业发布的好消息
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

		return Str;
	}
	/**
	 * 得到学校的信息
	 * @return
	 */
	public String getStudyNews(){

		List<Study> studyList=homePageMapper.getStudyNews();
		String Str=gson.toJson(studyList);

		return Str;
	}

	/**
	 * 得到企业发布招聘的信息
	 * @return
	 */
	public String getCompanyNews(){

		List<Company> companyList=homePageMapper.getCompanyNews();
		String Str=gson.toJson(companyList);

		return Str;
	}

	/**
	 * 统计人才 就业 岗位数
	 * @param request
	 */
	public String getCount(HttpServletRequest request){

		Map<Object,Object> map=homePageMapper.getCount();


		String str=gson.toJson(map);

		return str;
	}

	/**
	 * 最新入驻的企业
	 * @return List
	 */
	public List<String> getNewCompany(){

		List<String> list=homePageMapper.getNewCompany();
		System.out.println(list);
		return list;
	}


	/**
	 * 首页找工作
	 * @return List
	 */
	public String getJobNews(Map map){


		Diagis dataTable=new Diagis();
		List<SerachJob> roleList=new ArrayList<>();
		int num=homePageMapper.getJobNewsCount(map);
		roleList=homePageMapper.getJobNews(map);
		dataTable.setCode(0);
		dataTable.setMsg("");
		dataTable.setCount(num);
		dataTable.setData(roleList);
		String roleStr=gson.toJson(dataTable);
		return roleStr;
	}

	/**
	 * 行业下拉框的信息
	 * @return String
	 */
	public String getInSelect(){

		//行业
		List<Industry> list=homePageMapper.getInSelect();
		String str=gson.toJson(list);

		return str;
	}
	/**
	 * 工作经验下拉框的信息
	 * @return String
	 */
	public String getJobExper()
	{
		//工作经验
		List<String> list1=homePageMapper.getJobExper();
		String str=gson.toJson(list1);

		return str;

	}


}
