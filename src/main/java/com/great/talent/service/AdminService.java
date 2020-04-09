package com.great.talent.service;

import com.great.talent.entity.Know;
import com.great.talent.mapper.AdminMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class AdminService
{
	@Resource
	AdminMapper adminMapper;

	@Transactional
	public List<Know> findKnow(Map map){
		return adminMapper.findKnow(map);
	}

	@Transactional
	public int findCountKnow(Map map){
		return adminMapper.findCountKnow(map);
	}

	@Transactional
	public void addKnow(Know know){
		adminMapper.addKnow(know);
	}

	@Transactional
	public void updateKnow(Know know){
		adminMapper.updateKnow(know);
	}

	@Transactional
	public void deleteKnow(String knowledgeid){
		adminMapper.deleteKnow(knowledgeid);
	}

}
