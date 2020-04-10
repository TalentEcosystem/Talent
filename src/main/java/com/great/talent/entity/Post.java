package com.great.talent.entity;

public class Post
{
	private int postid;
	private String postname;
	private int industryid;
	private String indname;
	private String poststate;

	public Post()
	{
	}

	public int getPostid()
	{
		return postid;
	}

	public void setPostid(int postid)
	{
		this.postid = postid;
	}

	public String getPostname()
	{
		return postname;
	}

	public void setPostname(String postname)
	{
		this.postname = postname;
	}

	public int getIndustryid()
	{
		return industryid;
	}

	public void setIndustryid(int industryid)
	{
		this.industryid = industryid;
	}

	public String getIndname()
	{
		return indname;
	}

	public void setIndname(String indname)
	{
		this.indname = indname;
	}

	public String getPoststate()
	{
		return poststate;
	}

	public void setPoststate(String poststate)
	{
		this.poststate = poststate;
	}

	@Override
	public String toString()
	{
		return "Post{" + "postid=" + postid + ", postname='" + postname + '\'' + ", industryid=" + industryid + ", indname='" + indname + '\'' + ", poststate='" + poststate + '\'' + '}';
	}
}
