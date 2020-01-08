package com.service.impl;

import java.io.Serializable;
import java.util.List;

import com.dao.MenuDao;
import com.entity.Menu;
import com.service.MenuService;

public class MenuServiceImpl implements MenuService {
	private MenuDao menuDao;

	public void setMenuDao(MenuDao menuDao) {
		this.menuDao = menuDao;
	}

	@Override
	public void saveMenu(Menu entity) {
		// TODO Auto-generated method stub
		menuDao.save(entity);
	}

	@Override
	public Menu findById(Serializable id) {
		// TODO Auto-generated method stub
		return menuDao.findById(Menu.class, id, false);
	}

	@Override
	public void updateMenu(Menu entity) {
		// TODO Auto-generated method stub
		menuDao.update(entity);
	}

	@Override
	public List<Menu> findAllMenus() {
		// TODO Auto-generated method stub
		return menuDao.findAllMenu();
	}
}
