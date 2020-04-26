package com.great.talent.mapper;

import com.great.talent.entity.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface DeptMapper
{
	User userLogin(User user);
	Integer userNameCheck(String uaccount);
	Integer findUserIdByUaccount(String uaccount);
	String findSidByUid(int uid);
	Boolean addUser(User user);
	String findPhoneByAccount(String uaccount);
	Boolean updateUser(User user);
	Boolean updatePersonal(User user);
	Boolean updatePhone(User user);
	Boolean uheadUpLoad(User user);
	//我的收藏
	List<MyCollection> findMyCollection(Map map);
	Integer findMyCollectionCount(Map map);
	//求职反馈
	List<RequestFeedback> findRequestFeedback(Map map);
	Integer findRequestFeedbackCount(Map map);
	//岗位详情
	JobData checkJob(JobData jobData);
	List<Welfare> findWelfare(Map map);
	//学习记录
	List<MyStudy> findMyStudy(int uid);
	//岗位申请
	Boolean jobApplication(Interview interview);
	//是否已申请
	Interview checkInterview(Interview interview);
	//是否已收藏
	MyCollection checkCollection(MyCollection myCollection);
	//岗位收藏
	Boolean addCollection(MyCollection myCollection);
}
