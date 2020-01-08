package com.test;

import java.sql.Timestamp;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;















import com.entity.Admin;
import com.entity.Annotation;
import com.entity.Button;
import com.entity.Menu;
import com.entity.Privilege;
import com.entity.User;
import com.entity.UserDetail;
import com.service.AdminService;
import com.service.AnnotationService;
import com.service.ButtonService;
import com.service.MenuService;
import com.service.PrivilegeService;
import com.service.UserService;

public class TestSystem {
	@Test
	public void testSave(){
		ApplicationContext ac=new ClassPathXmlApplicationContext("applicationContext.xml");
		MenuService menuService=(MenuService) ac.getBean("menuService");
		ButtonService buttonService=(ButtonService) ac.getBean("buttonService");
		PrivilegeService privilegeService=(PrivilegeService) ac.getBean("privilegeService");
		try {
//			Menu entity=new Menu();
//			entity.setMenuName("公告发布");
//			entity.setMenuStatus(1);
////			
//			Menu parentMenu=menuService.findById(7);
//			parentMenu.getChildMenus().add(entity);
////			parentMenu.setMenuStatus(0);
//			entity.setParentMenu(parentMenu);
//			menuService.saveMenu(entity);
//			menuService.updateMenu(parentMenu);
			
//			Button button=new Button();
//			button.setButtonName("举报用户");
//			button.setButtonUrl("informUser.jsp");
//			button.setButtonStatus(1);
//			Menu menu=menuService.findById(3);
//			button.setMenu(menu);
//			menu.getButtons().add(button);
//			buttonService.saveButton(button);
//			menuService.updateMenu(menu);
			
			Privilege privilege=new Privilege();
			privilege.setRoleType("admin");
			privilege.setRoleId(1);
			privilege.setResourceType("button");
			privilege.setResourceId(15);
			privilegeService.savePrivilege(privilege);
			
//			Menu entity=menuService.findById(14);
//			entity.setMenuUrl("publishAnnotation.jsp");
//			menuService.updateMenu(entity);
//			Menu entity=menuService.findById(7);
//			System.out.println(entity.getMenuUrl());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}
}
