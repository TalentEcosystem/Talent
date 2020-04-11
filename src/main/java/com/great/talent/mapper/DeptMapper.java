package com.great.talent.mapper;

import com.great.talent.entity.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DeptMapper
{
	User userLogin(User user);
	Integer userNameCheck(String uaccount);
	Boolean addUser(User user);
	String findPhoneByAccount(String uaccount);
	Boolean updateUser(User user);

}
