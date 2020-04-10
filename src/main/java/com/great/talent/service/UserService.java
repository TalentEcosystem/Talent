package com.great.talent.service;

import com.great.talent.entity.User;
import com.great.talent.mapper.DeptMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

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
	public Integer userNameCheck(String uaccount){
		return deptMapper.userNameCheck(uaccount);
	}

	@Transactional
	public Boolean addUser(User user){
		return deptMapper.addUser(user);
	}
}
