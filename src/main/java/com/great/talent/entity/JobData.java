package com.great.talent.entity;

import java.util.Date;

public class JobData
{
	private String positionname;
	private String positionaddress;
	private String money;
	private String maxnum;
	private String degreename;
	private String positionexper;
	private Date positiontime;
	private String request;
	private String positioncontent;
	private String companyname;
	private String indname;
	private String companyadd;
	private String companynature;
	private String companypro;
	private int companynum;
	private String companypic;
	private int positionid;

	public JobData()
	{
	}

	public int getPositionid()
	{
		return positionid;
	}

	public void setPositionid(int positionid)
	{
		this.positionid = positionid;
	}

	public String getCompanypic()
	{
		return companypic;
	}

	public void setCompanypic(String companypic)
	{
		this.companypic = companypic;
	}

	public String getPositionname()
	{
		return positionname;
	}

	public void setPositionname(String positionname)
	{
		this.positionname = positionname;
	}

	public String getPositionaddress()
	{
		return positionaddress;
	}

	public void setPositionaddress(String positionaddress)
	{
		this.positionaddress = positionaddress;
	}

	public String getMoney()
	{
		return money;
	}

	public void setMoney(String money)
	{
		this.money = money;
	}

	public String getMaxnum()
	{
		return maxnum;
	}

	public void setMaxnum(String maxnum)
	{
		this.maxnum = maxnum;
	}

	public String getDegreename()
	{
		return degreename;
	}

	public void setDegreename(String degreename)
	{
		this.degreename = degreename;
	}

	public String getPositionexper()
	{
		return positionexper;
	}

	public void setPositionexper(String positionexper)
	{
		this.positionexper = positionexper;
	}

	public Date getPositiontime()
	{
		return positiontime;
	}

	public void setPositiontime(Date positiontime)
	{
		this.positiontime = positiontime;
	}

	public String getRequest()
	{
		return request;
	}

	public void setRequest(String request)
	{
		this.request = request;
	}

	public String getPositioncontent()
	{
		return positioncontent;
	}

	public void setPositioncontent(String positioncontent)
	{
		this.positioncontent = positioncontent;
	}

	public String getCompanyname()
	{
		return companyname;
	}

	public void setCompanyname(String companyname)
	{
		this.companyname = companyname;
	}

	public String getIndname()
	{
		return indname;
	}

	public void setIndname(String indname)
	{
		this.indname = indname;
	}

	public String getCompanyadd()
	{
		return companyadd;
	}

	public void setCompanyadd(String companyadd)
	{
		this.companyadd = companyadd;
	}

	public String getCompanynature()
	{
		return companynature;
	}

	public void setCompanynature(String companynature)
	{
		this.companynature = companynature;
	}

	public String getCompanypro()
	{
		return companypro;
	}

	public void setCompanypro(String companypro)
	{
		this.companypro = companypro;
	}

	public int getCompanynum()
	{
		return companynum;
	}

	public void setCompanynum(int companynum)
	{
		this.companynum = companynum;
	}

	@Override
	public String toString()
	{
		return "JobData{" + "positionname='" + positionname + '\'' + ", positionaddress='" + positionaddress + '\'' + ", money='" + money + '\'' + ", maxnum='" + maxnum + '\'' + ", degreename='" + degreename + '\'' + ", positionexper='" + positionexper + '\'' + ", positiontime=" + positiontime + ", request='" + request + '\'' + ", positioncontent='" + positioncontent + '\'' + ", companyname='" + companyname + '\'' + ", indname='" + indname + '\'' + ", companyadd='" + companyadd + '\'' + ", companynature='" + companynature + '\'' + ", companypro='" + companypro + '\'' + ", companynum=" + companynum + '}';
	}
}
