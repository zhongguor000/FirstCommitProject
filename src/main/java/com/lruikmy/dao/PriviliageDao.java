package com.lruikmy.dao;

import java.util.List;

import com.lruikmy.pojo.Priviliage;

public interface PriviliageDao {
	 List<Priviliage> findAll();
	
	List<Priviliage> findByRoleId();
}
