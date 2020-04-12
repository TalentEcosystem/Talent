package com.great.talent.service;

import com.great.talent.entity.*;
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

	@Transactional
	public List<User> findUser(Map map){
		return adminMapper.findUser(map);
	}

	@Transactional
	public int findCountUser(Map map){
		return adminMapper.findCountUser(map);
	}

	@Transactional
	public void userForbid(String uid){
		adminMapper.userForbid(uid);
	}

	@Transactional
	public void userEnable(String uid){
		adminMapper.userEnable(uid);
	}

	@Transactional
	public List<Industry> findAllIndustry(){
		return adminMapper.findAllIndustry();
	}

	@Transactional
	public List<Post> findPost(Map map){
		return adminMapper.findPost(map);
	}

	@Transactional
	public int findCountPost(Map map){
		return adminMapper.findCountPost(map);
	}

	@Transactional
	public void addPost(Post post){
		adminMapper.addPost(post);
	}

	@Transactional
	public void updatePost(Post post){
		adminMapper.updatePost(post);
	}

	@Transactional
	public void deletePost(String postid){
		adminMapper.deletePost(postid);
	}

	@Transactional
	public List<Admin> findCompany(Map map){
		return adminMapper.findCompany(map);
	}

	@Transactional
	public int findCountCompany(Map map){
		return adminMapper.findCountCompany(map);
	}

	@Transactional
	public void checkConfirm(String aid){
		adminMapper.checkConfirm(aid);
	}

	@Transactional
	public void checkRefuse(String aid){
		adminMapper.checkRefuse(aid);
	}

}
