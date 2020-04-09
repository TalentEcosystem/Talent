package com.great.talent.mapper;

import com.great.talent.entity.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

/**
 * @author 小和
 * 高校端的mapper
 */
@Mapper
public interface SchoolMapper
{
	//带条件查找全部人才
	public List<UserTalent> findTalent(HashMap<String, Object> condition);

	//带条件查找条数
	public int findTalentCount(HashMap<String, Object> condition);

	//一下三条查找用户简历的
	public Resume findUserResume(UserTalent userTalent);

	public List<Social> findUserSocial(UserTalent userTalent);

	public List<Aducational> findUserAducation(UserTalent userTalent);

	//显示学校的信息
	public SchoolMsg findSchoolInfo(int sid);
	//修改学校的信息
	public int updateSchool(SchoolMsg schoolMsg);

}
