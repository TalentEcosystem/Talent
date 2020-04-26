package com.great.talent.service;

import com.great.talent.entity.*;
import com.great.talent.mapper.SchoolMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.Date;
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
	@Transactional
	public int updateSchool(SchoolMsg schoolMsg){
		return schoolMapper.updateSchool(schoolMsg);
	}
	//推荐人才的岗位表
	public List<Recommend> findRcommend(HashMap<String, Object> condition){
		return schoolMapper.findRcommend(condition);
	}

	public int findRcommendCount(HashMap<String, Object> condition){
		return schoolMapper.findRcommendCount(condition);
	}

	//推荐人才的带条件查找全部人才
	public List<UserTalent> findTalent1(HashMap<String, Object> condition){
		return schoolMapper.findTalent1(condition);
	}

	//推荐人才的带条件查找条数
	public int findTalentCount1(HashMap<String, Object> condition){
		return schoolMapper.findTalentCount1(condition);
	}
	@Transactional
	public int insertRecommend(Recomend recomend){
		return schoolMapper.insertRecommend(recomend);
	}
	public String findSchoolnameBySid(int sid){
		return schoolMapper.findSchoolnameBySid(sid);
	}
	@Transactional
	public int updateUserresume(Resume resume){
		return schoolMapper.updateUserresume(resume);
	}

	public int findSidBySchoolName(Resume resume){
		return schoolMapper.findSidBySchoolName(resume);
	}

	public int findDegreeidByDegreeName(Resume resume){
		return schoolMapper.findDegreeidByDegreeName(resume);
	}

	public int findProfessidByProfessName(Resume resume){
		return schoolMapper.findProfessidByProfessName(resume);
	}
	@Transactional
	public int updateSocial(Social social){
		return schoolMapper.updateSocial(social);
	}
	@Transactional
	public int insertSocial(Social social){
		return schoolMapper.insertSocial(social);
	}
	@Transactional
	public int updateAducation(Aducational aducational){
		return schoolMapper.updateAducation(aducational);
	}
	@Transactional
	public int insertAducation(Aducational aducational){
		return schoolMapper.insertAducation(aducational);
	}

	public List<Degree> findDegreeList(){
		return schoolMapper.findDegreeList();
	}

	public int userInsertResume(Resume resume){
		return schoolMapper.userInsertResume(resume);
	}
	public List<ResumeStatus> findUserResumeStatus(int uid){
		return schoolMapper.findUserResumeStatus(uid);
	}

	public int findUserResumeStatusCount(int uid){
		return schoolMapper.findUserResumeStatusCount(uid);
	}
	@Transactional
	public int userInsertInterview(Interview interview){
		return schoolMapper.userInsertInterview(interview);
	}
	public Resume findResumeTel(String tel){
		return schoolMapper.findResumeTel(tel);
	}
	@Transactional
	public int insertresume(Resume resume){
		return schoolMapper.insertresume(resume);
	}
	public List<Resume> outPutUserResume(HashMap<String, Object> condition){
		return schoolMapper.outPutUserResume(condition);
	}

	public List<Social> outPutUserSocial(Resume resume){
		return schoolMapper.outPutUserSocial(resume);
	}

	public List<Aducational> outPutUserAducation(Resume resume){
		return schoolMapper.outPutUserAducation(resume);
	}
	public Interview findUserInterview(Recomend resume){
		return schoolMapper.findUserInterview(resume);
	}
}
