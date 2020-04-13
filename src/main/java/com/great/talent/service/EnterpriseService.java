package com.great.talent.service;

import com.great.talent.entity.*;
import com.great.talent.mapper.EnterpriseMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class EnterpriseService {
    @Resource
    private EnterpriseMapper enterpriseMapper;

    /**
     * 管理员，高校，企业人员登录
     * @param account
     * @return
     */
    public Admin adminLogin(String account){
        return enterpriseMapper.adminLogin(account);
    }

    /**
     * 校验手机号码
     * @param tel
     * @return
     */
    public Admin checkAdminTel(String tel){
        return enterpriseMapper.checkAdminTel(tel);
    }

    /**
     * 注册用户
     * @param admin
     * @return
     */
    @Transactional
    public int addAdmin(Admin admin){
         return enterpriseMapper.addAdmin(admin);
    }

    /**
     * 简易注册公司
     * @param company
     * @return
     */
    @Transactional
    public int addCompany(Company company){
        return enterpriseMapper.addCompany(company);
    }

    /**
     * 查询发布岗位记录
     * @param map
     * @return
     */
    public Map findPositions(HashMap map){
        Integer count = enterpriseMapper.findPositionNum(map);
        List<Position> positionList = enterpriseMapper.findPosition(map);
        Map map1 = new HashMap();
        map1.put("count",count);
        map1.put("positionList",positionList);
        return map1;
    }

    /**
     * 查询岗位管理查询条件下拉框的内容
     * @return
     */
    public Map findPositionInfo(){
        List<Degree> degreeList = enterpriseMapper.findDegree();
        List<Industry> industryList = enterpriseMapper.findIndustry();
        List<Profession> professionList = enterpriseMapper.findProfession();
        Map map = new HashMap();
        map.put("degreeList",degreeList);
        map.put("industryList",industryList);
        map.put("professionList",professionList);
        return map;
    }

    /**
     * 查询公司名
     * @param aid
     * @return
     */
    public String findCompanyName(Integer aid){
        return enterpriseMapper.findCompanyName(aid);
    }

    /**
     * 查询公司地址
     * @param cid
     * @return
     */
    public String findCompanyAdd(Integer cid){
        return enterpriseMapper.findCompanyAdd(cid);
    }
    /**
     * 通过行业查询岗位
     * @param industryid
     * @return
     */
    public List<Post> findPostName(Integer industryid){
        return enterpriseMapper.findPostName(industryid);
    }

    /**
     * 发布岗位
     * @param position
     * @return
     */
    @Transactional
    public int addPositionInfo(Position position){
        return enterpriseMapper.addPositionInfo(position);
    }

    /**
     * 添加福利
     * @param map
     * @return
     */
    @Transactional
    public int addWelfare(Map map){
        return enterpriseMapper.addWelfare(map);
    }

    /**
     * 查询福利
     * @param positionid
     * @return
     */
    public List<Position> findWelfName(Integer positionid){
        return enterpriseMapper.findWelfName(positionid);
    }

    /**
     * 修改发布岗位的状态
     * @param position
     * @return
     */
    @Transactional
    public int updatePositionState(Position position){
        return enterpriseMapper.updatePositionState(position);
    }

    /**
     * 删除修改福利
     * @param map
     * @return
     */
    @Transactional
    public int deleteWelfare(Map map){
        return enterpriseMapper.deleteWelfare(map);
    }

    /**
     * 查询公司的信息
     * @param aid
     * @return
     */
    public Company findCompanyInfo(Integer aid){
        return enterpriseMapper.findCompanyInfo(aid);
    }

    /**
     * 修改公司信息
     * @param company
     * @return
     */
    @Transactional
    public int updateCompanyInfo(Company company){
        return enterpriseMapper.updateCompanyInfo(company);
    }

    /**
     * 查询面试信息
     * @param map
     * @return
     */
    public Map findInterview(HashMap map){
        Integer count = enterpriseMapper.findInterviewNum(map);
        List<Interview> interviewList = enterpriseMapper.findInterview(map);
        Map map1 = new HashMap();
        map1.put("count",count);
        map1.put("interviewList",interviewList);
        return map1;
    }

    /**
     * 面试邀请
     * @param interview
     * @return
     */
    @Transactional
    public int updateInterInvate(Interview interview){
        return enterpriseMapper.updateInterInvate(interview);
    }

    /**
     * 查询反馈信息
     * @param map
     * @return
     */
    public Map findFeedbackInfo(Map map){
        Integer count = enterpriseMapper.findFeedbackNum(map);
        List<Interview> flist = enterpriseMapper.findFeedback(map);
        Map map1 = new HashMap();
        map1.put("count",count);
        map1.put("flist",flist);
        return map1;
    }

}

