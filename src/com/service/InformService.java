package com.service;

import java.io.Serializable;
import java.util.Map;

import com.entity.Inform;
import com.entity.PageBean;



public interface InformService {
	public void saveInform(Inform entity);
	public PageBean<Inform> getPageBeanByCondition(Map<String,Object> paraMap,int pageIndex,int pageSize);
	public Inform findById(Serializable id);
}
