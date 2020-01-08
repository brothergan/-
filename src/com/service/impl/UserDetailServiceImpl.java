package com.service.impl;

import java.io.Serializable;

import com.dao.UserDetailDao;
import com.entity.UserDetail;

public class UserDetailServiceImpl implements com.service.UserDetailService{
	private UserDetailDao userDetailDao;

	public void setUserDetailDao(UserDetailDao userDetailDao) {
		this.userDetailDao = userDetailDao;
	}

	@Override
	public void saveUserDetail(UserDetail entity) {
		// TODO Auto-generated method stub
		userDetailDao.save(entity);
	}

	@Override
	public UserDetail findById(Serializable id) {
		// TODO Auto-generated method stub
		return userDetailDao.findById(UserDetail.class, id, false);
	}

	@Override
	public void updateDetail(UserDetail entity) {
		// TODO Auto-generated method stub
		userDetailDao.update(entity);
	}
	
}
