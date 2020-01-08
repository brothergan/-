package com.service.impl;

import java.io.Serializable;
import java.util.Map;

import com.dao.UserDao;
import com.entity.Admin;
import com.entity.PageBean;
import com.entity.User;
import com.service.UserService;

public class UserServiceImpl implements UserService {
	private UserDao userDao;

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public void saveUser(User entity) {
		// TODO Auto-generated method stub
		userDao.save(entity);
	}

	@Override
	public User login(String userLoginName, String password) {
		// TODO Auto-generated method stub
		return userDao.findByUserNamePwd(userLoginName, password);
	}

	@Override
	public void updateUser(User entity) {
		// TODO Auto-generated method stub
		userDao.update(entity);
	}

	@Override
	public User findById(Serializable id) {
		// TODO Auto-generated method stub
		return userDao.findById(User.class, id, false);
	}

	@Override
	public PageBean<User> getPageBeanByCondition(Map<String, Object> paraMap,
			int pageIndex, int pageSize) {
		// TODO Auto-generated method stub
		PageBean<User> pageBean=new PageBean<User>();
		pageBean.setPageIndex(pageIndex);
		pageBean.setPageSize(pageSize);
		int count=userDao.getCountByCondition(paraMap, pageIndex, pageSize);
		pageBean.setTotalCount(count);
		pageBean.setPageCount();
		if(count>0){
			pageBean.setList(userDao.findPageByCondition(paraMap, pageIndex, pageSize));
		}
		return pageBean;
	}
	
}
