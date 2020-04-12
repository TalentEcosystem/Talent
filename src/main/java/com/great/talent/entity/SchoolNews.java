package com.great.talent.entity;

public class SchoolNews
{
	private String schoolname;

	private String schoolpic;
	private int num;

	public SchoolNews()
	{
	}

	public SchoolNews(String schoolname, String schoolpic, int num)
	{
		this.schoolname = schoolname;
		this.schoolpic = schoolpic;
		this.num = num;
	}

	public String getSchoolname()
	{
		return schoolname;
	}

	public void setSchoolname(String schoolname)
	{
		this.schoolname = schoolname;
	}



	public String getSchoolpic()
	{
		return schoolpic;
	}

	public void setSchoolpic(String schoolpic)
	{
		this.schoolpic = schoolpic;
	}

	public int getNum()
	{
		return num;
	}

	public void setNum(int num)
	{
		this.num = num;
	}

	@Override
	public String toString()
	{
		return "SchoolNews{" + "schoolname='" + schoolname + '\'' + ", schoolpic='" + schoolpic + '\'' + ", num=" + num + '}';
	}
}
