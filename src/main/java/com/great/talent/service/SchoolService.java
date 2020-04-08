package com.great.talent.service;

import com.great.talent.entity.UserTalent;
import com.great.talent.mapper.SchoolMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
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


}
