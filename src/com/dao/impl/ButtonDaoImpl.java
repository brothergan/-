package com.dao.impl;

import java.util.List;

import org.hibernate.Query;

import com.dao.ButtonDao;
import com.entity.Button;

public class ButtonDaoImpl extends BaseDaoImpl<Button> implements ButtonDao {

	@Override
	public List<Button> findAllButtons() {
		// TODO Auto-generated method stub
		String hql=" from Button ";
		Query query=this.getSession().createQuery(hql);
		return query.list();
	}
	
}
