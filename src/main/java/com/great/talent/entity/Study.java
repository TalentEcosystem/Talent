package com.great.talent.entity;

public class Study
{


	/**
	 * 课程名
	 * 图片路径
	 * 课程路径
	 *播放量
	 * 讲师
	 */
	private String proname;
	private String propic;
	private String prourl;
	private int procount;
	private String teachername;

	public Study()
	{
	}

	public Study(String proname, String propic, String prourl, int procount, String teachername)
	{
		this.proname = proname;
		this.propic = propic;
		this.prourl = prourl;
		this.procount = procount;
		this.teachername = teachername;
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
		return "Study{" + "proname='" + proname + '\'' + ", propic='" + propic + '\'' + ", prourl='" + prourl + '\'' + ", procount=" + procount + ", teachername='" + teachername + '\'' + '}';
	}
}
