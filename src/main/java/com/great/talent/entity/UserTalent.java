package com.great.talent.entity;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

/**
 * @author 小和
 * 人才中心的实体类
 */
@Component("UserTalent")
@Scope("prototype")
public class UserTalent
{
	private int uid;
	private String uaccount;
	private String rename;
	private String chname;
	private String professname;
	private String reemploy;

	public UserTalent()
	{
	}

	public int getUid()
	{
		return uid;
	}

	public void setUid(int uid)
	{
		this.uid = uid;
	}

	public String getUaccount()
	{
		return uaccount;
	}

	public void setUaccount(String uaccount)
	{
		this.uaccount = uaccount;
	}

	public String getRename()
	{
		return rename;
	}

	public void setRename(String rename)
	{
		this.rename = rename;
	}

	public String getChname()
	{
		return chname;
	}

	public void setChname(String chname)
	{
		this.chname = chname;
	}

	public String getProfessname()
	{
		return professname;
	}

	public void setProfessname(String professname)
	{
		this.professname = professname;
	}

	public String getReemploy()
	{
		return reemploy;
	}

	public void setReemploy(String reemploy)
	{
		this.reemploy = reemploy;
	}

	@Override
	public String toString()
	{
		return "UserTalent{" + "uid=" + uid + ", uaccount='" + uaccount + '\'' + ", rename='" + rename + '\'' + ", chname='" + chname + '\'' + ", professname='" + professname + '\'' + ", reemploy='" + reemploy + '\'' + '}';
	}
}
