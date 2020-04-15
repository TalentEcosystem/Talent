package com.great.talent.entity;

/**
 * @author 小和
 * 用户端简历查看情况的实体类
 */
public class ResumeStatus
{
	private int interviewid;
	private String positionname;
	private String companyname;
	private String companynature;

	public ResumeStatus()
	{
	}

	public int getInterviewid()
	{
		return interviewid;
	}

	public void setInterviewid(int interviewid)
	{
		this.interviewid = interviewid;
	}

	public String getPositionname()
	{
		return positionname;
	}

	public void setPositionname(String positionname)
	{
		this.positionname = positionname;
	}

	public String getCompanyname()
	{
		return companyname;
	}

	public void setCompanyname(String companyname)
	{
		this.companyname = companyname;
	}

	public String getCompanynature()
	{
		return companynature;
	}

	public void setCompanynature(String companynature)
	{
		this.companynature = companynature;
	}

	@Override
	public String toString()
	{
		return "ResumeStatus{" + "interviewid=" + interviewid + ", positionname='" + positionname + '\'' + ", companyname='" + companyname + '\'' + ", companynature='" + companynature + '\'' + '}';
	}
}
