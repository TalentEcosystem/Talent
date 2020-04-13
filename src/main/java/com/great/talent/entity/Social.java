package com.great.talent.entity;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

/**
 * @author 小和
 * 简历中的工作经历实体类
 */
@Component("Social")
@Scope("prototype")
public class Social
{
	private int socialid;
	private int uid;
	//工作时间段
	private String socialtime;
	//公司
	private String company;
	//工作内容
	private String content;

	public Social()
	{
	}

	public int getSocialid()
	{
		return socialid;
	}

	public void setSocialid(int socialid)
	{
		this.socialid = socialid;
	}

	public String getSocialtime()
	{
		return socialtime;
	}

	public void setSocialtime(String socialtime)
	{
		this.socialtime = socialtime;
	}

	public String getCompany()
	{
		return company;
	}

	public void setCompany(String company)
	{
		this.company = company;
	}

	public String getContent()
	{
		return content;
	}

	public void setContent(String content)
	{
		this.content = content;
	}

	public int getUid()
	{
		return uid;
	}

	public void setUid(int uid)
	{
		this.uid = uid;
	}

	@Override
	public String toString()
	{
		return "Social{" + "socialid=" + socialid + ", uid=" + uid + ", socialtime='" + socialtime + '\'' + ", company='" + company + '\'' + ", content='" + content + '\'' + '}';
	}
}
