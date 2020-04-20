package com.great.talent.entity;

import java.util.Date;

public class Eva
{


	/**
	 * 评论id
	 * 用户ID
	 * 评论内容
	 * 评论时间
	 * 产品包id
	 * 	用户名
	 * 	头像
	 */
	private int evaid;
	private int uid;
	private String evainfo;
	private Date evatime;
	private int productid;

	private String uname;
	private String uhead;
	public Eva()
	{
	}

	public int getEvaid()
	{
		return evaid;
	}

	public void setEvaid(int evaid)
	{
		this.evaid = evaid;
	}

	public int getUid()
	{
		return uid;
	}

	public void setUid(int uid)
	{
		this.uid = uid;
	}

	public String getEvainfo()
	{
		return evainfo;
	}

	public void setEvainfo(String evainfo)
	{
		this.evainfo = evainfo;
	}

	public Date getEvatime()
	{
		return evatime;
	}

	public void setEvatime(Date evatime)
	{
		this.evatime = evatime;
	}

	public int getProductid()
	{
		return productid;
	}

	public void setProductid(int productid)
	{
		this.productid = productid;
	}

	public String getUname()
	{
		return uname;
	}

	public void setUname(String uname)
	{
		this.uname = uname;
	}

	public String getUhead()
	{
		return uhead;
	}

	public void setUhead(String uhead)
	{
		this.uhead = uhead;
	}

	@Override
	public String toString()
	{
		return "Eva{" + "evaid=" + evaid + ", uid=" + uid + ", evainfo='" + evainfo + '\'' + ", evatime=" + evatime + ", productid=" + productid + ", uname='" + uname + '\'' + ", uhead='" + uhead + '\'' + '}';
	}
}
