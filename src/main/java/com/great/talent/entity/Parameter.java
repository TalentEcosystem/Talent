package com.great.talent.entity;

public class Parameter
{
	private int paraid;
	private String paraname;
	private String paratype;
	private String paravalue;
	private String parastate;

	public Parameter()
	{
	}

	public int getParaid()
	{
		return paraid;
	}

	public void setParaid(int paraid)
	{
		this.paraid = paraid;
	}

	public String getParaname()
	{
		return paraname;
	}

	public void setParaname(String paraname)
	{
		this.paraname = paraname;
	}

	public String getParatype()
	{
		return paratype;
	}

	public void setParatype(String paratype)
	{
		this.paratype = paratype;
	}

	public String getParavalue()
	{
		return paravalue;
	}

	public void setParavalue(String paravalue)
	{
		this.paravalue = paravalue;
	}

	public String getParastate()
	{
		return parastate;
	}

	public void setParastate(String parastate)
	{
		this.parastate = parastate;
	}

	@Override
	public String toString()
	{
		return "Parameter{" + "paraid=" + paraid + ", paraname='" + paraname + '\'' + ", paratype='" + paratype + '\'' + ", paravalue='" + paravalue + '\'' + ", parastate='" + parastate + '\'' + '}';
	}
}
