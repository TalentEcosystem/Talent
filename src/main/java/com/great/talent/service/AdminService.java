package com.great.talent.service;

import com.great.talent.entity.*;
import com.great.talent.mapper.AdminMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import javax.annotation.Resource;
import java.util.HashMap;
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

	@Transactional
	public List<RoleMenu> selectAllMenu(){ return adminMapper.selectAllMenu(); }

	@Transactional
	public List<RoleMenu> selectRoleMenu(String roleid){ return adminMapper.selectRoleMenu(roleid); }

	@Transactional
	public List<RoleMenu> selectParentMenu(List list){ return adminMapper.selectParentMenu(list); }

	@Transactional
	public List<String> selectChileMenu(String roleid){ return adminMapper.selectChileMenu(roleid); }

	@Transactional
	public List<String> selectNewMenu(List list){ return adminMapper.selectNewMenu(list); }

	@Transactional
	public void deleteMenu(String roleid){ adminMapper.deleteMenu(roleid); }

	@Transactional
	public void addMenu(List list){ adminMapper.addMenu(list); }

	@Transactional
	public void deleteFirst(Map map){ adminMapper.deleteFirst(map); }

	@Transactional
	public List<Parameter> findPara(Map map){ return adminMapper.findPara(map); }

	@Transactional
	public int findCountPara(Map map){ return adminMapper.findCountPara(map); }

	@Transactional
	public void updatePara(Parameter parameter){ adminMapper.updatePara(parameter); }

	@Transactional
	public void deletePara(String paraid){ adminMapper.deletePara(paraid); }

	@Transactional
	public void addPara(Parameter parameter){ adminMapper.addPara(parameter); }

	@Transactional
	public void addLog(SystemLog systemLog){ adminMapper.addLog(systemLog); }

	@Transactional
	public List<SystemLog> findLog(Map map){ return adminMapper.findLog(map); }

	@Transactional
	public int findCountLog(Map map){ return adminMapper.findCountLog(map); }

	/**
	 * 查询岗位管理查询条件下拉框的内容
	 * @return
	 */
	public List findPositionInfo(){
		List<Industry> industryList = adminMapper.findIndustry();
		return industryList;
	}
	/**
	 * 查询面试信息
	 * @param map
	 * @return
	 */
	public Map findInterview(HashMap map){
		Integer count = adminMapper.findInterviewNum(map);
		List<Interview> interviewList = adminMapper.findInterview(map);
		Map map1 = new HashMap();
		map1.put("count",count);
		map1.put("interviewList",interviewList);
		return map1;
	}

	public List<Interview> jobProgress(int interviewid){
		return adminMapper.jobProgress(interviewid);
	}

    @Transactional
	public int deleteIntervier(Interview interview){
		return adminMapper.deleteIntervier(interview);
	}

	@Transactional
	public void addAdmin(Admin admin){ adminMapper.addAdmin(admin);}

	@Transactional
	public void addSchool(SchoolMsg schoolMsg){ adminMapper.addSchool(schoolMsg);}

	@Transactional
	public void addSchoolAccount(Admin admin){ adminMapper.addSchoolAccount(admin);}
}
