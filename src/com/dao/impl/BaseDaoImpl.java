package com.dao.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.dao.BaseDao;

public class BaseDaoImpl<T> extends HibernateDaoSupport implements BaseDao<T> {

	@Override
	public Serializable save(T t) {
		// TODO Auto-generated method stub
		return this.getSession().save(t);
	}

	@Override
	public void update(T t) {
		// TODO Auto-generated method stub
		this.getSession().update(t);
	}

	@Override
	public void delete(T t) {
		// TODO Auto-generated method stub
		this.getSession().delete(t);
	}

	@Override
	public T findById(Class clazz, Serializable id, boolean isLazy) {
		// TODO Auto-generated method stub
		if(isLazy){
			return (T) this.getSession().load(clazz, id);
		}else{
			return (T) this.getSession().get(clazz, id);
		}
	}

	@Override
	public List<T> findByHql(String hql, Map<String, Object> map) {
		// TODO Auto-generated method stub
		Query query=this.getSession().createQuery(hql);
		if(map!=null){
			query.setProperties(map);
		}
		return query.list();
	}
}
