package com.great.talent.mapper;

import com.great.talent.entity.GoodNews;
import com.great.talent.entity.SchoolNews;
import com.great.talent.entity.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

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
	 * @return
	 */
	public List<SchoolNews> getSchoolNews();


}
