package com.great.talent.entity;

import java.util.Date;

public class Position {
    private Integer positionid;
    private Integer aid;//发布者
    private String name;
    private String positionname;//岗位名称
    private String maxnum;//招聘人数
    private String positionexper;//工作经验
    private String request;//要求
    private String money;
    private String positionaddress;//工作地址
    private String positioncontent;//工作内容
    private String positionstate;//发布状态
    private Integer industryid;//行业id
    private String indname;
    private Integer degreeid;
    private String degreename;
    private Integer professid;
    private String professname;
    private Date positiontime;

    public Position() {
    }

    public Position(Integer positionid, Integer aid, String positionname, String maxnum, String positionexper, String request, String money, String positionaddress, String positioncontent, String positionstate) {
        this.positionid = positionid;
        this.aid = aid;
        this.positionname = positionname;
        this.maxnum = maxnum;
        this.positionexper = positionexper;
        this.request = request;
        this.money = money;
        this.positionaddress = positionaddress;
        this.positioncontent = positioncontent;
        this.positionstate = positionstate;
    }

    public String getIndname() {
        return indname;
    }

    public void setIndname(String indname) {
        this.indname = indname;
    }

    public Integer getDegreeid() {
        return degreeid;
    }

    public void setDegreeid(Integer degreeid) {
        this.degreeid = degreeid;
    }

    public String getDegreename() {
        return degreename;
    }

    public void setDegreename(String degreename) {
        this.degreename = degreename;
    }

    public Integer getProfessid() {
        return professid;
    }

    public void setProfessid(Integer professid) {
        this.professid = professid;
    }

    public String getProfessname() {
        return professname;
    }

    public void setProfessname(String professname) {
        this.professname = professname;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getPositiontime() {
        return positiontime;
    }

    public void setPositiontime(Date positiontime) {
        this.positiontime = positiontime;
    }

    public Integer getIndustryid() {
        return industryid;
    }

    public void setIndustryid(Integer industryid) {
        this.industryid = industryid;
    }


    public Integer getPositionid() {
        return positionid;
    }

    public void setPositionid(Integer positionid) {
        this.positionid = positionid;
    }

    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public String getPositionname() {
        return positionname;
    }

    public void setPositionname(String positionname) {
        this.positionname = positionname;
    }

    public String getMaxnum() {
        return maxnum;
    }

    public void setMaxnum(String maxnum) {
        this.maxnum = maxnum;
    }

    public String getPositionexper() {
        return positionexper;
    }

    public void setPositionexper(String positionexper) {
        this.positionexper = positionexper;
    }

    public String getRequest() {
        return request;
    }

    public void setRequest(String request) {
        this.request = request;
    }

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money;
    }

    public String getPositionaddress() {
        return positionaddress;
    }

    public void setPositionaddress(String positionaddress) {
        this.positionaddress = positionaddress;
    }

    public String getPositioncontent() {
        return positioncontent;
    }

    public void setPositioncontent(String positioncontent) {
        this.positioncontent = positioncontent;
    }

    public String getPositionstate() {
        return positionstate;
    }

    public void setPositionstate(String positionstate) {
        this.positionstate = positionstate;
    }

    @Override
    public String toString() {
        return "Position{" +
                "positionid=" + positionid +
                ", aid=" + aid +
                ", name='" + name + '\'' +
                ", positionname='" + positionname + '\'' +
                ", maxnum='" + maxnum + '\'' +
                ", positionexper='" + positionexper + '\'' +
                ", request='" + request + '\'' +
                ", money='" + money + '\'' +
                ", positionaddress='" + positionaddress + '\'' +
                ", positioncontent='" + positioncontent + '\'' +
                ", positionstate='" + positionstate + '\'' +
                ", industryid=" + industryid +
                ", industryname='" + indname + '\'' +
                ", degreeid=" + degreeid +
                ", degreename='" + degreename + '\'' +
                ", professid=" + professid +
                ", professname='" + professname + '\'' +
                ", positiontime=" + positiontime +
                '}';
    }
}