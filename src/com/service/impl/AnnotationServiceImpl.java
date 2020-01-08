package com.service.impl;

import java.io.Serializable;
import java.util.Map;

import com.dao.AnnotationDao;
import com.entity.Annotation;
import com.entity.PageBean;
import com.service.AnnotationService;

public class AnnotationServiceImpl implements AnnotationService {
	private AnnotationDao annotationDao;

	public void setAnnotationDao(AnnotationDao annotationDao) {
		this.annotationDao = annotationDao;
	}

	@Override
	public void saveAnnotation(Annotation entity) {
		// TODO Auto-generated method stub
		annotationDao.save(entity);
	}

	@Override
	public PageBean<Annotation> getPageBeanByCondition(
			Map<String, Object> paraMap, int pageIndex, int pageSize) {
		// TODO Auto-generated method stub
		PageBean<Annotation> pageBean=new PageBean<Annotation>();
		pageBean.setPageIndex(pageIndex);
		pageBean.setPageSize(pageSize);
		int count=annotationDao.getCountByCondition(paraMap, pageIndex, pageSize);
		pageBean.setTotalCount(count);
		pageBean.setPageCount();
		if(count>0){
			pageBean.setList(annotationDao.findPageByCondition(paraMap, pageIndex, pageSize));
		}
		return pageBean;
	}

	@Override
	public Annotation findById(Serializable id) {
		// TODO Auto-generated method stub
		return annotationDao.findById(Annotation.class, id, false);
	}
	
	
}
