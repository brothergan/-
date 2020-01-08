package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.Inform;

public interface InformDao extends BaseDao<Inform> {
	public List<Inform> findPageByCondition(Map<String,Object> paraMap,int pageIndex,int pageSize);
	public int getCountByCondition(Map<String,Object> paraMap,int pageIndex,int pageSize);
}
