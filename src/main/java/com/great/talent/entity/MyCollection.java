package com.great.talent.entity;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class MyCollection
{
	private String indname;
	private String companyname;
	private String positionname;
	private Date positiontime;
	private int uid;
	private int positionid;

	public MyCollection() { }

	public int getUid()
	{
		return uid;
	}

	public void setUid(int uid)
	{
		this.uid = uid;
	}

	public int getPositionid()
	{
		return positionid;
	}

	public void setPositionid(int positionid)
	{
		this.positionid = positionid;
	}

	public String getIndname()
	{
		return indname;
	}

	public void setIndname(String indname)
	{
		this.indname = indname;
	}

	public String getCompanyname()
	{
		return companyname;
	}

	public void setCompanyname(String companyname)
	{
		this.companyname = companyname;
	}

	public String getPositionname()
	{
		return positionname;
	}

	public void setPositionname(String positionname)
	{
		this.positionname = positionname;
	}

	public Date getPositiontime()
	{
		return positiontime;
	}

	public void setPositiontime(Date positiontime)
	{
		this.positiontime = positiontime;
	}

	@Override
	public String toString()
	{
		return "MyCollection{" + "indname='" + indname + '\'' + ", companyname='" + companyname + '\'' + ", positionname='" + positionname + '\'' + ", positiontime=" + positiontime + ", uid=" + uid + ", positionid=" + positionid + '}';
	}
}
