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
	private String resname;
	private String chname;
	private String professname;
	private String reemploy;
	private String schoolname;
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

	public String getResname()
	{
		return resname;
	}

	public void setResname(String resname)
	{
		this.resname = resname;
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

	public String getSchoolname()
	{
		return schoolname;
	}

	public void setSchoolname(String schoolname)
	{
		this.schoolname = schoolname;
	}

	@Override
	public String toString()
	{
		return "UserTalent{" + "uid=" + uid + ", uaccount='" + uaccount + '\'' + ", resname='" + resname + '\'' + ", chname='" + chname + '\'' + ", professname='" + professname + '\'' + ", reemploy='" + reemploy + '\'' + ", schoolname='" + schoolname + '\'' + '}';
	}
}
