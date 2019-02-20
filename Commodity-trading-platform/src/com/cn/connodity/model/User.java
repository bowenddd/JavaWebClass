package com.cn.connodity.model;

import com.cn.connodity.dto.UserDTO;

public class User {
	private Long id;
	private String name;
	private String password;
	private String address;
	private String postCode;
	private String email;
	private String homePhone;
	private String cellPhone;
	private String officePhone;
	
	public User() {
		super();
	}
	public User(String name ,String password) {
		super();
		this.name = name;
		this.password = password;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPostCode() {
		return postCode;
	}
	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHomePhone() {
		return homePhone;
	}
	public void setHomePhone(String homePhone) {
		this.homePhone = homePhone;
	}
	public String getCellPhone() {
		return cellPhone;
	}
	public void setCellPhone(String cellPhone) {
		this.cellPhone = cellPhone;
	}
	public String getOfficePhone() {
		return officePhone;
	}
	public void setOfficePhone(String officePhone) {
		this.officePhone = officePhone;
	}
	public void set(UserDTO userDTO) {
		this.name = userDTO.getName();
		this.password = userDTO.getPassword1();
		this.address = userDTO.getAddress();
		this.postCode = userDTO.getPostCode();
		this.email = userDTO.getEmail();
		this.homePhone = userDTO.getHomePhone();
		this.cellPhone = userDTO.getCellPhone();
		this.officePhone = userDTO.getOfficePhone();		
	}

}
