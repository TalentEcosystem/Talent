package com.great.talent.entity;

import java.util.Date;

public class SerachJob
{
	private Integer positionid;
	private Integer aid;//发布者
	private String sypositionname;//首页岗位名
	private String sypositionaddress;//首页地址名
	private String positionname;//岗位名称
	private String maxnum;//招聘人数
	private String positionexper;//工作经验
	private String request;//要求
	private String money;//资薪
	private String positionaddress;//工作地址
	private String positioncontent;//工作内容
	private String positionstate;//发布状态
	private Integer industryid;//行业id
	private Integer degreeid;//学历id
	private Integer professid;
	private String companynum;//企业人数
	private String companyname;//企业名称
	private Date positiontime;//发布时间

	public SerachJob()
	{
	}


	public SerachJob(Integer positionid, Integer aid, String sypositionname, String sypositionaddress, String positionname, String maxnum, String positionexper, String request, String money, String positionaddress, String positioncontent, String positionstate, Integer industryid, Integer degreeid, Integer professid, String companynum, String companyname, Date positiontime)
	{
		this.positionid = positionid;
		this.aid = aid;
		this.sypositionname = sypositionname;
		this.sypositionaddress = sypositionaddress;
		this.positionname = positionname;
		this.maxnum = maxnum;
		this.positionexper = positionexper;
		this.request = request;
		this.money = money;
		this.positionaddress = positionaddress;
		this.positioncontent = positioncontent;
		this.positionstate = positionstate;
		this.industryid = industryid;
		this.degreeid = degreeid;
		this.professid = professid;
		this.companynum = companynum;
		this.companyname = companyname;
		this.positiontime = positiontime;
	}

	public Integer getPositionid()
	{
		return positionid;
	}

	public void setPositionid(Integer positionid)
	{
		this.positionid = positionid;
	}

	public Integer getAid()
	{
		return aid;
	}

	public void setAid(Integer aid)
	{
		this.aid = aid;
	}

	public String getSypositionname()
	{
		return sypositionname;
	}

	public void setSypositionname(String sypositionname)
	{
		this.sypositionname = sypositionname;
	}

	public String getSypositionaddress()
	{
		return sypositionaddress;
	}

	public void setSypositionaddress(String sypositionaddress)
	{
		this.sypositionaddress = sypositionaddress;
	}

	public String getPositionname()
	{
		return positionname;
	}

	public void setPositionname(String positionname)
	{
		this.positionname = positionname;
	}

	public String getMaxnum()
	{
		return maxnum;
	}

	public void setMaxnum(String maxnum)
	{
		this.maxnum = maxnum;
	}

	public String getPositionexper()
	{
		return positionexper;
	}

	public void setPositionexper(String positionexper)
	{
		this.positionexper = positionexper;
	}

	public String getRequest()
	{
		return request;
	}

	public void setRequest(String request)
	{
		this.request = request;
	}

	public String getMoney()
	{
		return money;
	}

	public void setMoney(String money)
	{
		this.money = money;
	}

	public String getPositionaddress()
	{
		return positionaddress;
	}

	public void setPositionaddress(String positionaddress)
	{
		this.positionaddress = positionaddress;
	}

	public String getPositioncontent()
	{
		return positioncontent;
	}

	public void setPositioncontent(String positioncontent)
	{
		this.positioncontent = positioncontent;
	}

	public String getPositionstate()
	{
		return positionstate;
	}

	public void setPositionstate(String positionstate)
	{
		this.positionstate = positionstate;
	}

	public Integer getIndustryid()
	{
		return industryid;
	}

	public void setIndustryid(Integer industryid)
	{
		this.industryid = industryid;
	}

	public Integer getDegreeid()
	{
		return degreeid;
	}

	public void setDegreeid(Integer degreeid)
	{
		this.degreeid = degreeid;
	}

	public Integer getProfessid()
	{
		return professid;
	}

	public void setProfessid(Integer professid)
	{
		this.professid = professid;
	}

	public String getCompanynum()
	{
		return companynum;
	}

	public void setCompanynum(String companynum)
	{
		this.companynum = companynum;
	}

	public String getCompanyname()
	{
		return companyname;
	}

	public void setCompanyname(String companyname)
	{
		this.companyname = companyname;
	}

	@Override
	public String toString()
	{
		return "SerachJob{" + "positionid=" + positionid + ", aid=" + aid + ", sypositionname='" + sypositionname + '\'' + ", sypositionaddress='" + sypositionaddress + '\'' + ", positionname='" + positionname + '\'' + ", maxnum='" + maxnum + '\'' + ", positionexper='" + positionexper + '\'' + ", request='" + request + '\'' + ", money='" + money + '\'' + ", positionaddress='" + positionaddress + '\'' + ", positioncontent='" + positioncontent + '\'' + ", positionstate='" + positionstate + '\'' + ", industryid=" + industryid + ", degreeid=" + degreeid + ", professid=" + professid + ", companynum='" + companynum + '\'' + ", companyname='" + companyname + '\'' + ", positiontime=" + positiontime + '}';
	}
}
