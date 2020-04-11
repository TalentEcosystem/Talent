package com.great.talent.entity;
/*
学校信息的实体类
 */
public class SchoolMsg
{
	private int sid;
	private String schoolname;
	private String schoolinfo;
	private String schoolpic;

	public SchoolMsg()
	{
	}

	public int getSid()
	{
		return sid;
	}

	public void setSid(int sid)
	{
		this.sid = sid;
	}

	public String getSchoolname()
	{
		return schoolname;
	}

	public void setSchoolname(String schoolname)
	{
		this.schoolname = schoolname;
	}

	public String getSchoolinfo()
	{
		return schoolinfo;
	}

	public void setSchoolinfo(String schoolinfo)
	{
		this.schoolinfo = schoolinfo;
	}

	public String getSchoolpic()
	{
		return schoolpic;
	}

	public void setSchoolpic(String schoolpic)
	{
		this.schoolpic = schoolpic;
	}

	@Override
	public String toString()
	{
		return "SchoolMsg{" + "sid=" + sid + ", schoolname='" + schoolname + '\'' + ", schoolinfo='" + schoolinfo + '\'' + ", schoolpic='" + schoolpic + '\'' + '}';
	}
}
