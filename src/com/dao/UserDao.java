package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.User;

public interface UserDao extends BaseDao<User> {
	public User findByUserNamePwd(String userLoginName,String password);
	public List<User> findPageByCondition(Map<String,Object> paraMap,int pageIndex,int pageSize);
	public int getCountByCondition(Map<String,Object> paraMap,int pageIndex,int pageSize);
}
