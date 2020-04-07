package com.great.talent.mapper;

import com.great.talent.entity.User;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DeptMapper
{
	User userLogin(User user);

}
