package com.lruikmy.pojo;

import java.io.Serializable;

public class TempFile implements Serializable {
	private String id;
	private Long start;
	public String getId() {
		return id;
	}
	public Long getStart() {
		return start;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setStart(Long start) {
		this.start = start;
	}
	
	
	
}
