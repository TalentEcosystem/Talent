package com.great.talent.entity;

import java.util.Date;

/**
 * @author 小和
 * 推荐人才页面的实体类
 */
public class Recommend
{
	private int cid;//企业id
	private Integer positionid;//企业发布岗位的id
	private String positionname;//岗位名称
	private String indname;//行业名称
	private String companyname;//发布人的企业名称
	private Date positiontime;//发布时间


	public Recommend()
	{
	}

	public int getCid()
	{
		return cid;
	}

	public void setCid(int cid)
	{
		this.cid = cid;
	}

	public Integer getPositionid()
	{
		return positionid;
	}

	public void setPositionid(Integer positionid)
	{
		this.positionid = positionid;
	}

	public String getPositionname()
	{
		return positionname;
	}

	public void setPositionname(String positionname)
	{
		this.positionname = positionname;
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
		return "Recommend{" + "cid=" + cid + ", positionid=" + positionid + ", positionname='" + positionname + '\'' + ", indname='" + indname + '\'' + ", companyname='" + companyname + '\'' + ", positiontime=" + positiontime + '}';
	}
}
