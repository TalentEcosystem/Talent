package com.great.talent.entity;

import java.util.Date;

/**
 * 日志实体
 * 
 * @author zx
 * 
 */
public class SystemLog
{
	private int logid;

	private String logname;

	private String logtype;

	private Date logdate;

	private String logresult;

	public SystemLog()
	{
	}

	public int getLogid()
	{
		return logid;
	}

	public void setLogid(int logid)
	{
		this.logid = logid;
	}

	public String getLogname()
	{
		return logname;
	}

	public void setLogname(String logname)
	{
		this.logname = logname;
	}

	public String getLogtype()
	{
		return logtype;
	}

	public void setLogtype(String logtype)
	{
		this.logtype = logtype;
	}

	public Date getLogdate()
	{
		return logdate;
	}

	public void setLogdate(Date logdate)
	{
		this.logdate = logdate;
	}

	public String getLogresult()
	{
		return logresult;
	}

	public void setLogresult(String logresult)
	{
		this.logresult = logresult;
	}
}
