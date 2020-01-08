package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.Admin;

public interface AdminDao extends BaseDao<Admin> {
	public Admin findByNamePwd(String loginName,String password);
	public List<Admin> findPageByCondition(Map<String,Object> paraMap,int pageIndex,int pageSize);
	public int getCountByCondition(Map<String,Object> paraMap,int pageIndex,int pageSize);
}
