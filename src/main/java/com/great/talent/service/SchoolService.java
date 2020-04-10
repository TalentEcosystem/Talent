package com.great.talent.service;

import com.great.talent.entity.*;
import com.great.talent.mapper.SchoolMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;

/**
 * @author 小和
 * 高校端的service层
 */
@Service
public class SchoolService
{
	@Resource
	private SchoolMapper schoolMapper;


	public List<UserTalent> findTalent(HashMap<String, Object> condition){
		return schoolMapper.findTalent(condition);
	}
	public int findTalentCount(HashMap<String, Object> condition){
		return schoolMapper.findTalentCount(condition);
	}
	public Resume findUserResume(UserTalent userTalent){

		return schoolMapper.findUserResume(userTalent);
	}
	public List<Social> findUserSocial(UserTalent userTalent){
		return schoolMapper.findUserSocial(userTalent);
	}

	public List<Aducational> findUserAducation(UserTalent userTalent){
		return schoolMapper.findUserAducation(userTalent);
	}
	public SchoolMsg findSchoolInfo(int sid){
		return schoolMapper.findSchoolInfo(sid);
	}
	public int updateSchool(SchoolMsg schoolMsg){
		return schoolMapper.updateSchool(schoolMsg);
	}



}
