package com.great.talent.entity;

public class Study
{


	/**
	 * 产品包id
	 * 产品包名
	 * 图片路径
	 * 课程路径
	 *播放量
	 * 讲师
	 */
	private int productid;
	private String proname;
	private String propic;
	private String prourl;
	private String period;
	private int procount;
	private String teachername;

	public Study()
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

	public String getPropic()
	{
		return propic;
	}

	public void setPropic(String propic)
	{
		this.propic = propic;
	}

	public String getProurl()
	{
		return prourl;
	}

	public void setProurl(String prourl)
	{
		this.prourl = prourl;
	}

	public int getProcount()
	{
		return procount;
	}

	public void setProcount(int procount)
	{
		this.procount = procount;
	}

	public String getPeriod()
	{
		return period;
	}

	public void setPeriod(String period)
	{
		this.period = period;
	}

	public String getTeachername()
	{
		return teachername;
	}

	public void setTeachername(String teachername)
	{
		this.teachername = teachername;
	}

	@Override
	public String toString()
	{
		return "Study{" + "productid=" + productid + ", proname='" + proname + '\'' + ", propic='" + propic + '\'' + ", prourl='" + prourl + '\'' + ", period='" + period + '\'' + ", procount=" + procount + ", teachername='" + teachername + '\'' + '}';
	}
}
