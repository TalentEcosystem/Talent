package com.great.talent.util;

public class CensusUtil {
    private String name;
    private int count;

    public CensusUtil() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    @Override
    public String toString() {
        return "CensusUtil{" +
                "name='" + name + '\'' +
                ", count=" + count +
                '}';
    }
}
