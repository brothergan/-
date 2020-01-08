package com.service;

import java.io.Serializable;
import java.util.Map;

import com.entity.Admin;
import com.entity.PageBean;
import com.entity.User;



public interface UserService {
	public void saveUser(User entity);
	
	public User login(String userLoginName,String password);
	
	public void updateUser(User entity);
	
	public User findById(Serializable id);
	
	public PageBean<User> getPageBeanByCondition(Map<String,Object> paraMap,int pageIndex,int pageSize);
}
