package com.service.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.dao.DocumentDao;
import com.entity.Document;
import com.entity.PageBean;
import com.service.DocumentService;

public class DocumentServiceImpl implements DocumentService {
	private DocumentDao documentDao;

	public void setDocumentDao(DocumentDao documentDao) {
		this.documentDao = documentDao;
	}

	@Override
	public void saveDocument(Document entity) {
		// TODO Auto-generated method stub
		documentDao.save(entity);
	}

	@Override
	public List<Document> findByUser(Serializable id) {
		// TODO Auto-generated method stub
		return documentDao.findByUser(id);
	}

	@Override
	public PageBean<Document> getPageBeanByUser(Serializable id, int pageIndex,
			int pageSize) {
		// TODO Auto-generated method stub
		PageBean<Document> pageBean=new PageBean<Document>();
		pageBean.setPageIndex(pageIndex);
		pageBean.setPageSize(pageSize);
		int count=documentDao.getCountByUser(id);
		pageBean.setTotalCount(count);
		pageBean.setPageCount();
		if(count>0){
			pageBean.setList(documentDao.findPageByUser(id, pageIndex, pageSize));
		}
		return pageBean;
	}

	@Override
	public Document findById(Serializable id) {
		// TODO Auto-generated method stub
		return documentDao.findById(Document.class, id, false);
	}

	@Override
	public void updateDocument(Document entity) {
		// TODO Auto-generated method stub
		documentDao.update(entity);
	}

	@Override
	public PageBean<Document> getPageBeanByCondition(
			Map<String, Object> paraMap, int pageIndex, int pageSize) {
		// TODO Auto-generated method stub
		PageBean<Document> pageBean=new PageBean<Document>();
		pageBean.setPageIndex(pageIndex);
		pageBean.setPageSize(pageSize);
		int count=documentDao.getCountByCondition(paraMap, pageIndex, pageSize);
		pageBean.setTotalCount(count);
		pageBean.setPageCount();
		if(count>0){
			pageBean.setList(documentDao.findPageByCondition(paraMap, pageIndex, pageSize));
		}
		return pageBean;
	}
	
}
