package com.service;

import java.io.Serializable;
import java.util.Map;

import com.entity.Admin;
import com.entity.PageBean;

public interface AdminService {
	public void saveAdmin(Admin entity);
	
	public Admin login(String loginName,String password);
	
	public void updateAdmin(Admin entity);
	
	public Admin findById(Serializable id);
	
	public PageBean<Admin> getPageBeanByCondition(Map<String,Object> paraMap,int pageIndex,int pageSize);
}
