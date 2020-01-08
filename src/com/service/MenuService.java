package com.service;

import java.io.Serializable;
import java.util.List;

import com.entity.Menu;



public interface MenuService {
	public void saveMenu(Menu entity);
	
	public Menu findById(Serializable id);
	
	public void updateMenu(Menu entity);
	
	public List<Menu> findAllMenus();
}
