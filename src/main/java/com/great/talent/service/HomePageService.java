package com.great.talent.service;

import com.google.gson.Gson;
import com.great.talent.entity.*;
import com.great.talent.mapper.DeptMapper;
import com.great.talent.mapper.HomePageMapper;
import com.great.talent.util.Diagis;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Service
public class HomePageService
{
	@Resource
	private HomePageMapper homePageMapper;
	@Resource
	private DeptMapper deptMapper;
	Gson gson=new Gson();

	/**
	 * 得到企业发布的好消息
	 * @return List<GoodNews>
	 */
	public List<GoodNews> getGoodNews() {
		List<GoodNews> goodNewsList=new ArrayList<>();
		goodNewsList=homePageMapper.getGoodNews();
		return goodNewsList;
	}

	/**
	 * 得到学校的信息
	 * @return String
	 */
	public String getSchoolNews() {
		List<SchoolNews> schoolNewsList=homePageMapper.getSchoolNews();
		String Str=gson.toJson(schoolNewsList);
		return Str;
	}
	/**
	 * 得到产品包和讲师的信息
	 * @return String
	 */
	public String getStudyNews() {
		List<Study> studyList=homePageMapper.getStudyNews();
		String Str=gson.toJson(studyList);
		return Str;
	}
	/**
	 * 得到产品包和讲师的播放前四的信息信息
	 * @return String
	 */
	public String getClassCurri() {
		List<Study> studyList=homePageMapper.getClassCurri();
		String Str=gson.toJson(studyList);
		return Str;
	}
	/**
	 * 得到产品包和课程的详细信息
	 * @return Product
	 */
	public Product getCourseDetails(String pid) {
		Integer proid=Integer.valueOf(pid);
		Product product=homePageMapper.getCourseDetails(proid);
		List<Chapter> chapterList=homePageMapper.getChapter(proid);
		product.setDate(chapterList);
		return product;
	}

	/**
	 * 得到企业发布招聘的信息
	 * @return String
	 */
	public String getCompanyNews() {
		List<Company> companyList=homePageMapper.getCompanyNews();
		String Str=gson.toJson(companyList);
		return Str;
	}

	/**
	 * 得到企业的简介信息
	 * @return Company
	 */
	public Company getCompanyProfile(Integer cid) {
		Company company=homePageMapper.getCompanyProfile(cid);
		return company;
	};

	/**
	 * 统计人才 就业 岗位数
	 */
	public String getCount() {
		Map<Object,Object> map=homePageMapper.getCount();
		String str=gson.toJson(map);
		return str;
	}

	/**
	 * 最新入驻的企业
	 * @return List
	 */
	public List<String> getNewCompany() {
		List<String> list=homePageMapper.getNewCompany();
		System.out.println(list);
		return list;
	}


	/**
	 * 首页找工作
	 * @return String
	 */
	public String getJobNews(Map map) {
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
	public String getInSelect() {

		//行业
		List<Industry> list=homePageMapper.getInSelect();
		String str=gson.toJson(list);

		return str;
	}
	/**
	 * 工作经验下拉框的信息
	 * @return String
	 */
	public String getJobExper() {
		//工作经验
		List<String> list1=homePageMapper.getJobExper();
		String str=gson.toJson(list1);
		return str;
	}



	/**
	 * 企业发布的招聘信息
	 * @return String
	 */
	public String getComJobNews(String cid) {
		Diagis dataTable=new Diagis();
		Integer ci=Integer.valueOf(cid);
		List<SerachJob> serachJobList=new ArrayList<>();
		int num=homePageMapper.getComJobNewsCount(ci);
		serachJobList=homePageMapper.getComJobNews(ci);
		dataTable.setCode(0);
		dataTable.setMsg("");
		dataTable.setCount(num);
		dataTable.setData(serachJobList);
		String roleStr=gson.toJson(dataTable);
		return roleStr;
	}
	/**
	 * 企业招聘信息的条数
	 * @param map curPage
	 * @return BackUserPageBean<Product>
	 */
	public BackUserPageBean<Product> getTechnologyArea(Map map,Integer curPage,Integer pageSize,Integer domainid) {
		Integer totalRerords = null;
		List<Product> my_reports=null;
		totalRerords=homePageMapper.getTechnologyAreaCount(map,curPage,pageSize,domainid);
		my_reports=homePageMapper.getTechnologyArea(map,curPage,pageSize,domainid);
		BackUserPageBean<Product> myReportBackUserPageBean=new BackUserPageBean<Product>(curPage,totalRerords,pageSize);
		myReportBackUserPageBean.setList(my_reports);
		return myReportBackUserPageBean;
	}
	/**
	 * 得到领域的信息
	 * @return List<Know>
	 */
	public List<Know> getDomain() {
		List<Know> knowList=homePageMapper.getDomain();
		return knowList;
	}

	/**
	 * 用户评论产品包
	 * @param eva
	 * @return int
	 */
	public int setEvainfo(Eva eva) {
		int num=homePageMapper.setEvainfo(eva);
		return num;
	}
	/**
	 * 得到评论产品包的用户和内容
	 * @param productid
	 * @return String
	 */
	public String getEvaInfo(Integer productid) {
		List<Eva> evaList=homePageMapper.getEvaInfo(productid);
		String Str=gson.toJson(evaList);
		return Str;
	}

	@Transactional
	public JobData checkJob(JobData jobData) {
		return deptMapper.checkJob(jobData);
	}

	@Transactional
	public String findWelfare(JobData jobData1, HttpServletRequest request) {
		JobData jobData = checkJob(jobData1);
		Map<String,Object> map = new LinkedHashMap<>();
		map.put("positionid",jobData.getPositionid());
		List<Welfare> list=deptMapper.findWelfare(map);
		if (null!=jobData&&!"".equals(jobData)){
			request.getSession().setAttribute("jobData",jobData);
			request.getSession().setAttribute("welfare",list);
			return "1111";
		}else {
			return "error";
		}

	}

}
