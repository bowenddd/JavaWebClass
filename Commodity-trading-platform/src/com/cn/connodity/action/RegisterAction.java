package com.cn.connodity.action;

import java.util.Map;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.cn.connodity.dto.UserDTO;
import com.cn.connodity.model.User;
import com.cn.connodity.service.UserService;
import com.cn.connodity.util.EmailAttachmentSender;
import com.cn.connodity.util.ProductCode;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class RegisterAction extends ActionSupport implements ModelDriven {
	private UserDTO userDTO = new UserDTO();
	private User user = new User();
	@Resource
	private UserService userService;
	private Map<String , Object> session;
	private EmailAttachmentSender emailSender = new EmailAttachmentSender();
	private String username;
	private HttpServletRequest request;
	private HttpServletResponse response;
	
	public String userRegister() throws MessagingException {
		session = (Map)ActionContext.getContext().getSession();		
		String rand = (String)ActionContext.getContext().getSession().get("rand");;
		System.out.println("ÑéÖ¤Âë" + rand);
		String ret = "";
		if(!userDTO.getPassword1().equals(userDTO.getPassword2())) {
			ret = "reset";
		}
		else if((!rand.equals(userDTO.getRand())) || userDTO.getRand() == null) {
			ret = "reset";
		}
		else if((userDTO.getEmail() != null ) && (userDTO.getName() != null)) {
			user.set(userDTO);
			session.put(user.getName(), user);
			emailSender.send(user.getEmail() , user.getName());
			ret = "verify";
		}
		else {
			ret = "reset";
		}
		return ret;
	}
	public String usersave() {
		session = (Map)ActionContext.getContext().getSession();
		User u = (User) session.get(username);
		System.out.println(username + u.getEmail());
		userService.add(u);
		return "save";
	}
	public void code() {
		request = ServletActionContext.getRequest();
		response = ServletActionContext.getResponse();
		ProductCode.productCode(request,response);
	}
	@Override
	public Object getModel() {
		// TODO Auto-generated method stub
		return userDTO;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
}
