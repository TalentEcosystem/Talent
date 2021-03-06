package com.great.talent.entity;

import com.sun.tools.corba.se.idl.InterfaceGen;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.util.Date;
//面试信息表
@Component(value = "Interview")
@Scope("prototype")
public class Interview {
    private Integer interviewid;
    private Integer uid;//用户id
    private String uname;//用户姓名
    private String utel;//用户手机号码
    private String degreename;
    private String professid;//专业id
    private String professname;//专业名称;
    private Integer positionid;//岗位id
    private String positionname;//岗位名称
    private Integer industryid;//行业id
    private String indname;//行业名称
    private Integer sid;//学校id
    private String schoolname;//学校名称
    private String presenter;//推荐者
    private String check;//是否查看
    private String invate;//是否邀请
    private String interstate;//是否面试
    private String employ;//是否录用
    private Date intertime;//投递时间
    private Date endtime;//回复时间
    private Integer applicantsnum;//已应聘人数
    private String reset;//简历隐私设置
    private Integer resumeid;//面试表id
    private Date operationtime;


    public Date getOperationtime() {
        return operationtime;
    }

    public void setOperationtime(Date operationtime) {
        this.operationtime = operationtime;
    }

    public Integer getResumeid() {
        return resumeid;
    }

    public void setResumeid(Integer resumeid) {
        this.resumeid = resumeid;
    }


    public String getReset() {
        return reset;
    }

    public void setReset(String reset) {
        this.reset = reset;
    }

    public String getDegreename() {
        return degreename;
    }

    public void setDegreename(String degreename) {
        this.degreename = degreename;
    }

    public String getPresenter() {
        return presenter;
    }

    public void setPresenter(String presenter) {
        this.presenter = presenter;
    }

    public String getProfessid() {
        return professid;
    }

    public void setProfessid(String professid) {
        this.professid = professid;
    }

    public String getProfessname() {
        return professname;
    }

    public void setProfessname(String professname) {
        this.professname = professname;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUtel() {
        return utel;
    }

    public void setUtel(String utel) {
        this.utel = utel;
    }

    public String getPositionname() {
        return positionname;
    }

    public void setPositionname(String positionname) {
        this.positionname = positionname;
    }

    public Integer getIndustryid() {
        return industryid;
    }

    public void setIndustryid(Integer industryid) {
        this.industryid = industryid;
    }

    public String getIndname() {
        return indname;
    }

    public void setIndname(String indname) {
        this.indname = indname;
    }

    public String getSchoolname() {
        return schoolname;
    }

    public void setSchoolname(String schoolname) {
        this.schoolname = schoolname;
    }

    public Integer getApplicantsnum() {
        return applicantsnum;
    }

    public void setApplicantsnum(Integer applicantsnum) {
        this.applicantsnum = applicantsnum;
    }

    public Integer getInterviewid() {
        return interviewid;
    }

    public void setInterviewid(Integer interviewid) {
        this.interviewid = interviewid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getPositionid() {
        return positionid;
    }

    public void setPositionid(Integer positionid) {
        this.positionid = positionid;
    }

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public String getCheck() {
        return check;
    }

    public void setCheck(String check) {
        this.check = check == null ? null : check.trim();
    }

    public String getInvate() {
        return invate;
    }

    public void setInvate(String invate) {
        this.invate = invate == null ? null : invate.trim();
    }

    public String getInterstate() {
        return interstate;
    }

    public void setInterstate(String interstate) {
        this.interstate = interstate == null ? null : interstate.trim();
    }

    public String getEmploy() {
        return employ;
    }

    public void setEmploy(String employ) {
        this.employ = employ == null ? null : employ.trim();
    }

    public Date getIntertime() {
        return intertime;
    }

    public void setIntertime(Date intertime) {
        this.intertime = intertime;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    @Override
    public String toString() {
        return "Interview{" +
                "interviewid=" + interviewid +
                ", uid=" + uid +
                ", uname='" + uname + '\'' +
                ", utel='" + utel + '\'' +
                ", degreename='" + degreename + '\'' +
                ", professid='" + professid + '\'' +
                ", professname='" + professname + '\'' +
                ", positionid=" + positionid +
                ", positionname='" + positionname + '\'' +
                ", industryid=" + industryid +
                ", indname='" + indname + '\'' +
                ", sid=" + sid +
                ", schoolname='" + schoolname + '\'' +
                ", presenter='" + presenter + '\'' +
                ", check='" + check + '\'' +
                ", invate='" + invate + '\'' +
                ", interstate='" + interstate + '\'' +
                ", employ='" + employ + '\'' +
                ", intertime=" + intertime +
                ", endtime=" + endtime +
                ", applicantsnum=" + applicantsnum +
                ", reset='" + reset + '\'' +
                ", resumeid=" + resumeid +
                ", operationtime=" + operationtime +
                '}';
    }
}