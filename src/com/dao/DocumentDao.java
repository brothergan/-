package com.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.entity.Document;

public interface DocumentDao extends BaseDao<Document> {
	public List<Document> findByUser(Serializable id);
	public List<Document> findPageByCondition(Map<String,Object> paraMap,int pageIndex,int pageSize);
	public List<Document> findPageByUser(Serializable id,int pageIndex,int pageSize);
	public int getCountByUser(Serializable id);
	public int getCountByCondition(Map<String,Object> paraMap,int pageIndex,int pageSize);
}
