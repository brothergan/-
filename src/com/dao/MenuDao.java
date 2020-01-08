package com.dao;

import java.util.List;

import com.entity.Menu;

public interface MenuDao extends BaseDao<Menu> {
	public List<Menu> findAllMenu();
}
