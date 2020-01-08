package com.service.impl;

import java.io.Serializable;
import java.util.List;

import com.dao.ButtonDao;
import com.entity.Button;
import com.service.ButtonService;

public class ButtonServiceImpl implements ButtonService {
	private ButtonDao buttonDao;

	public void setButtonDao(ButtonDao buttonDao) {
		this.buttonDao = buttonDao;
	}

	@Override
	public void saveButton(Button entity) {
		// TODO Auto-generated method stub
		buttonDao.save(entity);
	}

	@Override
	public Button findById(Serializable id) {
		// TODO Auto-generated method stub
		return buttonDao.findById(Button.class, id, false);
	}

	@Override
	public List<Button> findAllButtons() {
		// TODO Auto-generated method stub
		return buttonDao.findAllButtons();
	}
	

}
