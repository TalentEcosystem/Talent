package com.great.talent.entity;

import java.util.Date;

public class Finance {//财务管理
    private Integer financeid;

    private Integer cid;//公司id

    private String companyname;//公司名称

    private Integer price;//金额

    private String financetype;//操作事项

    private Date financetime;//操作时间

    private String tradeno; //支付宝订单号

    private String financestate;//订单状态

    private int resumeid;

    public int getResumeid() {
        return resumeid;
    }

    public void setResumeid(int resumeid) {
        this.resumeid = resumeid;
    }

    public String getTradeno() {
        return tradeno;
    }

    public void setTradeno(String tradeno) {
        this.tradeno = tradeno;
    }

    public String getFinancestate() {
        return financestate;
    }

    public void setFinancestate(String financestate) {
        this.financestate = financestate;
    }

    public Integer getFinanceid() {
        return financeid;
    }

    public void setFinanceid(Integer financeid) {
        this.financeid = financeid;
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

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public String getFinancetype() {
        return financetype;
    }

    public void setFinancetype(String financetype) {
        this.financetype = financetype == null ? null : financetype.trim();
    }

    public Date getFinancetime() {
        return financetime;
    }

    public void setFinancetime(Date financetime) {
        this.financetime = financetime;
    }


    @Override
    public String toString() {
        return "Finance{" +
                "financeid=" + financeid +
                ", cid=" + cid +
                ", companyname='" + companyname + '\'' +
                ", price=" + price +
                ", financetype='" + financetype + '\'' +
                ", financetime=" + financetime +
                ", tradeno='" + tradeno + '\'' +
                ", financestate='" + financestate + '\'' +
                ", resumeid=" + resumeid +
                '}';
    }
}