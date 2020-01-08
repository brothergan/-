package com.dao.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Query;

import com.dao.InformDao;
import com.entity.Inform;

public class InformDaoImpl extends BaseDaoImpl<Inform> implements InformDao {

	@Override
	public List<Inform> findPageByCondition(Map<String, Object> paraMap,
			int pageIndex, int pageSize) {
		// TODO Auto-generated method stub
		StringBuffer sf=new StringBuffer();
		sf.append(" from Inform where 1=1 ");
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
		sf.append(" select count(*) from Inform where 1=1 ");
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
