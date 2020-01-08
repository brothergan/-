package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.Annotation;

public interface AnnotationDao extends BaseDao<Annotation> {
	public List<Annotation> findPageByCondition(Map<String,Object> paraMap,int pageIndex,int pageSize);
	public int getCountByCondition(Map<String,Object> paraMap,int pageIndex,int pageSize);
}
