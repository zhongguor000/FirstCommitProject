package com.lruikmy.pojo;

import java.io.Serializable;
import java.util.List;

public class Role implements Serializable{
	private Integer roleid;
	private String roleCn;
	private String roleEn;
	private String roleDesc;
	private String roleStatus;
	private List<Priviliage> priList;
	public Integer getRoleid() {
		return roleid;
	}
	public String getRoleCn() {
		return roleCn;
	}
	public String getRoleEn() {
		return roleEn;
	}
	public String getRoleDesc() {
		return roleDesc;
	}
	public String getRoleStatus() {
		return roleStatus;
	}
	public void setRoleid(Integer roleid) {
		this.roleid = roleid;
	}
	public void setRoleCn(String roleCn) {
		this.roleCn = roleCn;
	}
	public void setRoleEn(String roleEn) {
		this.roleEn = roleEn;
	}
	public void setRoleDesc(String roleDesc) {
		this.roleDesc = roleDesc;
	}
	public void setRoleStatus(String roleStatus) {
		this.roleStatus = roleStatus;
	}
	public List<Priviliage> getPriList() {
		return priList;
	}
	public void setPriList(List<Priviliage> priList) {
		this.priList = priList;
	}
	
	
	
}
