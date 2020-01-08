package com.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.entity.Privilege;



public interface PrivilegeService {
	public void savePrivilege(Privilege entity);
	
	public List<Privilege> getPrivilegesByAdmin(Serializable id);
	
	public List<Privilege> getPrivilegesByUser(Serializable id);
	
	public List<Privilege> getPrivilegesByCondition(Map<String, Object> paraMap);
	
	public void removePrivilege(Privilege entity);
}
