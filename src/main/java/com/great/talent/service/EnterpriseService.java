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

    public String findCompanyName(Integer aid){
        return enterpriseMapper.findCompanyName(aid);
    }
    /**
     * 通过行业查询岗位
     * @param industryid
     * @return
     */
    public List<Post> findPostName(Integer industryid){
        return enterpriseMapper.findPostName(industryid);
    }
    @Transactional
    public int addPositionInfo(Position position){
        return enterpriseMapper.addPositionInfo(position);
    }
    @Transactional
    public int addWelfare(Map map){
        return enterpriseMapper.addWelfare(map);
    }
    public List<Position> findWelfName(Integer positionid){
        return enterpriseMapper.findWelfName(positionid);
    }

    @Transactional
    public int updatePositionState(Integer positionid){
        return enterpriseMapper.updatePositionState(positionid);
    }

}
