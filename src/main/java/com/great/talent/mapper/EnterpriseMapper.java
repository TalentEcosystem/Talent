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
    public Admin adminLogin(String account);
    public int addAdmin(Admin admin);
    public int addCompany(Map map);
    public List<Position> findPosition(Map map);
    public Integer findPositionNum(Map map);

    public int addPositionInfo(Position position);

    public int addWelfare(Map map);

    public int updatePositionState(Position position);

    public int deleteWelfare(Map map);
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

    @Select("select companyadd from tbl_company c,tbl_admin a where a.cid = c.cid and a.cid = #{cid}")
    public String findCompanyAdd(Integer cid);
}
