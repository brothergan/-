package com.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.entity.Privilege;

public interface PrivilegeDao extends BaseDao<Privilege> {
	public List<Privilege> findByAdmin(Serializable id);
	
	public List<Privilege> findByUser(Serializable id);
	
	public List<Privilege> findByCondition(Map<String, Object> paraMap);
}
