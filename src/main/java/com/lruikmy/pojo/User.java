package com.lruikmy.pojo;

import java.io.Serializable;

public class User implements Serializable{
	private Integer userid;
	private String loginname;
	private String loginpwd;
	private String realName;
	private String email;
	private String userDesc;
	private String userStatus;
	private String picpath;
	private Role role;
	private Dept dept;
	
	
	public Integer getUserid() {
		return userid;
	}
	public String getLoginname() {
		return loginname;
	}
	public String getLoginpwd() {
		return loginpwd;
	}
	public String getRealName() {
		return realName;
	}
	public String getEmail() {
		return email;
	}
	public String getUserDesc() {
		return userDesc;
	}
	public String getUserStatus() {
		return userStatus;
	}
	public String getPicpath() {
		return picpath;
	}
	public Role getRole() {
		return role;
	}
	public Dept getDept() {
		return dept;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}
	public void setLoginpwd(String loginpwd) {
		this.loginpwd = loginpwd;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setUserDesc(String userDesc) {
		this.userDesc = userDesc;
	}
	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}
	public void setPicpath(String picpath) {
		this.picpath = picpath;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	public void setDept(Dept dept) {
		this.dept = dept;
	}
	@Override
	public String toString() {
		return "User [userid=" + userid + ", loginname=" + loginname + ", loginpwd=" + loginpwd + ", realName="
				+ realName + ", email=" + email + ", userDesc=" + userDesc + ", userStatus=" + userStatus + ", picpath="
				+ picpath + ", role=" + role + ", dept=" + dept + "]";
	}
	
	
	
}
