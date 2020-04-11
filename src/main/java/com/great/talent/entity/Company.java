package com.great.talent.entity;

public class Company
{

	/**
	 * 企业名
	 * 企业图片
	 * 企业发布的招聘人数
	 */
	private String companyname;
	private String companypic;
	private int num;

	public Company()
	{
	}

	public Company(String companyname, String companypic, int num)
	{
		this.companyname = companyname;
		this.companypic = companypic;
		this.num = num;
	}

	public String getCompanyname()
	{
		return companyname;
	}

	public void setCompanyname(String companyname)
	{
		this.companyname = companyname;
	}

	public String getCompanypic()
	{
		return companypic;
	}

	public void setCompanypic(String companypic)
	{
		this.companypic = companypic;
	}

	public int getNum()
	{
		return num;
	}

	public void setNum(int num)
	{
		this.num = num;
	}

	@Override
	public String toString()
	{
		return "Company{" + "companyname='" + companyname + '\'' + ", companypic='" + companypic + '\'' + ", num=" + num + '}';
	}
}
