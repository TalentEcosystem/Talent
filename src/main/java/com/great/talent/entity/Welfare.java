package com.great.talent.entity;

public class Welfare
{
	private int welfareid;
	private String welname;
	private int positionid;

	public Welfare()
	{
	}

	public int getWelfareid()
	{
		return welfareid;
	}

	public void setWelfareid(int welfareid)
	{
		this.welfareid = welfareid;
	}

	public String getWelname()
	{
		return welname;
	}

	public void setWelname(String welname)
	{
		this.welname = welname;
	}

	public int getPositionid()
	{
		return positionid;
	}

	public void setPositionid(int positionid)
	{
		this.positionid = positionid;
	}

	@Override
	public String toString()
	{
		return "Welfare{" + "welfareid=" + welfareid + ", welname='" + welname + '\'' + ", positionid=" + positionid + '}';
	}
}
