package com.lruikmy.service;

import java.util.List;

import com.lruikmy.dto.PageBean;
import com.lruikmy.pojo.User;

public interface UserService {
	
	User login(User user);
	
	PageBean<List<User>> findPage(PageBean<List<User>> pageBean);
	
	boolean addUser(User user);
	
	boolean updateUser(User user);
	
	boolean deleteUser(Integer userid);
}
