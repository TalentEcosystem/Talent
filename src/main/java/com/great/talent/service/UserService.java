package com.great.talent.service;

import com.great.talent.entity.*;
import com.great.talent.mapper.DeptMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class UserService
{
	@Resource
	private DeptMapper deptMapper;

	@Transactional
	public User login(User user){
		return deptMapper.userLogin(user);
	}

	@Transactional
	public int updateUserTime(User user){
		return deptMapper.updateUserTime(user);
	}
	@Transactional
	public Integer userNameCheck(String uaccount){
		return deptMapper.userNameCheck(uaccount);
	}

	@Transactional
	public Integer findUserIdByUaccount(String uaccount){
		return deptMapper.findUserIdByUaccount(uaccount);
	}

	@Transactional
	public Boolean addUser(User user){
		return deptMapper.addUser(user);
	}

	@Transactional
	public String findPhoneByAccount(String uaccount){
		return deptMapper.findPhoneByAccount(uaccount);
	}

	@Transactional
	public Boolean updateUser(User user){
		return deptMapper.updateUser(user);
	}

	@Transactional
	public Boolean updatePersonal(User user){
		return deptMapper.updatePersonal(user);
	}

	@Transactional
	public Boolean updatePhone(User user){
		return deptMapper.updatePhone(user);
	}

	@Transactional
	public Boolean uheadUpLoad(User user){
		return deptMapper.uheadUpLoad(user);
	}

	@Transactional
	public List<MyCollection> findMyCollection(Map map){
		return deptMapper.findMyCollection(map);
	}
	@Transactional
	public Integer findMyCollectionCount(Map map){
		return deptMapper.findMyCollectionCount(map);
	}

	@Transactional
	public List<RequestFeedback> findRequestFeedback(Map map){
		return deptMapper.findRequestFeedback(map);
	}
	@Transactional
	public Integer findRequestFeedbackCount(Map map){
		return deptMapper.findRequestFeedbackCount(map);
	}

	@Transactional
	public JobData checkJob(JobData jobData){
		return deptMapper.checkJob(jobData);
	}

	@Transactional
	public List<Welfare> findWelfare(Map map){
		return deptMapper.findWelfare(map);
	}

	@Transactional
	public List<MyStudy> findMyStudy(int uid){
		return deptMapper.findMyStudy(uid);
	}

	@Transactional
	public String findSidByUid(int uid){
		return deptMapper.findSidByUid(uid);
	}

	@Transactional
	public Boolean jobApplication(Interview interview){
		return deptMapper.jobApplication(interview);
	}

	@Transactional
	public Interview checkInterview(Interview interview){
		return deptMapper.checkInterview(interview);
	}

	@Transactional
	public MyCollection checkCollection(MyCollection myCollection){
		return deptMapper.checkCollection(myCollection);
	}
	@Transactional
	public Boolean addCollection(MyCollection myCollection){
		return deptMapper.addCollection(myCollection);
	}
}
