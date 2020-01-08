package com.dao.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Query;






import com.dao.AdminDao;
import com.entity.Admin;
import com.utils.StringUtils;

public class AdminDaoImpl extends BaseDaoImpl<Admin> implements AdminDao {

	@Override
	public Admin findByNamePwd(String loginName, String password) {
		// TODO Auto-generated method stub
		String hql=" from Admin where adminId=:adminId and password=:password ";
		Integer adminId=StringUtils.str2Integer(loginName, 0);
		Query query=this.getSession().createQuery(hql);
		query.setParameter("adminId", adminId);
		query.setParameter("password", password);
		return (Admin) query.uniqueResult();
	}

	@Override
	public List<Admin> findPageByCondition(Map<String, Object> paraMap,
			int pageIndex, int pageSize) {
		// TODO Auto-generated method stub
		StringBuffer sf=new StringBuffer();
		sf.append(" from Admin where 1=1 ");
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
		sf.append(" select count(*) from Admin where 1=1 ");
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
