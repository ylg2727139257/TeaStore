package com.vo;

public class User {
	private int uid;
	private String uname;
	private String password;
	private String sex;
	private String address;
	private String phone;
	private int role;
	
	public User() {}
	public User(String uname, String password) {
		this.uname = uname;
		this.password = password;
	}
	public User(int uid, String uname, String password, String sex, String address, 
			 String phone, int role) {
		this.uid = uid;
		this.uname = uname;
		this.password = password;
		this.sex = sex;
		this.address = address;
		this.phone = phone;
		this.role = role;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	@Override
	public String toString() {
		return "User [uid=" + uid + ", uname=" + uname + ", password=" + password +
				", sex=" + sex + ", address="+ address + ", phone=" +
				phone + ", role=" + role + "]";
	}
	
}
