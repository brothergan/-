package com.dao.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;

import com.dao.DocumentDao;
import com.entity.Document;

public class DocumentDaoImpl extends BaseDaoImpl<Document> implements DocumentDao {

	@Override
	public List<Document> findByUser(Serializable id) {
		// TODO Auto-generated method stub
		String hql=" from Document where user.userId=:userId";
		Query query=this.getSession().createQuery(hql);
		query.setParameter("userId", id);
		return query.list();
	}

	@Override
	public List<Document> findPageByUser(Serializable id, int pageIndex,
			int pageSize) {
		// TODO Auto-generated method stub
		String hql=" from Document where user.userId=:userId and documentStatus=1 ";
		Query query=this.getSession().createQuery(hql);
		query.setParameter("userId", id);
		query.setFirstResult((pageIndex-1)*pageSize);
		query.setMaxResults(pageSize);
		return query.list();
	}

	@Override
	public int getCountByUser(Serializable id) {
		// TODO Auto-generated method stub
		String hql=" select count(*) from Document where user.userId=:userId and documentStatus=1 ";
		Query query=this.getSession().createQuery(hql);
		query.setParameter("userId", id);
		return ((Long)query.uniqueResult()).intValue();
	}

	@Override
	public List<Document> findPageByCondition(Map<String, Object> paraMap,int pageIndex,int pageSize) {
		// TODO Auto-generated method stub
		StringBuffer sf=new StringBuffer();
		sf.append(" from Document where documentStatus=1 ");
		if(paraMap.get("documentName")!=null){
			sf.append(" and documentName like :documentName ");
		}
		if(paraMap.get("documentType")!=null){
			sf.append(" and documentType = :documentType ");
		}
		Query query=this.getSession().createQuery(sf.toString());
		query.setProperties(paraMap);
		query.setFirstResult((pageIndex-1)*pageSize);
		query.setMaxResults(pageSize);
		return query.list();
	}

	@Override
	public int getCountByCondition(Map<String, Object> paraMap,int pageIndex,int pageSize) {
		// TODO Auto-generated method stub
		StringBuffer sf=new StringBuffer();
		sf.append("select count(*) from Document where documentStatus=1 ");
		if(paraMap.get("documentName")!=null){
			sf.append(" and documentName like :documentName ");
		}
		if(paraMap.get("documentType")!=null){
			sf.append(" and documentType = :documentType ");
		}
		Query query=this.getSession().createQuery(sf.toString());
		query.setProperties(paraMap);
		return ((Long)query.uniqueResult()).intValue();
	}
	
	
	
}
