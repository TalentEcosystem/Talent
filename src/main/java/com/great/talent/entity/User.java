package com.great.talent.entity;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component(value = "User")
@Scope("prototype")
public class User
{
	private int uid;
	private String uaccount;
	private String upassword;
	private String uname;
	private String usex;
	private String uage;
	private String utel;
	private String ustate;
	private String uaddress;
	private String uschool;
	private int uscore;
	private Date udate;
	private String test;
	private String uhead;
	private Date logintime;
	public User()
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

	public String getUpassword()
	{
		return upassword;
	}

	public void setUpassword(String upassword)
	{
		this.upassword = upassword;
	}

	public String getUname()
	{
		return uname;
	}

	public void setUname(String uname)
	{
		this.uname = uname;
	}

	public String getUsex()
	{
		return usex;
	}

	public void setUsex(String usex)
	{
		this.usex = usex;
	}

	public String getUage()
	{
		return uage;
	}

	public void setUage(String uage)
	{
		this.uage = uage;
	}

	public String getUtel()
	{
		return utel;
	}

	public void setUtel(String utel)
	{
		this.utel = utel;
	}

	public String getUstate()
	{
		return ustate;
	}

	public void setUstate(String ustate)
	{
		this.ustate = ustate;
	}

	public String getUaddress()
	{
		return uaddress;
	}

	public void setUaddress(String uaddress)
	{
		this.uaddress = uaddress;
	}

	public String getUschool()
	{
		return uschool;
	}

	public void setUschool(String uschool)
	{
		this.uschool = uschool;
	}

	public int getUscore()
	{
		return uscore;
	}

	public void setUscore(int uscore)
	{
		this.uscore = uscore;
	}

	public Date getUdate()
	{
		return udate;
	}

	public void setUdate(Date udate)
	{
		this.udate = udate;
	}

	public String getTest()
	{
		return test;
	}

	public void setTest(String test)
	{
		this.test = test;
	}

	public String getUhead()
	{
		return uhead;
	}

	public void setUhead(String uhead)
	{
		this.uhead = uhead;
	}

	public Date getLogintime() {
		return logintime;
	}

	public void setLogintime(Date logintime) {
		this.logintime = logintime;
	}

	@Override
	public String toString() {
		return "User{" +
				"uid=" + uid +
				", uaccount='" + uaccount + '\'' +
				", upassword='" + upassword + '\'' +
				", uname='" + uname + '\'' +
				", usex='" + usex + '\'' +
				", uage='" + uage + '\'' +
				", utel='" + utel + '\'' +
				", ustate='" + ustate + '\'' +
				", uaddress='" + uaddress + '\'' +
				", uschool='" + uschool + '\'' +
				", uscore=" + uscore +
				", udate=" + udate +
				", test='" + test + '\'' +
				", uhead='" + uhead + '\'' +
				", logintime=" + logintime +
				'}';
	}
}
