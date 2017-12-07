package com.lruikmy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lruikmy.dao.DeptDao;
import com.lruikmy.pojo.Dept;
import com.lruikmy.service.DeptService;

@Service("deptService")
public class DeptServiceImpl implements DeptService {

	@Resource
	DeptDao deptDao;
	
	@Override
	public List<Dept> findAllDept() {
		return deptDao.findAllDept();
	}

}
