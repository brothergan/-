package com.service;

import java.io.Serializable;
import java.util.Map;

import com.entity.Annotation;
import com.entity.PageBean;



public interface AnnotationService {
	public void saveAnnotation(Annotation entity);
	
	public PageBean<Annotation> getPageBeanByCondition(Map<String,Object> paraMap,int pageIndex,int pageSize);
	
	public Annotation findById(Serializable id);

}
