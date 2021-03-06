package com.great.talent.mapper;

import com.great.talent.entity.*;
import com.sun.jdi.IntegerValue;
import com.sun.tools.corba.se.idl.InterfaceGen;
import javafx.geometry.Pos;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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
    public int updateInterInvate(Interview interview);//面试邀请

    public List<Interview> findFeedback(Map map);
    public int findFeedbackNum(Map map);

    public int JudgecompanyEmploy(Interview interview);//判断当前岗位是否招满
    public int updateInterstate(Interview interview);//已面试
    public int companyEmploy(Interview interview);//公司录用
    public int findCompanyEmployid(Interview interview);
    public int updateResumeInfo(int uid);
    public List<Interview> companyEmployInfo(Map map);//录用人员信息
    public int companyEmployInfoNum(Map map);//录用人员信息数量
    public int weekJobinfo(@Param("day") String day, @Param("companyid") int companyid);//周统计
    public int monthJobinfo(@Param("day") String day,@Param("day1") String day1, @Param("companyid") int companyid);//月统计

    public List<Resume> ScreeningResume(Map map);//筛选面试信息
    public Integer ScreeningResumeNum(Map map);//筛选面试数
    public int addInterViews(Interview interview);//面试邀请
    public int addFinances(Finance finance);//增加订单记录
    public int addCompanyMoney(Map map);//充值
    public List<Finance> findFinances(Map map);//查询订单
    public int findFinanceNum(Map map);//查询订单数
    public int findFinanceInterview(Map map);//查询是否有此订单
    public int purchaseResume(Finance finance);//购买简历
    public int reduceCompanyMoney(Admin admin);//账户支出
    public Resume outPutUserResume(Map map);//查找用户简历信息

    /**
     * 修改找回密码
     * @param admin
     * @return
     */
    @Update("update tbl_admin set password = #{password} where account = #{account}")
    public int updateAdmin(Admin admin);

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

    /**
     * 查询学校
     * @return
     */
    @Select("select * from tbl_school")
    public List<SchoolMsg> findSchool();

    /**
     * 查询还未招收满的岗位
     * @param aid
     * @return
     */
    @Select("select positionid,positionname from tbl_position where aid = #{aid} and applicantsnum < maxnum")
    public List<Position> findPositionName(Integer aid);

    /**
     * 增加岗位已招收人数
     * @param positionid
     * @return
     */
    @Update("update tbl_position set applicantsnum = applicantsnum +1 where positionid = #{positionid}")
    public int updateApplicantsnum(Integer positionid);

    /**
     * 账户金额充值
     * @param map
     * @return
     */
    @Update("update tbl_admin set money = money + #{money} where aid = #{aid}")
    public int EnterpriseRecharge(Map map);

    /**
     * 查询简历价格
     * @return
     */
    @Select("select paravalue from tbl_para where paraname = '简历价格'")
    public int findPrice();

    /**
     * 查询已经招满的岗位
     * @param aid
     * @return
     */
    @Select("select positionid from tbl_position where applicantsnum >= maxnum and aid = #{aid}")
    public List<Position> findMaxPosition(int aid);

    /**
     * 修改
     * @param positionid
     * @return
     */
    @Update("update tbl_position set positionstate = '已招满' where positionid = #{positionid}")
    public int updatePositionStates(int positionid);
}
