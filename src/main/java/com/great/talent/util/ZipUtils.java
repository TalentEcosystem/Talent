package com.great.talent.util;
import java.io.File;
import java.util.ArrayList;

import net.lingala.zip4j.core.ZipFile;
import net.lingala.zip4j.exception.ZipException;
import net.lingala.zip4j.model.ZipParameters;
import net.lingala.zip4j.util.Zip4jConstants;
/**
 * @author 小和
 * 生成压缩包zip格式的工具类，并可以生成密码
 */
public class ZipUtils
{
	/**
	 * 加密文件并导出
	 * @param files 要进行压缩的文件
	 * @param passwordZip 压缩密码
	 * @param templatePathZip 压缩包路径
	 * @param fileName 压缩文件名
	 * @return zip文件
	 *
	 */
	public static ZipFile createZipFile(String passwordZip, String templatePathZip, String fileName,File...files) {
	try { // 創建zip包，指定了zip路徑和zip名稱
		final ZipFile zipFile = new ZipFile(templatePathZip + fileName);
		// 向zip包中添加文件集合
		final ArrayList<File> fileAddZip = new ArrayList<File>();
		File file1 = zipFile.getFile();
		// 判断是否存在
		if (file1.exists()) {
			file1.delete();
		}
		// 向zip包中添加文件
		for(File file:files){
		fileAddZip.add(file);
		}
		// 设置zip包的一些参数集合
		final ZipParameters parameters = new ZipParameters();
		// 是否设置密码（若passwordZip为空，则为false）
		if(null != passwordZip && !passwordZip.equals("")) {
			parameters.setEncryptFiles(true);
			// 压缩包密码
			parameters.setPassword(passwordZip);
		} else {
			parameters.setEncryptFiles(false);
		}
		// 压缩方式(默认值)
		parameters.setCompressionMethod(Zip4jConstants.COMP_DEFLATE);
		// 普通级别（参数很多）
		parameters.setCompressionLevel(Zip4jConstants.DEFLATE_LEVEL_NORMAL);
		// 加密级别
		parameters.setEncryptionMethod(Zip4jConstants.ENC_METHOD_STANDARD);
		// 创建压缩包完成
		zipFile.createZipFile(fileAddZip, parameters);

		//压缩完成后删除文件
		for(File file:files){
			file.delete();
		}
		return zipFile;
	} catch (final ZipException e) {
		e.printStackTrace();
		return null;
	}

	}

}

