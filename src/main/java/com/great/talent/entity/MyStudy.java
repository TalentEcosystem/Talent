package com.great.talent.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.Date;

public class MyStudy
{
	private String proname;
	private String period;
	private Date studytime;
	private String propic;
	private int productid;
	private String studytime2;//yyyy-MM-dd HH:mm:ss格式的时间

	public MyStudy()
	{
	}

	public String getStudytime2()
	{
		return studytime2;
	}

	public void setStudytime2(String studytime2)
	{
		this.studytime2 = studytime2;
	}

	public String getProname()
	{
		return proname;
	}

	public void setProname(String proname)
	{
		this.proname = proname;
	}

	public String getPeriod()
	{
		return period;
	}

	public void setPeriod(String period)
	{
		this.period = period;
	}

	public Date getStudytime()
	{
		return studytime;
	}

	public void setStudytime(Date studytime)
	{
		this.studytime = studytime;
	}

	public String getPropic()
	{
		return propic;
	}

	public void setPropic(String propic)
	{
		this.propic = propic;
	}

	public int getProductid()
	{
		return productid;
	}

	public void setProductid(int productid)
	{
		this.productid = productid;
	}

	@Override
	public String toString()
	{
		return "MyStudy{" + "proname='" + proname + '\'' + ", period='" + period + '\'' + ", studytime=" + studytime + ", propic='" + propic + '\'' + ", productid=" + productid + '}';
	}
}
