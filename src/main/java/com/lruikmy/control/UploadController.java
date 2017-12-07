package com.lruikmy.control;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.lruikmy.pojo.TempFile;
import com.lruikmy.service.TempFileService;
import com.lruikmy.utils.RandomIOUtil;

@Controller
@RequestMapping("upload")
public class UploadController {
	@Resource
	TempFileService tempFileService;
	

	@RequestMapping(value="up")
	@ResponseBody
	public String upload(MultipartFile file){
		
		String fileName="";
		System.out.println(file);
		
		if(file!=null&&!file.isEmpty()){
			String originalFilename = file.getOriginalFilename();
			fileName=UUID.randomUUID().toString()+originalFilename.substring(originalFilename.lastIndexOf("."));
			String path="D:/uploadfile/"+fileName;
			try {
				FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(path));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return fileName;
	}
	
	
	@RequestMapping("breakpointupload")
	public String breakPointUpload(MultipartFile file,String md5){
		//查询数据库中是否有改未完成的文件
		TempFile tempFile = tempFileService.findTempFileById(md5);
		long start=0;
		long totalSize=file.getSize();
		RandomAccessFile output=null;
		//
		String originalFilename = file.getOriginalFilename();
		String fileName=md5+originalFilename.substring(originalFilename.lastIndexOf("."));
		
		try {
			output = new RandomAccessFile("D:/uploadfile/"+fileName, "rw");
			if(tempFile!=null&&tempFile.getStart()!=null){
				start=tempFile.getStart();
			}else{
				//原本的文件不存在，则为文件设置大小
				output.setLength(totalSize);
			}
			long precopy = RandomIOUtil.copy(file.getInputStream(), output, start);
			
			//保存的文件数据小于总数据，则保存未完成的文件信息到数据库
			if(precopy<totalSize){
				if(tempFile!=null&&tempFile.getId()!=null){
					tempFile = new TempFile();
					tempFile.setId(md5);
					tempFile.setStart(precopy);
					tempFileService.insertTempFile(tempFile);
				}else{
					tempFile.setStart(precopy);
					tempFileService.updateTempFile(tempFile);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
}
