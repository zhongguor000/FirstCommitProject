package com.lruikmy.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.lruikmy.pojo.User;

@Repository
public interface UserDao {
	User findByLoginname(User user);
	
	List<User> findUserPage(Map<String, Object> map);
	
	Integer findCount();
	
	int insertUser(User user);
	
	int updateUser(User user);
}
