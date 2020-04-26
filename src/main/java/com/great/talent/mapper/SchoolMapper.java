package com.great.talent.mapper;

import com.great.talent.entity.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.Date;
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

	//推荐人才的岗位表
	public List<Recommend> findRcommend(HashMap<String, Object> condition);

	public int findRcommendCount(HashMap<String, Object> condition);

	//推荐人才的带条件查找全部人才
	public List<UserTalent> findTalent1(HashMap<String, Object> condition);

	//推荐人才的带条件查找条数
	public int findTalentCount1(HashMap<String, Object> condition);

	//推荐人才
	public int insertRecommend(Recomend recomend);
	public String findSchoolnameBySid(int sid);

	//用户端修改简历
	public int updateUserresume(Resume resume);

	public int findSidBySchoolName(Resume resume);

	public int findDegreeidByDegreeName(Resume resume);

	public int findProfessidByProfessName(Resume resume);

	public int updateSocial(Social social);

	public int insertSocial(Social social);

	public int updateAducation(Aducational aducational);

	public int insertAducation(Aducational aducational);

	public List<Degree> findDegreeList();

	public int userInsertResume(Resume resume);

	public List<ResumeStatus> findUserResumeStatus(int uid);

	public int findUserResumeStatusCount(int uid);

	public int userInsertInterview(Interview interview);

	public Resume findResumeTel(String tel);

	public int insertresume(Resume resume);

	public List<Resume> outPutUserResume(HashMap<String, Object> condition);

	public List<Social> outPutUserSocial(Resume resume);

	public List<Aducational> outPutUserAducation(Resume resume);

	public Interview findUserInterview(Recomend resume);
}
