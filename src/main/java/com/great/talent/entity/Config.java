package com.great.talent.entity;

import java.util.List;

public class Config
{
	private String title;
	private int id;
	private List<Config> children;

	public Config()
	{
	}

	public String getTitle()
	{
		return title;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public List<Config> getChildren()
	{
		return children;
	}

	public void setChildren(List<Config> children)
	{
		this.children = children;
	}

	@Override
	public String toString()
	{
		return "Config{" + "title='" + title + '\'' + ", id=" + id + ", children=" + children + '}';
	}
}
