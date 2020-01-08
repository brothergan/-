package com.entity;

import java.util.HashSet;
import java.util.Set;


/**
 * d_menu实体映射类
 * @author 淦师兄
 *
 */
public class Menu {
	private Integer menuId;
	private String menuName;
	private String menuUrl;
	private String menuIcon;
	private Integer menuStatus;
	
	private Menu parentMenu;
	private Set<Menu> childMenus=new HashSet<Menu>();
	
	private Set<Button> buttons=new HashSet<Button>();
	
	public Integer getMenuId() {
		return menuId;
	}
	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
	}
	
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	
	public String getMenuUrl() {
		return menuUrl;
	}
	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}
	
	public String getMenuIcon() {
		return menuIcon;
	}
	public void setMenuIcon(String menuIcon) {
		this.menuIcon = menuIcon;
	}
	
	public Integer getMenuStatus() {
		return menuStatus;
	}
	public void setMenuStatus(Integer menuStatus) {
		this.menuStatus = menuStatus;
	}
	
	public Menu getParentMenu() {
		return parentMenu;
	}
	public void setParentMenu(Menu parentMenu) {
		this.parentMenu = parentMenu;
	}
	
	public Set<Menu> getChildMenus() {
		return childMenus;
	}
	public void setChildMenus(Set<Menu> childMenus) {
		this.childMenus = childMenus;
	}
	
	public Set<Button> getButtons() {
		return buttons;
	}
	public void setButtons(Set<Button> buttons) {
		this.buttons = buttons;
	}
	
	
	
}
