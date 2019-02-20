package com.cn.connodity.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;

import org.apache.struts2.ServletActionContext;

public class UpLoadUtil {
	private static final int BUFFER_SIZE = 16 * 1024;
	private static void copy(File src , File dst) {
		try {
			InputStream in = null;
			OutputStream out = null;
			try {
				in = new BufferedInputStream(new FileInputStream(src),BUFFER_SIZE);
				out = new BufferedOutputStream(new FileOutputStream(dst),BUFFER_SIZE);
				byte[] buffer = new byte[BUFFER_SIZE];
				while(in.read(buffer)>0) {
					out.write(buffer);
				}
			}finally {
				in.close();
			}
			if(null != out) {
				out.close();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	private static String getExtention(String fileName) {
		int pos = fileName.lastIndexOf(".");
		return fileName.substring(pos);
	}
	public static String upload(File src) {
		if(src == null) {
			return "";
		}
		String tempName = new Date().getTime()  + getExtention(src.getName());
		File imageFile = new File(ServletActionContext.getServletContext().getRealPath("UploadImages") + "/" + tempName);
		System.out.println(imageFile.getPath());
		System.out.println(src.getPath());
		copy(src,imageFile);
		return tempName;
	}
}
