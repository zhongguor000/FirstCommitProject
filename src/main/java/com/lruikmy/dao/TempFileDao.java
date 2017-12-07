package com.lruikmy.dao;

import org.springframework.stereotype.Repository;

import com.lruikmy.pojo.TempFile;


@Repository
public interface TempFileDao {
	TempFile findTempFileById(String id);
	
	int deleteTempFile(String id);
	
	int insertTempFile(TempFile tempFile);
	
	int updateTempFile(TempFile tempFile);
}
