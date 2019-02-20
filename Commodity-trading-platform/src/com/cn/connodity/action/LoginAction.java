package com.cn.connodity.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.cn.connodity.common.Constants;
import com.cn.connodity.model.Administrator;
import com.cn.connodity.model.User;
import com.cn.connodity.service.UserService;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {
	private String username;
	private String password;
	private UserService userService;
	private HttpServletRequest request;
	private HttpSession session;
	private ServletContext application;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService){
		this.userService = userService;
	}
	
	public String execute() throws Exception{
		this.request = ServletActionContext.getRequest();
		this.session = this.request.getSession();
		String ret = "";
		User user = this.userService.login(username, password);
		if(user == null) {
			this.request.setAttribute("msg", "µÇÂ¼Ê§°Ü");
			System.out.println("µÇÂ¼Ê§°Ü");
			ret = "restart";
		}
		else {
			System.out.println(user.getName() );
			this.session.setAttribute(Constants.SESSION_USER, user);
			if(user instanceof Administrator) {
				ret = "manager";
				}
			else {
				ret = "user";
			}
		}
		return ret;
	}
	
	
}
