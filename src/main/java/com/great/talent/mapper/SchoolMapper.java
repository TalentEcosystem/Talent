package com.great.talent.mapper;

import com.great.talent.entity.UserTalent;
import org.apache.ibatis.annotations.Mapper;

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
}
