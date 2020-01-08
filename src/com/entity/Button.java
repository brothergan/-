package com.entity;

/**
 * d_button实体映射类
 * @author 淦师兄
 *
 */
public class Button {
	private Integer buttonId;
	private String buttonName;
	private String buttonUrl="#";
	private Integer buttonStatus;
	
	private Menu menu;
	
	public Integer getButtonId() {
		return buttonId;
	}
	public void setButtonId(Integer buttonId) {
		this.buttonId = buttonId;
	}
	
	public String getButtonName() {
		return buttonName;
	}
	public void setButtonName(String buttonName) {
		this.buttonName = buttonName;
	}
	
	public String getButtonUrl() {
		return buttonUrl;
	}
	public void setButtonUrl(String buttonUrl) {
		this.buttonUrl = buttonUrl;
	}
	
	public Integer getButtonStatus() {
		return buttonStatus;
	}
	public void setButtonStatus(Integer buttonStatus) {
		this.buttonStatus = buttonStatus;
	}
	
	public Menu getMenu() {
		return menu;
	}
	public void setMenu(Menu menu) {
		this.menu = menu;
	}
	
	
}
