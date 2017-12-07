package com.lruikmy.pojo;

import java.io.Serializable;

public class Dept implements Serializable {
	private Integer deptno;
	private String dname;
	private String deptDesc;
	private Integer parentid;
	public Integer getDeptno() {
		return deptno;
	}
	public String getDname() {
		return dname;
	}
	public String getDeptDesc() {
		return deptDesc;
	}
	public Integer getParentid() {
		return parentid;
	}
	public void setDeptno(Integer deptno) {
		this.deptno = deptno;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public void setDeptDesc(String deptDesc) {
		this.deptDesc = deptDesc;
	}
	public void setParentid(Integer parentid) {
		this.parentid = parentid;
	}
}
