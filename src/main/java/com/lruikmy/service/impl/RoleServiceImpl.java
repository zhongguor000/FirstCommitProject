package com.lruikmy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lruikmy.dao.RoleDao;
import com.lruikmy.pojo.Role;
import com.lruikmy.service.RoleService;
@Service("roleService")
public class RoleServiceImpl implements RoleService {

	@Resource
	RoleDao roleDao;
	
	
	@Override
	public List<Role> findAllRole() {
		
		return roleDao.findAllRole();
	}

}
