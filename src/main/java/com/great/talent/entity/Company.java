package com.great.talent.entity;

public class Company {
    private Integer cid;
    private String companyname;
    private String companyadd;
    private String companyphone;
    private String companypic;
    private String companypro;
    private String companynature;
    private Integer companynum;
    private String companybusiness;
    private String permit;
    private String company2;
    private int num;

    public Company() {
    }

    public Company(Integer cid, String companyname, String companyadd, String companyphone, String companypic, String companypro, String companynature, Integer companynum, String companybusiness, String permit, String company2) {
        this.cid = cid;
        this.companyname = companyname;
        this.companyadd = companyadd;
        this.companyphone = companyphone;
        this.companypic = companypic;
        this.companypro = companypro;
        this.companynature = companynature;
        this.companynum = companynum;
        this.companybusiness = companybusiness;
        this.permit = permit;
        this.company2 = company2;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getCompanyname() {
        return companyname;
    }

    public void setCompanyname(String companyname) {
        this.companyname = companyname == null ? null : companyname.trim();
    }

    public String getCompanyadd() {
        return companyadd;
    }

    public void setCompanyadd(String companyadd) {
        this.companyadd = companyadd == null ? null : companyadd.trim();
    }

    public String getCompanyphone() {
        return companyphone;
    }

    public void setCompanyphone(String companyphone) {
        this.companyphone = companyphone == null ? null : companyphone.trim();
    }

    public String getCompanypic() {
        return companypic;
    }

    public void setCompanypic(String companypic) {
        this.companypic = companypic == null ? null : companypic.trim();
    }

    public String getCompanypro() {
        return companypro;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public void setCompanypro(String companypro) {
        this.companypro = companypro == null ? null : companypro.trim();
    }

    public String getCompanynature() {
        return companynature;
    }

    public void setCompanynature(String companynature) {
        this.companynature = companynature == null ? null : companynature.trim();
    }

    public Integer getCompanynum() {
        return companynum;
    }

    public void setCompanynum(Integer companynum) {
        this.companynum = companynum;
    }

    public String getCompanybusiness() {
        return companybusiness;
    }

    public void setCompanybusiness(String companybusiness) {
        this.companybusiness = companybusiness == null ? null : companybusiness.trim();
    }

    public String getPermit() {
        return permit;
    }

    public void setPermit(String permit) {
        this.permit = permit == null ? null : permit.trim();
    }

    public String getCompany2() {
        return company2;
    }

    public void setCompany2(String company2) {
        this.company2 = company2 == null ? null : company2.trim();
    }

    @Override
    public String toString() {
        return "Company{" +
                "cid=" + cid +
                ", companyname='" + companyname + '\'' +
                ", companyadd='" + companyadd + '\'' +
                ", companyphone='" + companyphone + '\'' +
                ", companypic='" + companypic + '\'' +
                ", companypro='" + companypro + '\'' +
                ", companynature='" + companynature + '\'' +
                ", companynum=" + companynum +
                ", companybusiness='" + companybusiness + '\'' +
                ", permit='" + permit + '\'' +
                ", company2='" + company2 + '\'' +
                ", num=" + num +
                '}';
    }
}
