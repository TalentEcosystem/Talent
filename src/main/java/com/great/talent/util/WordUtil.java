package com.great.talent.util;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.net.URLEncoder;
import java.util.Date;
import java.util.Map;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.utility.DateUtil;

/**
 * @author 小和
 * 导出生成word文档的工具类
 */
public class WordUtil
{
	private static Configuration configuration = null;
	//classLoader.getResource()只能获取相对路径的资源
	//     private static final String templateFolder = WordUtils.class.getClassLoader().getResource("template").getPath();
	//class.getResource()可以获取绝对路径和相对路径request.getServletContext().getRealPath("/excel")
	private static final String templateFolder = WordUtil.class.getResource("/template").getPath();

	static {
		configuration = new Configuration();
		configuration.setDefaultEncoding("utf-8");
		System.out.println("templateFolder=="+templateFolder);
		try {
			configuration.setDirectoryForTemplateLoading(new File(templateFolder));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private WordUtil() {
		throw new AssertionError();
	}

	public static void exportMillCertificateWord(HttpServletRequest request, HttpServletResponse response, Map map, String title, String ftlFile) throws IOException {
		Template freemarkerTemplate = configuration.getTemplate(ftlFile);
		File file = null;
		InputStream fin = null;
		ServletOutputStream out = null;
		try {
			// 调用工具类的createDoc方法生成Word文档
			file = createDoc(map, freemarkerTemplate);
			fin = new FileInputStream(file);

			response.setCharacterEncoding("utf-8");
			// 设置浏览器以下载的方式处理该文件名
			String fileName = title + new Date() + ".doc";
			response.setHeader("Content-Disposition", "attachment;filename="
					.concat(String.valueOf(URLEncoder.encode(fileName, "UTF-8"))));
			out = response.getOutputStream();
			byte[] buffer = new byte[512];  // 缓冲区
			int bytesToRead = -1;
			// 通过循环将读入的Word文件的内容输出到浏览器中
			while ((bytesToRead = fin.read(buffer)) != -1) {
				out.write(buffer, 0, bytesToRead);
			}
			System.out.println("下载一次");
		} finally {
			if (fin != null)
			{
				fin.close();
			}
			if (out != null)
			{
				out.close();
			}
			if (file != null)
			{
				file.delete(); // 删除临时文件
			}
		}
	}

	private static File createDoc(Map<?, ?> dataMap, Template template) {
		System.out.println("进入创建doc一次");
		String name = "sellPlan.doc";
		File f = new File(name);
		Template t = template;
		try {
			// 这个地方不能使用FileWriter因为需要指定编码类型否则生成的Word文档会因为有无法识别的编码而无法打开
			Writer w = new OutputStreamWriter(new FileOutputStream(f), "utf-8");
			t.process(dataMap, w);
			w.close();
		} catch (Exception ex) {
			ex.printStackTrace();
			throw new RuntimeException(ex);
		}
		return f;
	}
	public static void exportWord(HttpServletRequest request, HttpServletResponse response, Map map, String title, String ftlFile) throws IOException {
		Template freemarkerTemplate = configuration.getTemplate(ftlFile);
		File file = null;
		InputStream fin = null;
		ServletOutputStream out = null;
		try {
			// 调用工具类的createDoc方法生成Word文档
			file = createDocZip(map, freemarkerTemplate);
			fin = new FileInputStream(file);


			System.out.println("下载一次");
		} finally {
			if (fin != null)
			{
				fin.close();
			}


		}
	}
	private static File createDocZip(Map<?, ?> dataMap, Template template) {
		System.out.println("进入创建doc一次");
		String name = "sellPlan.doc";
		File f = new File(name);
		Template t = template;
		try {
			// 这个地方不能使用FileWriter因为需要指定编码类型否则生成的Word文档会因为有无法识别的编码而无法打开
			Writer w = new OutputStreamWriter(new FileOutputStream(f), "utf-8");
			t.process(dataMap, w);
			w.close();
		} catch (Exception ex) {
			ex.printStackTrace();
			throw new RuntimeException(ex);
		}
		return f;
	}
}
