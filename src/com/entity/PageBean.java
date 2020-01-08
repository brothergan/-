package com.entity;

import java.util.List;

public class PageBean<T> {
	private int pageIndex=1;
	private int pageSize=10;
	private int pageCount;
	private int totalCount;
	private List<T> list;
	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		if(pageIndex<1){
			this.pageIndex=1;
		}else{
			this.pageIndex=pageIndex;
		}
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
		setPageCount();
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount() {
		this.pageCount = this.totalCount%this.pageSize==0?
				this.totalCount/this.pageSize:
				this.totalCount/this.pageSize+1;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		setPageCount();
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	
}
