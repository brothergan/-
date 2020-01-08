package com.dao.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Query;

import com.dao.PrivilegeDao;
import com.entity.Privilege;
import com.utils.StringUtils;

public class PrivilegeDaoImpl extends BaseDaoImpl<Privilege> implements PrivilegeDao {

	@Override
	public List<Privilege> findByAdmin(Serializable id) {
		// TODO Auto-generated method stub
		String hql=" from Privilege where roleType=:roleType and roleId=:roleId ";
		Query query=this.getSession().createQuery(hql);
		query.setParameter("roleType", "admin");
		query.setParameter("roleId", id);
		return query.list();
	}

	@Override
	public List<Privilege> findByUser(Serializable id) {
		// TODO Auto-generated method stub
		String hql=" from Privilege where roleType=:roleType and roleId=:roleId ";
		Query query=this.getSession().createQuery(hql);
		query.setParameter("roleType", "user");
		query.setParameter("roleId", id);
		return query.list();
	}

	@Override
	public List<Privilege> findByCondition(Map<String, Object> paraMap) {
		// TODO Auto-generated method stub
		StringBuffer sf=new StringBuffer();
		sf.append(" from Privilege where 1=1 ");
		Set<String> keySet=paraMap.keySet();
		for(String key:keySet){
			if(paraMap.get(key)!=null){
				sf.append(" and "+key+" =:"+key+" ");
			}
		}
		Query query=this.getSession().createQuery(sf.toString());
		query.setProperties(paraMap);
		return query.list();
	}
	
}
