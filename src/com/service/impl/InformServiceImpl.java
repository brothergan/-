package com.service.impl;

import java.io.Serializable;
import java.util.Map;

import com.dao.InformDao;
import com.entity.Inform;
import com.entity.PageBean;
import com.service.InformService;

public class InformServiceImpl implements InformService {
	private InformDao informDao;

	public void setInformDao(InformDao informDao) {
		this.informDao = informDao;
	}

	@Override
	public void saveInform(Inform entity) {
		// TODO Auto-generated method stub
		informDao.save(entity);
	}

	@Override
	public PageBean<Inform> getPageBeanByCondition(Map<String, Object> paraMap,
			int pageIndex, int pageSize) {
		// TODO Auto-generated method stub
		PageBean<Inform> pageBean=new PageBean<Inform>();
		pageBean.setPageIndex(pageIndex);
		pageBean.setPageSize(pageSize);
		int count=informDao.getCountByCondition(paraMap, pageIndex, pageSize);
		pageBean.setTotalCount(count);
		pageBean.setPageCount();
		if(count>0){
			pageBean.setList(informDao.findPageByCondition(paraMap, pageIndex, pageSize));
		}
		return pageBean;
	}

	@Override
	public Inform findById(Serializable id) {
		// TODO Auto-generated method stub
		return informDao.findById(Inform.class, id, false);
	}
	
}
