package com.lruikmy.dto;

public class PageBean<T> {
	
	private Integer pageSize;
	
	private Integer currentPage;
	
	private Integer totalCount;
	
	private T data;

	public Integer getPageSize() {
		return pageSize;
	}

	public Integer getCurrentPage() {
		return currentPage;
	}

	public Integer getTotalPage() {
		return (totalCount-1)/pageSize+1;
	}

	public Integer getTotalCount() {
		return totalCount;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}
}
