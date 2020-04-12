package com.great.talent.entity;

public class GoodNews
{

	/**
	 * 1、企业名
	 * 2、资薪
	 * 3、职位名
	 * 4、要求
	 * 5、职位的地址
	 * 6、招聘人数
	 */
	private String companyname;
	private int money;
	private String positionname;
	private String request;
	private String positionaddress;
	private int maxnum;
	public GoodNews()
	{
	}

	public String getCompanyname()
	{
		return companyname;
	}

	public void setCompanyname(String companyname)
	{
		this.companyname = companyname;
	}

	public int getMoney()
	{
		return money;
	}

	public void setMoney(int money)
	{
		this.money = money;
	}

	public String getPositionname()
	{
		return positionname;
	}

	public void setPositionname(String positionname)
	{
		this.positionname = positionname;
	}

	public String getRequest()
	{
		return request;
	}

	public void setRequest(String request)
	{
		this.request = request;
	}

	public String getPositionaddress()
	{
		return positionaddress;
	}

	public void setPositionaddress(String positionaddress)
	{
		this.positionaddress = positionaddress;
	}

	public int getMaxnum()
	{
		return maxnum;
	}

	public void setMaxnum(int maxnum)
	{
		this.maxnum = maxnum;
	}

	@Override
	public String toString()
	{
		return "GoodNews{" + "companyname='" + companyname + '\'' + ", money=" + money + ", positionname='" + positionname + '\'' + ", request='" + request + '\'' + ", positionaddress='" + positionaddress + '\'' + ", maxnum=" + maxnum + '}';
	}
}
