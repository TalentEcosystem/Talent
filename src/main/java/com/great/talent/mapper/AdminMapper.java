package com.great.talent.mapper;

import com.great.talent.entity.Know;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface AdminMapper
{
	public List<Know> findKnow(Map map);
	public int findCountKnow(Map map);
	public void addKnow(Know know);
	public void updateKnow(Know know);
	public void deleteKnow(String knowledgeid);
}
