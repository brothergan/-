package com.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.entity.Document;
import com.entity.PageBean;



public interface DocumentService {
	public void saveDocument(Document entity);
	
	public List<Document> findByUser(Serializable id); 
	
	public PageBean<Document> getPageBeanByUser(Serializable id,int pageIndex,int pageSize);
	
	public PageBean<Document> getPageBeanByCondition(Map<String,Object> paraMap,int pageIndex,int pageSize);
	
	public Document findById(Serializable id);
	
	public void updateDocument(Document entity);
}
