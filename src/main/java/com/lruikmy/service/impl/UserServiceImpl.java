package com.lruikmy.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lruikmy.dao.PriviliageDao;
import com.lruikmy.dao.UserDao;
import com.lruikmy.dto.PageBean;
import com.lruikmy.pojo.User;
import com.lruikmy.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Resource
	UserDao userDao;
	
	@Resource
	PriviliageDao priviliageDao;
	
	@Override
	public User login(User user) {
		User loginUser = userDao.findByLoginname(user);
		if(loginUser!=null&&loginUser.getRole()!=null&&loginUser.getRole().getRoleid()==1){
			loginUser.getRole().setPriList(priviliageDao.findAll());
		}
		return loginUser;
	}

	@Override
	public PageBean<List<User>> findPage(PageBean<List<User>> pageBean) {
		pageBean.setTotalCount(userDao.findCount());
		if(pageBean.getPageSize()==null||pageBean.getPageSize()<=0){
			pageBean.setPageSize(3);
		}
		if(pageBean.getCurrentPage()==null||pageBean.getCurrentPage()<1){
			pageBean.setCurrentPage(1);
		}
		if(pageBean.getCurrentPage()>pageBean.getTotalPage()){
			pageBean.setCurrentPage(pageBean.getTotalPage());
		}
		Map<String, Object> map=new HashMap<>();
		map.put("start", (pageBean.getCurrentPage()-1)*pageBean.getPageSize());
		map.put("pageSize", pageBean.getPageSize());
		List<User> userList = userDao.findUserPage(map);
		pageBean.setData(userList);
		return pageBean;
	}

	@Override
	@Transactional(rollbackFor=Exception.class)
	public boolean addUser(User user) {
		return userDao.insertUser(user)>0;
	}

	@Override
	public boolean updateUser(User user) {
		return userDao.updateUser(user)>0;
	}

	@Override
	public boolean deleteUser(Integer userid) {
		User user = new User();
		user.setUserid(userid);
		user.setUserStatus("4");
		return userDao.updateUser(user)>0;
	}

}
