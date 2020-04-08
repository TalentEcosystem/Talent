package com.great.talent.entity;

public class Degree {
     private Integer degreeid;
     private String degreename;

    public Degree() {
    }

    public Degree(Integer degreeid, String degreename) {
        this.degreeid = degreeid;
        this.degreename = degreename;
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

    @Override
    public String toString() {
        return "Degree{" +
                "degreeid=" + degreeid +
                ", degreename='" + degreename + '\'' +
                '}';
    }
}
