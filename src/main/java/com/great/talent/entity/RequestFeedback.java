package com.great.talent.entity;

public class RequestFeedback
{
	private String indname;
	private String companyname;
	private String positionname;
	private String companyphone;
	private String invate;

	public RequestFeedback() {
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

	public String getPositionname()
	{
		return positionname;
	}

	public void setPositionname(String positionname)
	{
		this.positionname = positionname;
	}

	public String getCompanyphone()
	{
		return companyphone;
	}

	public void setCompanyphone(String companyphone)
	{
		this.companyphone = companyphone;
	}

	public String getInvate()
	{
		return invate;
	}

	public void setInvate(String invate)
	{
		this.invate = invate;
	}

	@Override
	public String toString()
	{
		return "RequestFeedback{" + "indname='" + indname + '\'' + ", companyname='" + companyname + '\'' + ", positionname='" + positionname + '\'' + ", companyphone='" + companyphone + '\'' + ", invate='" + invate + '\'' + '}';
	}
}
