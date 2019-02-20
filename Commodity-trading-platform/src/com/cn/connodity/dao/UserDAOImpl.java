package com.cn.connodity.dao;

import java.util.List;

import com.cn.connodity.model.User;

public class UserDAOImpl extends BaseDAOImpl implements UserDAO {

	public User loginCheck(String name, String password) {
		// TODO Auto-generated method stub
		String hql = "from com.cn.connodity.model.User u where u.name = " + "'" + name + "'" +  " " + "and u.password = " + "'" + password + "'";
		List <User> list = (List<User>) this.getHibernateTemplate().find(hql);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		else {
			return null;
		}
	}

	public void save(User user) {
		// TODO Auto-generated method stub
		super.saveEntity(user);

	}

}
