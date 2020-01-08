package com.dao;

import java.util.List;

import com.entity.Button;

public interface ButtonDao extends BaseDao<Button> {
	public List<Button> findAllButtons();
}
