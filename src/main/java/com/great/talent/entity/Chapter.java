package com.great.talent.entity;

public class Chapter
{
	private int chapterid;
	private String chname;
	private int chcount;
	private String chintro;
	private int upchapterid;
	private String uploadname;
	private String chapurl;
	private String chaptime;
	private int knowledgeid;
	private int productid;
	private String chapstate;
	private String knowname;

	public Chapter()
	{
	}

	public Chapter(int chapterid, int productid)
	{
		this.chapterid = chapterid;
		this.productid = productid;
	}

	public int getChapterid()
	{
		return chapterid;
	}

	public void setChapterid(int chapterid)
	{
		this.chapterid = chapterid;
	}

	public String getChname()
	{
		return chname;
	}

	public void setChname(String chname)
	{
		this.chname = chname;
	}

	public int getChcount()
	{
		return chcount;
	}

	public void setChcount(int chcount)
	{
		this.chcount = chcount;
	}

	public String getChintro()
	{
		return chintro;
	}

	public void setChintro(String chintro)
	{
		this.chintro = chintro;
	}

	public int getUpchapterid()
	{
		return upchapterid;
	}

	public void setUpchapterid(int upchapterid)
	{
		this.upchapterid = upchapterid;
	}

	public String getUploadname()
	{
		return uploadname;
	}

	public void setUploadname(String uploadname)
	{
		this.uploadname = uploadname;
	}

	public String getChapurl()
	{
		return chapurl;
	}

	public void setChapurl(String chapurl)
	{
		this.chapurl = chapurl;
	}

	public String getChaptime()
	{
		return chaptime;
	}

	public void setChaptime(String chaptime)
	{
		this.chaptime = chaptime;
	}

	public int getKnowledgeid()
	{
		return knowledgeid;
	}

	public void setKnowledgeid(int knowledgeid)
	{
		this.knowledgeid = knowledgeid;
	}

	public int getProductid()
	{
		return productid;
	}

	public void setProductid(int productid)
	{
		this.productid = productid;
	}

	public String getChapstate()
	{
		return chapstate;
	}

	public void setChapstate(String chapstate)
	{
		this.chapstate = chapstate;
	}

	public String getKnowname()
	{
		return knowname;
	}

	public void setKnowname(String knowname)
	{
		this.knowname = knowname;
	}

	@Override
	public String toString()
	{
		return "Chapter{" + "chapterid=" + chapterid + ", chname='" + chname + '\'' + ", chcount=" + chcount + ", chintro='" + chintro + '\'' + ", upchapterid=" + upchapterid + ", uploadname='" + uploadname + '\'' + ", chapurl='" + chapurl + '\'' + ", chaptime='" + chaptime + '\'' + ", knowledgeid=" + knowledgeid + ", productid=" + productid + ", chapstate='" + chapstate + '\'' + ", knowname='" + knowname + '\'' + '}';
	}
}
