package com.lruikmy.pojo;

import java.io.Serializable;

public class Priviliage implements Serializable {
	private Integer priid;
	private String priName;
	private String priUrl;
	private String priImage;
	private Integer parentid;
	private String priStatus;
	private String priDesc;
	public Integer getPriid() {
		return priid;
	}
	public String getPriName() {
		return priName;
	}
	public String getPriUrl() {
		return priUrl;
	}
	public String getPriImage() {
		return priImage;
	}
	public Integer getParentid() {
		return parentid;
	}
	public String getPriStatus() {
		return priStatus;
	}
	public String getPriDesc() {
		return priDesc;
	}
	public void setPriid(Integer priid) {
		this.priid = priid;
	}
	public void setPriName(String priName) {
		this.priName = priName;
	}
	public void setPriUrl(String priUrl) {
		this.priUrl = priUrl;
	}
	public void setPriImage(String priImage) {
		this.priImage = priImage;
	}
	public void setParentid(Integer parentid) {
		this.parentid = parentid;
	}
	public void setPriStatus(String priStatus) {
		this.priStatus = priStatus;
	}
	public void setPriDesc(String priDesc) {
		this.priDesc = priDesc;
	}
	
}
