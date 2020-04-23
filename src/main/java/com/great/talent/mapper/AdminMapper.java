package com.great.talent.mapper;

import com.great.talent.entity.*;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

@Mapper
public interface AdminMapper {
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

	public List<Parameter> findPara(Map map);

	public int findCountPara(Map map);

	public void updatePara(Parameter parameter);

	public void deletePara(@Param("paraid") String paraid);

	public void addPara(Parameter parameter);

	public void addLog(SystemLog systemLog);

	public List<SystemLog> findLog(Map map);

	public int findCountLog(Map map);

	/**
	 * 查询行业
	 *
	 * @return
	 */
	@Select("select * from tbl_industry")
	public List<Industry> findIndustry();

	public List<Interview> findInterview(Map map);//查询面试信息

	public int findInterviewNum(Map map);//查询面试信息数量

	@Select("select * from tbl_interview where interviewid = #{interviewid} ")
	public List<Interview> jobProgress(int interviewid);//查询求职进度

	public void addAdmin(Admin admin);

	public void addSchool(SchoolMsg schoolMsg);

	public void addSchoolAccount(Admin admin);

	public List<Know> findAllKnow();

	public List<Chapter> findChapter(Map map);

	public int findCountChapter(Map map);

	public void addChapter(Chapter chapter);

	public void deleteChapter(@Param("chapterid") String chapterid);

	public void updateChapter(Chapter chapter);

	public List<Product> findProduct(Map map);

	public int findCountProduct(Map map);

	public void addProduct(Product product);

	public void openProduct(@Param("productid") String productid);

	public void deleteProduct(@Param("productid") String productid);

	public void updateProduct(Product product);

	public List<Config> findConfigKnow(@Param("domainid") String domainid);

	public List<Config> findConfigChapter(@Param("knowledgeid") String knowledgeid);

	public List<Config> hasConfig(@Param("productid") String productid);

	public void deleteConfig(@Param("productid") String productid);

	public void configChapter(List list);

	public void addCount(@Param("chapterid") String chapterid);
}
