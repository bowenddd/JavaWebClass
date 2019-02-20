package com.cn.connodity.dao;

import com.cn.connodity.model.User;

public interface UserDAO extends BaseDAO {
	public User loginCheck(String name , String password);
	public void save(User user);
}
