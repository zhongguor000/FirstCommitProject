package com.lruikmy.dao;

import java.util.List;

import com.lruikmy.pojo.Dept;

public interface DeptDao {
	
	Dept findById(Integer deptno);
	
	List<Dept> findAllDept();
}
