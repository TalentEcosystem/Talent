package com.great.talent.entity;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

/**
 * @author 小和
 * 简历中的教育背景实体类
 */
@Component(value = "Aducational")
@Scope("prototype")
public class Aducational
{
	private int aducationid;
	private int uid;
	//时间段
	private String adtime;
	//学校名称
	private String sname;
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

	public String getSname()
	{
		return sname;
	}

	public void setSname(String sname)
	{
		this.sname = sname;
	}

	public String getProfession()
	{
		return profession;
	}

	public void setProfession(String profession)
	{
		this.profession = profession;
	}

	public int getUid()
	{
		return uid;
	}

	public void setUid(int uid)
	{
		this.uid = uid;
	}

	@Override
	public String toString()
	{
		return "Aducational{" + "aducationid=" + aducationid + ", uid=" + uid + ", adtime='" + adtime + '\'' + ", sname='" + sname + '\'' + ", profession='" + profession + '\'' + '}';
	}
}
