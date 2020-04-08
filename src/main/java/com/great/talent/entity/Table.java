package com.great.talent.entity;

import java.util.List;

public class Table
{
	private int code;
	private String msg;
	private int count;
	private List<Know> data;

	public Table()
	{
	}

	public Table(int code, String msg, int count, List<Know> data)
	{
		this.code = code;
		this.msg = msg;
		this.count = count;
		this.data = data;
	}

	public int getCode()
	{
		return code;
	}

	public void setCode(int code)
	{
		this.code = code;
	}

	public String getMsg()
	{
		return msg;
	}

	public void setMsg(String msg)
	{
		this.msg = msg;
	}

	public int getCount()
	{
		return count;
	}

	public void setCount(int count)
	{
		this.count = count;
	}

	public List<Know> getData()
	{
		return data;
	}

	public void setData(List<Know> data)
	{
		this.data = data;
	}
}
