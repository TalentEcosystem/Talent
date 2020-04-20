package com.great.talent.entity;

import java.util.Date;

public class Product
{
	private int productid;
	private String proname;
	private Date starttime;
	private Date endtime;
	private String period;
	private int teacherid;
	private String teachername;
	private String teacherinfo;
	private String prourl;
	private String prointro;
	private String procontent;
	private int procount;
	private String prostate;
	private int domainid;
	private String propic;

	public Product()
	{
	}

	public int getProductid()
	{
		return productid;
	}

	public void setProductid(int productid)
	{
		this.productid = productid;
	}

	public String getProname()
	{
		return proname;
	}

	public void setProname(String proname)
	{
		this.proname = proname;
	}

	public Date getStarttime()
	{
		return starttime;
	}

	public void setStarttime(Date starttime)
	{
		this.starttime = starttime;
	}

	public Date getEndtime()
	{
		return endtime;
	}

	public void setEndtime(Date endtime)
	{
		this.endtime = endtime;
	}

	public String getPeriod()
	{
		return period;
	}

	public void setPeriod(String period)
	{
		this.period = period;
	}

	public int getTeacherid()
	{
		return teacherid;
	}

	public void setTeacherid(int teacherid)
	{
		this.teacherid = teacherid;
	}

	public String getTeachername()
	{
		return teachername;
	}

	public void setTeachername(String teachername)
	{
		this.teachername = teachername;
	}

	public String getTeacherinfo()
	{
		return teacherinfo;
	}

	public void setTeacherinfo(String teacherinfo)
	{
		this.teacherinfo = teacherinfo;
	}

	public String getProurl()
	{
		return prourl;
	}

	public void setProurl(String prourl)
	{
		this.prourl = prourl;
	}

	public String getProintro()
	{
		return prointro;
	}

	public void setProintro(String prointro)
	{
		this.prointro = prointro;
	}

	public String getProcontent()
	{
		return procontent;
	}

	public void setProcontent(String procontent)
	{
		this.procontent = procontent;
	}

	public int getProcount()
	{
		return procount;
	}

	public void setProcount(int procount)
	{
		this.procount = procount;
	}

	public String getProstate()
	{
		return prostate;
	}

	public void setProstate(String prostate)
	{
		this.prostate = prostate;
	}

	public int getDomainid()
	{
		return domainid;
	}

	public void setDomainid(int domainid)
	{
		this.domainid = domainid;
	}

	public String getPropic()
	{
		return propic;
	}

	public void setPropic(String propic)
	{
		this.propic = propic;
	}

}
