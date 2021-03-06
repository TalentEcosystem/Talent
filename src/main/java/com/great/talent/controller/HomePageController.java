package com.great.talent.controller;

import com.great.talent.entity.*;
import com.great.talent.service.HomePageService;
import com.great.talent.service.SchoolService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.text.ParseException;
import java.util.*;

@Controller
@RequestMapping("/HomePage")
public class HomePageController
{

	@Resource
	private HomePageService homePageService;
	@Resource
	private SchoolService schoolService;

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
	public String getGoodNews( HttpServletRequest request){
		String str = homePageService.getCount();
		return str;
	}

	/**
	 *得到学校的信息
	 * @return String
	 */
	@RequestMapping(value = "/getSchoolNews" ,produces = "text/html;charset=UTF-8" )
	@ResponseBody
	public String getSchoolNews( ){
		String Str=homePageService.getSchoolNews();
		return Str;
	}
	/**
	 *得到产品包和讲师的信息
	 * @return String
	 */
	@RequestMapping(value = "/getStudyNews" ,produces = "text/html;charset=UTF-8" )
	@ResponseBody
	public String getStudyNews( ){
		String Str=homePageService.getStudyNews();
		return Str;
	}

	/**
	 *得到产品包和讲师的播放前四信息
	 * @return String
	 */
	@RequestMapping(value = "/getClassCurri" ,produces = "text/html;charset=UTF-8" )
	@ResponseBody
	public String getClassCurri( ){

		String Str=homePageService.getClassCurri();
		return Str;
	}

	/**
	 *得到课程的详细信息的信息跳转课程详情页
	 * @return String
	 */
	@RequestMapping(value = "/getCourseDetails" ,produces = "text/html;charset=UTF-8" )
	public String getCourseDetails(String proid,HttpServletRequest request){
		Product product=homePageService.getCourseDetails(proid);
		request.getSession().setAttribute("product",product);
		return "homepage/CourseDetails";
	}


	/**
	 *得到企业信息（首页轮播）
	 * @return String
	 */
	@RequestMapping(value = "/getCompanyNews" ,produces = "text/html;charset=UTF-8" )
	@ResponseBody
	public String getCompanyNews( ){
		String Str=homePageService.getCompanyNews();
		return Str;
	}
	/**
	 *得到企业信息（企业的简介）
	 * @return String
	 */
	@RequestMapping(value = "/getCompanyProfile" ,produces = "text/html;charset=UTF-8" )

	public String getCompanyProfile(HttpServletRequest request ,String cid){

		Integer c= Integer.valueOf(cid);
		Company company=homePageService.getCompanyProfile(c);
		request.getSession().setAttribute("CompanyProfile",company);
		return "homepage/CompanyProfile";
	}


	/**
	 *找工作页面
	 * @return String
	 */
	@RequestMapping(value = "/searchJob" ,produces = "text/html;charset=UTF-8" )
	public String 	searchJob( ){
		return "homepage/searchJob";
	}


	@RequestMapping(value = "/search" ,produces = "text/html;charset=UTF-8" )
	public String search( ) {
		System.out.println("aas");
		return "";
	}

	/**
	 * 首页搜索得到岗位结果，
	 * @return String
	 */
	@RequestMapping(value = "/getJobNews",produces = "text/html;charset=UTF-8"  )
	public ModelAndView getJobNews(String sypositionname ,String sypositionaddress ,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		//要跳转的页面
		mav.setViewName("homepage/searchJob");
		//传入对象
		request.getSession().setAttribute("sypositionname",sypositionname);
		request.getSession().setAttribute("sypositionaddress",sypositionaddress);
		return mav;
	}


	/**
	 * 找工作页面搜索得到岗位结果，
	 * @return String
	 */
	@RequestMapping(value = "/getJobTableNews" ,produces = "text/html;charset=UTF-8" )
	@ResponseBody
	public String getJobTableNews(@ModelAttribute SerachJob serachJob, HttpServletRequest request) {
				Map cond=getMap(serachJob,request);
				String s=homePageService.getJobNews(cond);
				return s;
	}

	/**
	 *得到行业、下拉框的数据
	 * @return String
	 */
	@RequestMapping(value = "/getSelect" ,produces = "text/html;charset=UTF-8" )
	@ResponseBody
	public String getSelect( ) {
		String Str=homePageService.getInSelect();
		return Str;
	}
	/**
	 *得到工作经验 下拉框的数据
	 * @return String
	 */
	@RequestMapping(value = "/getExperSelect" ,produces = "text/html;charset=UTF-8" )
	@ResponseBody
	public String getExperSelect( ) {

		String Str=homePageService.getJobExper();
		return Str;
	}
	/**
	 * 企业发布的岗位信息，
	 * @return String
	 */
	@RequestMapping(value = "/getComJobNews" ,produces = "text/html;charset=UTF-8" )
	@ResponseBody
	public String getComJobNews(String cid) {
		String srt=homePageService.getComJobNews(cid);
		return srt;
	}


