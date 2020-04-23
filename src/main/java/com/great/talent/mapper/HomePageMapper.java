package com.great.talent.mapper;

import com.great.talent.entity.*;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import java.util.Map;

/**
 * @author Administrator
 */
@Mapper
public interface HomePageMapper
{

	/**
	 * 得到企业发布的最新职位信息
	 * @return GoodNews
	 */
	 List<GoodNews> getGoodNews();


	/**
	 * 得到学校的信息
	 * @return List<SchoolNews>
	 */
	 List<SchoolNews> getSchoolNews();


	/**
	 * 得到产品包和讲师的信息前8信息
	 * @return List<Study>
	 */
	 List<Study> getStudyNews();

	/**
	 *  产品包和讲师信息前四名课程
	 * @return List<Study>
	 */
	 List<Study> getClassCurri();
	/**
	 * 得到产品包和章节的详细信息
	 *  @param proid
	 * @return Product
	 */
	 Product getCourseDetails(Integer proid);

	/**
	 * 得到产品包相对应的章节的详细信息
	 * @return List<Chapter>
	 */
	 List<Chapter> getChapter(Integer proid);

	/**
	 * 得到企业发布的招聘信息
	 * @return List<Company>
	 */
	 List<Company> getCompanyNews();

	/**
	 * 得到企业发布的招聘信息的条数
	 * @return Map
	 */
	 Map getCount();

	/**
	 * 得到最新入驻的企业名
	 * @return List<String>
	 */
	 List<String> getNewCompany();


	/**
	 * s首页找工作
	 * @param map
	 * @return List<SerachJob>
	 */
	 List<SerachJob> getJobNews(Map map);


	/**
	 * s首页找工作
	 * @param map
	 * @return int
	 */
	 int getJobNewsCount(Map map);

	/**
	 * 行业下拉框的信息
	 * @return List<Industry>
	 */
	 List<Industry> getInSelect();
	/**
	 * 行业下拉框的信息
	 * @return List<String>
	 */
	 List<String> getJobExper();


	/**
	 * 得到企业的简介信息
	 * @return Company
	 */
	 Company getCompanyProfile(Integer cid);

	/**
	 * 企业招聘的信息
	 * @param cid
	 * @return  List<SerachJob>
	 */
	 List<SerachJob> getComJobNews(Integer cid);


	/**
	 * 企业招聘信息的条数
	 * @param cid
	 * @return int
	 */
	 int getComJobNewsCount(Integer cid);


	/**
	 *的到知识库的信息
	 * @param map
	 * @return  List<Product>
	 */
	 List<Product> getTechnologyArea(Map map,Integer curPage,Integer pageSize,Integer domainid);

	/**
	 *得到知识库的条数
	 * @param map
	 * @return int
	 */
	 int getTechnologyAreaCount(Map map,Integer curPage,Integer pageSize,Integer domainid);

	/**
	 * 得到领域的信息
	 * @return List<Know>
	 */
	 List<Know> getDomain();

	/**
	 * 添加用户评论产品包
	 * @param eva
	 * @return int
	 */
	 int setEvainfo(Eva eva);

	/**
	 * 得到评论产品包的用户和内容
	 * @param productid
	 * @return List<Eva>
	 */
	 List<Eva> getEvaInfo(Integer productid);



}
