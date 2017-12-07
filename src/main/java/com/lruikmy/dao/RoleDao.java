package com.lruikmy.dao;

import java.util.List;

import com.lruikmy.pojo.Role;

public interface RoleDao {
	Role findById(Integer roleid);
	
	List<Role> findAllRole();

}
