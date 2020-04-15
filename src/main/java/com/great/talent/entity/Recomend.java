package com.great.talent.entity;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * @author 小和
 * 推荐表的实体类
 */
@Component(value = "Recomend")
@Scope("prototype")
public class Recomend
{
	private int uid;
	private int sid;
	private Date recommendtime;
	private int positionid;
	private int cid;
	private String presenter;

	public Recomend()
	{
	}

	public int getSid()
	{
		return sid;
	}

	public void setSid(int sid)
	{
		this.sid = sid;
	}

	public int getUid()
	{
		return uid;
	}

	public void setUid(int uid)
	{
		this.uid = uid;
	}

	public Date getRecommendtime()
	{
		return recommendtime;
	}

	public void setRecommendtime(Date recommendtime)
	{
		this.recommendtime = recommendtime;
	}

	public int getPositionid()
	{
		return positionid;
	}

	public void setPositionid(int positionid)
	{
		this.positionid = positionid;
	}

	public int getCid()
	{
		return cid;
	}

	public void setCid(int cid)
	{
		this.cid = cid;
	}

	@Override
	public String toString()
	{
		return "Recomend{" + "uid=" + uid + ", sid=" + sid + ", recommendtime=" + recommendtime + ", positionid=" + positionid + ", cid=" + cid + ", presenter='" + presenter + '\'' + '}';
	}

	public String getPresenter()
	{
		return presenter;
	}

	public void setPresenter(String presenter)
	{
		this.presenter = presenter;
	}

}
