package com.service.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.dao.PrivilegeDao;
import com.entity.Privilege;
import com.service.PrivilegeService;

public class PrivilegeServiceImpl implements PrivilegeService {
	private PrivilegeDao privilegeDao;

	public void setPrivilegeDao(PrivilegeDao privilegeDao) {
		this.privilegeDao = privilegeDao;
	}

	@Override
	public void savePrivilege(Privilege entity) {
		// TODO Auto-generated method stub
		privilegeDao.save(entity);
	}

	@Override
	public List<Privilege> getPrivilegesByAdmin(Serializable id) {
		// TODO Auto-generated method stub
		return privilegeDao.findByAdmin(id);
	}

	@Override
	public List<Privilege> getPrivilegesByUser(Serializable id) {
		// TODO Auto-generated method stub
		return privilegeDao.findByUser(id);
	}

	@Override
	public List<Privilege> getPrivilegesByCondition(Map<String, Object> paraMap) {
		// TODO Auto-generated method stub
		return privilegeDao.findByCondition(paraMap);
	}

	@Override
	public void removePrivilege(Privilege entity) {
		// TODO Auto-generated method stub
		privilegeDao.delete(entity);
	}
	
}
