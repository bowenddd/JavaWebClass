package com.cn.connodity.service;

import com.cn.connodity.model.User;

public interface UserService {
	public User login(String name,String password);
	public void add(User user);
	
}
