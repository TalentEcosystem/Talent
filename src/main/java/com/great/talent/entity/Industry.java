package com.great.talent.entity;

public class Industry {
    private Integer industryid;
    private String indname;

    public Industry() {
    }

    public Industry(Integer industryid, String indname) {
        this.industryid = industryid;
        this.indname = indname;
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

    @Override
    public String toString() {
        return "Industry{" +
                "inudstryid=" + industryid +
                ", inudstryname='" + indname + '\'' +
                '}';
    }
}
