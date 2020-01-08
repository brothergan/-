package com.service;

import java.io.Serializable;
import java.util.List;

import com.entity.Button;



public interface ButtonService {
	public void saveButton(Button entity);
	
	public Button findById(Serializable id);
	
	public List<Button> findAllButtons();
}
