package com.great.talent.mapper;

import com.great.talent.entity.Industry;
import com.great.talent.entity.Know;
import com.great.talent.entity.Post;
import com.great.talent.entity.User;
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
	public List<User> findUser(Map map);
	public int findCountUser(Map map);
	public void userForbid(@Param("uid") String uid);
	public void userEnable(@Param("uid") String uid);
	public List<Industry> findAllIndustry();
	public List<Post> findPost(Map map);
	public int findCountPost(Map map);
	public void addPost(Post post);
	public void updatePost(Post post);
	public void deletePost(@Param("postid") String postid);
}
