package com.service.impl;

import java.io.Serializable;
import java.util.Map;

import com.dao.AdminDao;
import com.entity.Admin;
import com.entity.PageBean;
import com.service.AdminService;

public class AdminServiceImpl implements AdminService {
	private AdminDao adminDao;
	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}


	@Override
	public void saveAdmin(Admin entity) {
		// TODO Auto-generated method stub
		adminDao.save(entity);
	}


	@Override
	public Admin login(String loginName, String password) {
		// TODO Auto-generated method stub
		return adminDao.findByNamePwd(loginName, password);
	}


	@Override
	public void updateAdmin(Admin entity) {
		// TODO Auto-generated method stub
		adminDao.update(entity);
	}


	@Override
	public Admin findById(Serializable id) {
		// TODO Auto-generated method stub
		return adminDao.findById(Admin.class, id, false);
	}


	@Override
	public PageBean<Admin> getPageBeanByCondition(Map<String, Object> paraMap,
			int pageIndex, int pageSize) {
		// TODO Auto-generated method stub
		PageBean<Admin> pageBean=new PageBean<Admin>();
		pageBean.setPageIndex(pageIndex);
		pageBean.setPageSize(pageSize);
		int count=adminDao.getCountByCondition(paraMap, pageIndex, pageSize);
		pageBean.setTotalCount(count);
		pageBean.setPageCount();
		if(count>0){
			pageBean.setList(adminDao.findPageByCondition(paraMap, pageIndex, pageSize));
		}
		return pageBean;
	}

}
