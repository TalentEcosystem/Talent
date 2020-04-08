package com.great.talent.mapper;

import com.great.talent.entity.*;
import com.sun.tools.corba.se.idl.InterfaceGen;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import javax.swing.*;
import java.util.List;
import java.util.Map;

@Mapper
public interface EnterpriseMapper {
    public Admin adminLogin(String account);
    public List<Position> findPosition(Map map);
    public Integer findPositionNum(Map map);
    @Select("select * from tbl_degree")
    public List<Degree> findDegree();

    @Select("select * from tbl_industry")
    public List<Industry> findIndustry();

    @Select("select * from tbl_profession")
    public List<Profession> findProfession();


}
