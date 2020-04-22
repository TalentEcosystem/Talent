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
	 * 得到产品包和讲师的信息前8信息
	 * @return List<Study>
	 */
	public List<Study> getStudyNews();

	/**
	 *  产品包和讲师信息前四名课程
	 * @return List<Study>
	 */
	public List<Study> getClassCurri();
	/**
	 * 得到产品包和章节的详细信息
	 * @return Product
	 */
	public Product getCourseDetails(Integer proid);

	/**
	 * 得到产品包相对应的章节的详细信息
	 * @return List<Chapter>
	 */
	public List<Chapter> getChapter(Integer proid);

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
	 * @param map
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


	/**
	 * 得到企业的简介信息
	 * @return Company
	 */
	public Company getCompanyProfile(Integer cid);

	/**
	 * 企业招聘的信息
	 * @param cid
	 * @return List<Position>
	 */
	public List<SerachJob> getComJobNews(Integer cid);


	/**
	 * 企业招聘信息的条数
	 * @param cid
	 * @return int
	 */
	public int getComJobNewsCount(Integer cid);


	/**
	 *的到知识库的信息
	 * @param map
	 * @return int
	 */
	public List<Product> getTechnologyArea(Map map,Integer curPage,Integer pageSize,Integer domainid);

	/**
	 *得到知识库的条数
	 * @param map
	 * @return int
	 */
	public int getTechnologyAreaCount(Map map,Integer curPage,Integer pageSize,Integer domainid);

	/**
	 * 得到领域的信息
	 * @return
	 */
	public List<Know> getDomain();

	/**
	 * 添加用户评论产品包
	 * @param eva
	 * @return
	 */
	public int setEvainfo(Eva eva);

	/**
	 * 得到评论产品包的用户和内容
	 * @param productid
	 * @return
	 */
	public List<Eva> getEvaInfo(Integer productid);



}
