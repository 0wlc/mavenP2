package com.zc.common;

import java.io.IOException;
import javax.servlet.http.Part;

/**
 * 上传下载的工具类
 * @author zc
 */
public class LoadUtil {
	/**
	 * 文件上传
	 * @param part
	 * @param path 文件保存的绝对路径
	 * @return
	 */
	public static String upload(Part part,String path){
		//获取上传文件的头部信息        
    	String headname=part.getHeader("content-disposition");
    	System.out.println(headname);
    	//获取文件后缀名
    	String ext = headname.substring(headname.lastIndexOf("."), headname.length()-1);
		//上传文件名必须唯一，为了避免冲突
		String fileName = System.currentTimeMillis()+ext;
		//新文件保存路径
		path = path + "\\"+fileName;
		try {
			//把文件保存指定路径
			part.write(path);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return fileName;		
	}

}
