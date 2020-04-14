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
}
