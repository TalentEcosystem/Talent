package com.great.talent.entity;

import java.util.Date;

public class Admin {
    private Integer aid;
    private String account;
    private String password;
    private Integer roleid;
    private String name;
    private String tel;
    private String state;
    private String address;
    private Integer cid;
    private Integer sid;
    private String permit;
    private Date date;
    private Integer money;
    private String payment;
    private String code;
    private Role role;
    private String companyname;


    public Admin() {
    }

    public Admin(Integer aid, String account, String password, Integer roleid, String name, String tel, String state, String address, Integer cid, Integer sid, String permit, Date date, Integer money) {
        this.aid = aid;
        this.account = account;
        this.password = password;
        this.roleid = roleid;
        this.name = name;
        this.tel = tel;
        this.state = state;
        this.address = address;
        this.cid = cid;
        this.sid = sid;
        this.permit = permit;
        this.date = date;
        this.money = money;
    }

    public String getPayment() {
        return payment;
    }

    public void setPayment(String payment) {
        this.payment = payment;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Integer getRoleid() {
        return roleid;
    }

    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public String getPermit() {
        return permit;
    }

    public void setPermit(String permit) {
        this.permit = permit;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Integer getMoney() {
        return money;
    }

    public void setMoney(Integer money) {
        this.money = money;
    }

    public String getCompanyname()
    {
        return companyname;
    }

    public void setCompanyname(String companyname)
    {
        this.companyname = companyname;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "aid=" + aid +
                ", account='" + account + '\'' +
                ", password='" + password + '\'' +
                ", roleid=" + roleid +
                ", name='" + name + '\'' +
                ", tel='" + tel + '\'' +
                ", state='" + state + '\'' +
                ", address='" + address + '\'' +
                ", cid=" + cid +
                ", sid=" + sid +
                ", permit='" + permit + '\'' +
                ", date=" + date +
                ", money=" + money +
                ", payment='" + payment + '\'' +
                ", code='" + code + '\'' +
                ", role=" + role +
                ", companyname='" + companyname + '\'' +
                '}';
    }
}
