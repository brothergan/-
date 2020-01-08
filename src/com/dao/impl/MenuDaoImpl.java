package com.dao.impl;

import java.util.List;

import org.hibernate.Query;

import com.dao.MenuDao;
import com.entity.Menu;

public class MenuDaoImpl extends BaseDaoImpl<Menu> implements MenuDao {

	@Override
	public List<Menu> findAllMenu() {
		// TODO Auto-generated method stub
		String hql=" from Menu ";
		Query query=this.getSession().createQuery(hql);
		return query.list();
	}
	
}
