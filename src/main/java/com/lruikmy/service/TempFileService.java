package com.lruikmy.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lruikmy.dao.TempFileDao;
import com.lruikmy.pojo.TempFile;

@Service
public class TempFileService {
	
	@Resource
	TempFileDao tempFileDao;
	
	public TempFile findTempFileById(String id){
		return tempFileDao.findTempFileById(id);
	}

	public boolean deleteTempFile(String id){
		return tempFileDao.deleteTempFile(id)>0;
	}

	public boolean insertTempFile(TempFile tempFile){
		return tempFileDao.insertTempFile(tempFile)>0;
	}

	public boolean updateTempFile(TempFile tempFile){
		return tempFileDao.updateTempFile(tempFile)>0;
	}
}
