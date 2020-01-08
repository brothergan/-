package com.service;

import java.io.Serializable;

import com.entity.UserDetail;



public interface UserDetailService {
	public void saveUserDetail(UserDetail entity);
	
	public UserDetail findById(Serializable id);
	
	public void updateDetail(UserDetail entity);
}
