package com.great.talent.controller;

import com.great.talent.entity.Position;
import com.great.talent.entity.SerachJob;
import com.great.talent.service.HomePageService;
import com.great.talent.util.Diagis;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.annotation.Resources;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

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


	@RequestMapping(value = "/search" ,produces = "text/html;charset=UTF-8" )
	public String search( )
	{
		System.out.println("aas");
		return "";
	}

	/**
	 * 得到岗位结果，
	 * @return String
	 */
	@RequestMapping(value = "/getJobNews",produces = "text/html;charset=UTF-8"  )
	public ModelAndView getJobNews(String sypositionname ,String sypositionaddress ,HttpServletRequest request)
	{

		System.out.println("getJobNews"+sypositionaddress);
//		String s=homePageService.getJobNews(position);
		ModelAndView mav = new ModelAndView();
		//要跳转的页面
		mav.setViewName("homepage/searchJob");
		//传入对象
//		mav.addObject("position",position);

//		if (request.getSession().getAttribute("sypositionname")!=null){
//			request.getSession().removeAttribute("sypositionname");
//		}else if(request.getSession().getAttribute("sypositionaddress")!=null){
//			request.getSession().removeAttribute("sypositionaddress");
//
//		}
		request.getSession().setAttribute("sypositionname",sypositionname);
		request.getSession().setAttribute("sypositionaddress",sypositionaddress);

		return mav;
	}


	/**
	 * 得到岗位结果，
	 * @return String
	 */
	@RequestMapping(value = "/getJobTableNews" ,produces = "text/html;charset=UTF-8" )
	@ResponseBody
	public String getJobTableNews(@ModelAttribute SerachJob serachJob, HttpServletRequest request)
	{
		System.out.println("getJobTableNews"+serachJob);
//		request.getSession().removeAttribute("sypositionname");
//		request.getSession().removeAttribute("sypositionaddress");
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
				String s=homePageService.getJobNews(cond);
		//		ModelAndView mav = new ModelAndView();
		//要跳转的页面
		//		mav.setViewName("homepage/searchJob");
		//传入对象
		//		mav.addObject("position",s);
		System.out.println("getJobTableNews"+s);

		return s;

	}

	/**
	 *得到行业、下拉框的数据
	 * @return String
	 */
	@RequestMapping(value = "/getSelect" ,produces = "text/html;charset=UTF-8" )
	@ResponseBody
	public String getSelect( )
	{

		String Str=homePageService.getInSelect();
		System.out.println(Str);
		return Str;
	}
	/**
	 *得到工作经验 下拉框的数据
	 * @return String
	 */
	@RequestMapping(value = "/getExperSelect" ,produces = "text/html;charset=UTF-8" )
	@ResponseBody
	public String getExperSelect( )
	{

		String Str=homePageService.getJobExper();
		System.out.println(Str);
		return Str;
	}



}
