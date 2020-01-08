package com.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public interface BaseDao<T> {
	public Serializable save(T t);
	public void update(T t);
	public void delete(T t);
	public T findById(Class clazz,Serializable id,boolean isLazy);
	public List<T> findByHql(String hql,Map<String, Object> map);
}
