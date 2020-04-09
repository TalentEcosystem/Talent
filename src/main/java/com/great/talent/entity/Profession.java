package com.great.talent.entity;

public class Profession {
    private Integer professid;
    private String professname;

    public Profession() {
    }

    public Profession(Integer professid, String professname) {
        this.professid = professid;
        this.professname = professname;
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

    @Override
    public String toString() {
        return "Profession{" +
                "professid=" + professid +
                ", professname='" + professname + '\'' +
                '}';
    }
}
