package com.great.talent.entity;

public class Know
{
	private int knowledgeid;
	private String knowname;
	private String knowintro;
	private int domainid;
	private String domainname;
	private String knowstate;

	public Know()
	{
	}

	public int getKnowledgeid()
	{
		return knowledgeid;
	}

	public void setKnowledgeid(int knowledgeid)
	{
		this.knowledgeid = knowledgeid;
	}

	public String getKnowname()
	{
		return knowname;
	}

	public void setKnowname(String knowname)
	{
		this.knowname = knowname;
	}

	public String getKnowintro()
	{
		return knowintro;
	}

	public void setKnowintro(String knowintro)
	{
		this.knowintro = knowintro;
	}

	public int getDomainid()
	{
		return domainid;
	}

	public void setDomainid(int domainid)
	{
		this.domainid = domainid;
	}

	public String getDomainname()
	{
		return domainname;
	}

	public void setDomainname(String domainname)
	{
		this.domainname = domainname;
	}

	public String getKnowstate()
	{
		return knowstate;
	}

	public void setKnowstate(String knowstate)
	{
		this.knowstate = knowstate;
	}

	@Override
	public String toString()
	{
		return "Know{" + "knowledgeid=" + knowledgeid + ", knowname='" + knowname + '\'' + ", knowintro='" + knowintro + '\'' + ", domainid=" + domainid + ", domainname='" + domainname + '\'' + ", knowstate='" + knowstate + '\'' + '}';
	}
}
