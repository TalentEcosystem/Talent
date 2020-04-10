package com.great.talent.entity;

/**
 * @author 小和
 * 简历的实体类
 */
public class Resume
{
	private int resumeid;
	private String rename;
	private String rebirth;
	private String retel;
	private String repic;
	private String readdress;
	private String repol;
	private String degreename;
	private String professname;
	private String schoolname;
	private String reskill;
	private String reeva;


	public Resume()
	{
	}

	public int getResumeid()
	{
		return resumeid;
	}

	public void setResumeid(int resumeid)
	{
		this.resumeid = resumeid;
	}

	public String getRename()
	{
		return rename;
	}

	public void setRename(String rename)
	{
		this.rename = rename;
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

	@Override
	public String toString()
	{
		return "Resume{" + "resumeid=" + resumeid + ", rename='" + rename + '\'' + ", rebirth='" + rebirth + '\'' + ", retel='" + retel + '\'' + ", repic='" + repic + '\'' + ", readdress='" + readdress + '\'' + ", repol='" + repol + '\'' + ", degreename='" + degreename + '\'' + ", professname='" + professname + '\'' + ", schoolname='" + schoolname + '\'' + ", reskill='" + reskill + '\'' + ", reeva='" + reeva + '\'' + '}';
	}
}
