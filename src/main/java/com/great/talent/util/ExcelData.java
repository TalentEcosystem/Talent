package com.great.talent.util;

import java.util.Arrays;
import java.util.List;


public class ExcelData
{
	private String FileName;
	private String[] head;
	private List<String[]> data;

	public String getFileName()
	{
		return FileName;
	}

	public void setFileName(String fileName)
	{
		FileName = fileName;
	}

	public String[] getHead()
	{
		return head;
	}

	public void setHead(String[] head)
	{
		this.head = head;
	}

	public List<String[]> getData()
	{
		return data;
	}

	public void setData(List<String[]> data)
	{
		this.data = data;
	}

	@Override
	public String toString()
	{
		return "ExcelData{" + "FileName='" + FileName + '\'' + ", head=" + Arrays.toString(head) + ", data=" + data + '}';
	}
}
