package com.great.talent.mapper;

import com.great.talent.entity.*;
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
	public List<Admin> findCompany(Map map);
	public int findCountCompany(Map map);
	public void checkConfirm(@Param("aid") String aid);
	public void checkRefuse(@Param("aid") String aid);
	public List<RoleMenu> selectAllMenu();
	public List<RoleMenu> selectRoleMenu(@Param("roleid") String roleid);
	public List<RoleMenu> selectParentMenu(List list);
	public List<String> selectChileMenu(@Param("roleid") String roleid);
	public List<String> selectNewMenu(List list);
	public void deleteMenu(@Param("roleid") String roleid);
	public void addMenu(List list);
	public void deleteFirst(Map map);
}
