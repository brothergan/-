package com.dao.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;

import com.dao.UserDao;
import com.entity.User;

public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao {

	@Override
	public User findByUserNamePwd(String userLoginName, String password) {
		// TODO Auto-generated method stub
		String hql="from User where userLoginName=:userLoginName and password=:password ";
		Session session=this.getSession();
		Query query=session.createQuery(hql);
		query.setParameter("userLoginName", userLoginName);
		query.setParameter("password", password);
		return (User) query.uniqueResult();
	}

	@Override
	public List<User> findPageByCondition(Map<String, Object> paraMap,
			int pageIndex, int pageSize) {
		// TODO Auto-generated method stub
		StringBuffer sf=new StringBuffer();
		sf.append(" from User where 1=1 ");
		Set<String> keySets=paraMap.keySet();
		for(String key:keySets){
			if(paraMap.get(key)!=null){
				sf.append(" and "+key+" =:"+key+" ");
			}
		}
		Query query=this.getSession().createQuery(sf.toString());
		query.setProperties(paraMap);
		query.setFirstResult((pageIndex-1)*pageSize);
		query.setMaxResults(pageSize);
		return query.list();
	}

	@Override
	public int getCountByCondition(Map<String, Object> paraMap, int pageIndex,
			int pageSize) {
		// TODO Auto-generated method stub
		StringBuffer sf=new StringBuffer();
		sf.append(" select count(*) from User where 1=1 ");
		if(paraMap.size()>0){
			Set<String> keySets=paraMap.keySet();
			for(String key:keySets){
				if(paraMap.get(key)!=null){
					sf.append(" and "+key+" =:"+key+" ");
				}
			}
		}
		Query query=this.getSession().createQuery(sf.toString());
		query.setProperties(paraMap);
		return ((Long)query.uniqueResult()).intValue();
	}
	
}