	/**
	 *技术成长页面（企业的简介）
	 * @return String
	 */
	@RequestMapping(value = "/getTechnologyArea" ,produces = "text/html;charset=UTF-8" )
	public String getTechnologyArea(HttpServletRequest request , String curPage1,  String did) {
		Integer curPage = null;
		Integer domainid=null;
		LinkedHashMap<String, Object> cond = new LinkedHashMap<>();
		BackUserPageBean<Product> myReportByPage=null;
		if (curPage1 != null)
		{
			curPage = (Integer.valueOf(curPage1)-1)*9;
		} else
		{
			curPage = 0;
		}
		if(did != null&&did != ""){
			domainid=Integer.valueOf(did);
			request.setAttribute("domainid",domainid);
		}
		List<Know> knowList=homePageService.getDomain();
		myReportByPage = homePageService.getTechnologyArea(cond, curPage, 9,domainid);
		request.setAttribute("knowList",knowList);
		request.setAttribute("myReportByPage",myReportByPage);
		return "homepage/TechnologyArea";
	}

	/**
	 *用户评论产品包
	 * @return String
	 */
	@RequestMapping(value = "/setEvaInfo" ,produces = "text/html;charset=UTF-8" )
	@ResponseBody
	public String setEvainfo(Eva eva) {
		int num=homePageService.setEvainfo(eva);
		if (num > 0){
			return "success";
		}else {
			return "error";
		}

	}
	/**
	 *得到评论产品包的用户和内容
	 * @return String
	 */
	@RequestMapping(value = "/getEvaInfo" ,produces = "text/html;charset=UTF-8" )
	@ResponseBody
	public String getEvaInfo(String pid) {
		Integer productid=Integer.valueOf(pid);
		String Str=homePageService.getEvaInfo(productid);
		return Str;


	}
	//显示高校简介页面
	@RequestMapping("/schoolProfile")
	public String showSchoolInfo(HttpServletRequest request,String sid ) {
		//这里需要获取登录高校账号的学校id
		Integer schid=Integer.valueOf(sid);
		SchoolMsg schoolMsg=schoolService.findSchoolInfo(schid);
		request.getSession().setAttribute("school",schoolMsg);
		return "homepage/SchoolProfile";
	}

	/**
	 * 找工作-岗位详情
	 * @param request
	 * @param jobData1
	 * @throws IOException
	 * @throws ParseException
	 */
	@RequestMapping("/checkJob")
	@ResponseBody
	public String checkJob(JobData jobData1,HttpServletRequest request) {
		String Str= homePageService.findWelfare(jobData1,request);
		return Str;
	}






	/**
	 * 找工作条件的map
	 * @param serachJob
	 * @param request
	 * @return
	 */
	public Map getMap(SerachJob serachJob,HttpServletRequest request) {
		System.out.println("getJobTableNews"+serachJob);
		String p=request.getParameter("page");
		String l=request.getParameter("limit");
		int page=Integer.valueOf(p);
		int limit=Integer.valueOf(l);
		Integer monrybegin=null;
		Integer monryend=null;
		Integer beginNum=null;
		Integer endNum=null;
		if(serachJob.getMoney() != null&&!serachJob.getMoney().trim().equals("不限")){
			monrybegin= Integer.valueOf(serachJob.getMoney().split("-")[0]);
			monryend= Integer.valueOf(serachJob.getMoney().split("-")[1]);
		}if(serachJob.getCompanynum() != null&&!serachJob.getCompanynum().trim().equals("不限")){
			beginNum= Integer.valueOf(serachJob.getCompanynum().split("-")[0]);
			endNum= Integer.valueOf(serachJob.getCompanynum().split("-")[1]);
		}

		Map<String,Object> cond = new HashMap<>();
		Map<String,Object> map = new HashMap<>();
		if(serachJob.getPositionaddress() == null||serachJob.getPositionaddress().equals("-1")){
			System.out.println("111");
			map.put("sypositionaddress",serachJob.getSypositionaddress());
			if((serachJob.getPositionname() == null)){
				map.put("sypositionname",serachJob.getSypositionname());
			} else {

				map.put("sypositionname",serachJob.getPositionname());

			}

		}else {
			map.put("sypositionaddress",serachJob.getPositionaddress());
			if(serachJob.getPositionname() == null||serachJob.getPositionname().equals("")){
				System.out.println("222");
				map.put("sypositionname",serachJob.getSypositionname());
			} else {

				map.put("sypositionname",serachJob.getPositionname());

			}
		}


		if(serachJob.getIndustryid() != null&&serachJob.getIndustryid() != -1){
			map.put("industryid",serachJob.getIndustryid());
		}if(serachJob.getDegreeid() != null&& serachJob.getDegreeid() != 8 ){
			map.put("degreeid",serachJob.getDegreeid());
		}
		map.put("moneybegin",monrybegin);
		map.put("moneyend",monryend);
		if(serachJob.getPositionexper() != null&&!serachJob.getPositionexper().trim().equals("不限")){
			map.put("positionexper",serachJob.getPositionexper());
		}


		map.put("beginNum",beginNum);
		map.put("endNum",endNum);
		map.put("page",(page-1)*limit);
		map.put("limit",limit);
		cond.put("cond",map);
		System.out.println("Map=="+cond);
		return cond;
	}


}
