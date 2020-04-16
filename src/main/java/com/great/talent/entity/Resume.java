package com.great.talent.entity;

import java.util.Date;
import java.util.List;

/**
 * @author 小和
 * 简历的实体类
 */
public class Resume
{
	private int resumeid;
	private int uid;
	private int degreeid;
	private int sid;
	private int professid;
	private String resex;
	private String resname;
	private String rebirth;
	private String retel;
	private String repic;
	private String readdress;
	private String repol;
	private String degreename;
	private String professname;
	private String schoolname;
	private String reskill;
	private String reexper;
	private String reeva;
	private String reset;
	private Date operationtime;
	private List<Social> socialList;
	private List<Aducational> aducationalList;

	public Resume()
	{
	}

	public Date getOperationtime() {
		return operationtime;
	}

	public void setOperationtime(Date operationtime) {
		this.operationtime = operationtime;
	}

	public int getResumeid()
	{
		return resumeid;
	}

	public void setResumeid(int resumeid)
	{
		this.resumeid = resumeid;
	}

	public String getResname()
	{
		return resname;
	}

	public void setResname(String resname)
	{
		this.resname = resname;
	}

	public String getRebirth()
	{
		return rebirth;
	}

	public void setRebirth(String rebirth)
	{
		this.rebirth = rebirth;
	}

	public String getRetel()
	{
		return retel;
	}

	public void setRetel(String retel)
	{
		this.retel = retel;
	}

	public String getRepic()
	{
		return repic;
	}

	public void setRepic(String repic)
	{
		this.repic = repic;
	}

	public String getReaddress()
	{
		return readdress;
	}

	public void setReaddress(String readdress)
	{
		this.readdress = readdress;
	}

	public String getRepol()
	{
		return repol;
	}

	public void setRepol(String repol)
	{
		this.repol = repol;
	}

	public String getDegreename()
	{
		return degreename;
	}

	public void setDegreename(String degreename)
	{
		this.degreename = degreename;
	}

	public String getProfessname()
	{
		return professname;
	}

	public void setProfessname(String professname)
	{
		this.professname = professname;
	}

	public String getSchoolname()
	{
		return schoolname;
	}

	public void setSchoolname(String schoolname)
	{
		this.schoolname = schoolname;
	}

	public String getReskill()
	{
		return reskill;
	}

	public void setReskill(String reskill)
	{
		this.reskill = reskill;
	}

	public String getReeva()
	{
		return reeva;
	}

	public void setReeva(String reeva)
	{
		this.reeva = reeva;
	}

	public int getUid()
	{
		return uid;
	}

	public void setUid(int uid)
	{
		this.uid = uid;
	}

	public int getDegreeid()
	{
		return degreeid;
	}

	public void setDegreeid(int degreeid)
	{
		this.degreeid = degreeid;
	}

	public int getSid()
	{
		return sid;
	}

	public void setSid(int sid)
	{
		this.sid = sid;
	}

	public int getProfessid()
	{
		return professid;
	}

	public void setProfessid(int professid)
	{
		this.professid = professid;
	}

	public String getResex()
	{
		return resex;
	}

	public void setResex(String resex)
	{
		this.resex = resex;
	}

	public String getReexper()
	{
		return reexper;
	}

	public void setReexper(String reexper)
	{
		this.reexper = reexper;
	}

	public String getReset()
	{
		return reset;
	}

	public void setReset(String reset)
	{
		this.reset = reset;
	}

	public List<Social> getSocialList()
	{
		return socialList;
	}

	public void setSocialList(List<Social> socialList)
	{
		this.socialList = socialList;
	}

	public List<Aducational> getAducationalList()
	{
		return aducationalList;
	}

	public void setAducationalList(List<Aducational> aducationalList)
	{
		this.aducationalList = aducationalList;
	}

	@Override
	public String toString() {
		return "Resume{" +
				"resumeid=" + resumeid +
				", uid=" + uid +
				", degreeid=" + degreeid +
				", sid=" + sid +
				", professid=" + professid +
				", resex='" + resex + '\'' +
				", resname='" + resname + '\'' +
				", rebirth='" + rebirth + '\'' +
				", retel='" + retel + '\'' +
				", repic='" + repic + '\'' +
				", readdress='" + readdress + '\'' +
				", repol='" + repol + '\'' +
				", degreename='" + degreename + '\'' +
				", professname='" + professname + '\'' +
				", schoolname='" + schoolname + '\'' +
				", reskill='" + reskill + '\'' +
				", reexper='" + reexper + '\'' +
				", reeva='" + reeva + '\'' +
				", reset='" + reset + '\'' +
				", operationtime=" + operationtime +
				", socialList=" + socialList +
				", aducationalList=" + aducationalList +
				'}';
	}
}
