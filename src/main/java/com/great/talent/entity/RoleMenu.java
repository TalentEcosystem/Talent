package com.great.talent.entity;

public class RoleMenu
{
	private int menuid;
	private String mname;
	private String url;
	private int parentid;
	private int rolemenuid;
	private int roleid;

	public RoleMenu()
	{
	}

	public int getMenuid()
	{
		return menuid;
	}

	public void setMenuid(int menuid)
	{
		this.menuid = menuid;
	}

	public String getMname()
	{
		return mname;
	}

	public void setMname(String mname)
	{
		this.mname = mname;
	}

	public String getUrl()
	{
		return url;
	}

	public void setUrl(String url)
	{
		this.url = url;
	}

	public int getParentid()
	{
		return parentid;
	}

	public void setParentid(int parentid)
	{
		this.parentid = parentid;
	}

	public int getRolemenuid()
	{
		return rolemenuid;
	}

	public void setRolemenuid(int rolemenuid)
	{
		this.rolemenuid = rolemenuid;
	}

	public int getRoleid()
	{
		return roleid;
	}

	public void setRoleid(int roleid)
	{
		this.roleid = roleid;
	}

	@Override
	public String toString()
	{
		return "RoleMenu{" + "menuid=" + menuid + ", mname='" + mname + '\'' + ", url='" + url + '\'' + ", parentid=" + parentid + ", rolemenuid=" + rolemenuid + ", roleid=" + roleid + '}';
	}
}
