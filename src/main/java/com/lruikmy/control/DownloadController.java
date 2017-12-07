package com.lruikmy.control;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("download")
public class DownloadController {
	
	@RequestMapping("showpic/*")
	public String showPic(HttpServletRequest request,HttpServletResponse response){
		String servletPath = request.getServletPath();
		String picName=servletPath.substring(servletPath.lastIndexOf("/")+1);
		try {
			IOUtils.copy(new FileInputStream("D:/uploadfile/"+picName), response.getOutputStream());
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	
}
