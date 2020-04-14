package com.great.talent.mapper;

import com.great.talent.entity.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface HomePageMapper
{

	/**
	 * 得到企业发布的最新职位信息
	 * @return GoodNews
	 */
	public List<GoodNews> getGoodNews();


	/**
	 * 得到学校的信息
	 * @return List<SchoolNews>
	 */
	public List<SchoolNews> getSchoolNews();


	/**
	 * 得到课程讲师信息
	 * @return List<Study>
	 */
	public List<Study> getStudyNews();

	/**
	 * 得到企业发布的招聘信息
	 * @return List<Company>
	 */
	public List<Company> getCompanyNews();

	/**
	 * @return Map
	 */
	public Map getCount();

	/**
	 * 得到最新入驻的企业名
	 * @return Map
	 */
	public List<String> getNewCompany();


	/**
	 * s首页找工作
	 * @param Map
	 * @return List<Position>
	 */
	public List<SerachJob> getJobNews(Map map);


	/**
	 * s首页找工作
	 * @param map
	 * @return int
	 */
	public int getJobNewsCount(Map map);

	/**
	 * 行业下拉框的信息
	 * @return List<Map>
	 */
	public List<Industry> getInSelect();
	/**
	 * 行业下拉框的信息
	 * @return List<Map>
	 */
	public List<String> getJobExper();


}
