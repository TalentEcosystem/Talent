package com.great.talent.mapper;

import com.great.talent.entity.*;
import com.sun.tools.corba.se.idl.InterfaceGen;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import javax.swing.*;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Mapper
public interface EnterpriseMapper {

    public Admin adminLogin(String account);//登录
    public int addAdmin(Admin admin);//注册用户
    public int addCompany(Company company);//简易注册公司
    public List<Position> findPosition(Map map);//查询公司发布岗位记录
    public Integer findPositionNum(Map map);//查询岗位记录数量
    public int addPositionInfo(Position position);//添加岗位发布记录
    public int addWelfare(Map map);//添加福利
    public int updatePositionState(Position position);//修改记录信息
    public int deleteWelfare(Map map);//修改删除福利信息
    public Company findCompanyInfo(Integer aid);//查询公司信息
    public int updateCompanyInfo(Company company);//修改公司信息
    public List<Interview> findInterview(Map map);//查询面试信息
    public int findInterviewNum(Map map);//查询面试信息数量
    /**
     * 校验用户手机是否被注册
     * @param tel
     * @return
     */
    @Select("select * from tbl_admin where tel = #{tel}")
    public Admin checkAdminTel(String tel);


    /**
     * 查询公司名
     * @param aid
     * @return
     */
    @Select("select c.companyname from tbl_admin a,tbl_company c where a.cid = c.cid and a.aid = #{aid}")
    public String findCompanyName(Integer aid);

    /**
     * 查询学历
     * @return
     */
    @Select("select * from tbl_degree")
    public List<Degree> findDegree();

    /**
     * 查询行业
     * @return
     */
    @Select("select * from tbl_industry")
    public List<Industry> findIndustry();

    /**
     * 查询专业
     * @return
     */
    @Select("select * from tbl_profession")
    public List<Profession> findProfession();

    /**
     * 查询岗位
     * @param industryid
     * @return
     */
    @Select("select p.* from tbl_industry i,tbl_post p where i.industryid = p.industryid and i.industryid = #{industryid} and p.poststate ='正常'")
    public List<Post> findPostName(Integer industryid);

    /**
     * 查询福利
     * @param positionid
     * @return
     */
    @Select("select * from tbl_welfare where positionid = #{positionid}")
    public List<Position> findWelfName(Integer positionid);

    /**
     * 查询公司地址
     * @param cid
     * @return
     */
    @Select("select companyadd from tbl_company c,tbl_admin a where a.cid = c.cid and a.cid = #{cid}")
    public String findCompanyAdd(Integer cid);

}
