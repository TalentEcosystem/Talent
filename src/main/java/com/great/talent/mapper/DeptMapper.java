package com.great.talent.mapper;

import com.great.talent.entity.MyCollection;
import com.great.talent.entity.RequestFeedback;
import com.great.talent.entity.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface DeptMapper
{
	User userLogin(User user);
	Integer userNameCheck(String uaccount);
	Integer findUserIdByUaccount(String uaccount);
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
}
