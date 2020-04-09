package com.great.talent.entity;

/**
 * @author 小和
 * 简历中的教育背景实体类
 */
public class Aducational
{
	private int aducationid;
	//时间段
	private String adtime;
	//学校名称
	private String schoolname;
	//专业
	private String profession;

	public Aducational()
	{
	}

	public int getAducationid()
	{
		return aducationid;
	}

	public void setAducationid(int aducationid)
	{
		this.aducationid = aducationid;
	}

	public String getAdtime()
	{
		return adtime;
	}

	public void setAdtime(String adtime)
	{
		this.adtime = adtime;
	}

	public String getSchoolname()
	{
		return schoolname;
	}

	public void setSchoolname(String schoolname)
	{
		this.schoolname = schoolname;
	}

	public String getProfession()
	{
		return profession;
	}

	public void setProfession(String profession)
	{
		this.profession = profession;
	}

	@Override
	public String toString()
	{
		return "Aducational{" + "aducationid=" + aducationid + ", adtime='" + adtime + '\'' + ", schoolname='" + schoolname + '\'' + ", profession='" + profession + '\'' + '}';
	}
}
