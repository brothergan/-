package com.web.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;

import com.entity.Button;
import com.entity.Menu;
import com.entity.Privilege;
import com.service.ButtonService;
import com.service.MenuService;
import com.service.PrivilegeService;
import com.utils.StringUtils;

public class PrivilegeAction extends BaseAction {
	private MenuService menuService;
	private ButtonService buttonService;
	private PrivilegeService privilegeService;
	private Map<String, Object> jsonMap=new HashMap<String, Object>();
	private String roleType;
	private String roleId;
	private String newPrivileges;
	
	public MenuService getMenuService() {
		return menuService;
	}

	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}

	public ButtonService getButtonService() {
		return buttonService;
	}

	public void setButtonService(ButtonService buttonService) {
		this.buttonService = buttonService;
	}

	public PrivilegeService getPrivilegeService() {
		return privilegeService;
	}

	public void setPrivilegeService(PrivilegeService privilegeService) {
		this.privilegeService = privilegeService;
	}

	public Map<String, Object> getJsonMap() {
		return jsonMap;
	}

	public String getRoleType() {
		return roleType;
	}

	public void setRoleType(String roleType) {
		this.roleType = roleType;
	}

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getNewPrivileges() {
		return newPrivileges;
	}

	public void setNewPrivileges(String newPrivileges) {
		this.newPrivileges = newPrivileges;
	}

	public String loadPrivileges(){
		try {
			Map<String, Object> paraMap=new HashMap<String, Object>();
			List<Menu> menuList=menuService.findAllMenus();
			List<Button> buttonList=buttonService.findAllButtons();
			if(roleType!=null&&roleId!=null){
				paraMap.put("roleType", roleType);
				paraMap.put("roleId",StringUtils.str2Integer(roleId, 0));
				List<Privilege> privilegeList=privilegeService.getPrivilegesByCondition(paraMap);
				resetSelectedStatus(privilegeList, menuList, buttonList);		
			}
			session.remove("roleType");
			session.remove("roleId");
			session.remove("menuList");
			session.remove("buttonList");
			session.put("roleType", roleType);
			session.put("roleId", roleId);
			session.put("menuList",menuList);
			session.put("buttonList", buttonList);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "jsonMap";
	}
	
	public String updatePrivileges(){
		try {
			Map<String, Object> paraMap=new HashMap<String, Object>();
			if(roleType!=null&&roleId!=null){
				paraMap.put("roleType", roleType);
				paraMap.put("roleId", StringUtils.str2Integer(roleId, 0));
				List<Privilege> privilegeList=privilegeService.getPrivilegesByCondition(paraMap);
				for(Privilege p:privilegeList){
					privilegeService.removePrivilege(p);
				}
				if(newPrivileges!=null&&newPrivileges.trim().length()>0){
					String[] newPriv=newPrivileges.split("/");
					for(int i=0;i<newPriv.length;i++){
						String[] resourceInfo=newPriv[i].split("_");
						Privilege newPrivilege=new Privilege();
						newPrivilege.setRoleType(roleType);
						newPrivilege.setRoleId(StringUtils.str2Integer(roleId, 0));
						newPrivilege.setResourceType(resourceInfo[0]);
						newPrivilege.setResourceId(StringUtils.str2Integer(resourceInfo[1], 0));
						privilegeService.savePrivilege(newPrivilege);
					}
				}
				jsonMap.clear();
				jsonMap.put("msg", "修改权限成功");
			}else{
				jsonMap.clear();
				jsonMap.put("msg", "修改权限失败");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "jsonMap";
	}
	
	public void resetSelectedStatus(List<Privilege> privilegeList,List<Menu> menuList,List<Button> buttonList){
		if(privilegeList!=null&&privilegeList.size()>0
				&& menuList!=null&&menuList.size()>0
					&& buttonList!=null&&buttonList.size()>0){
			for(Menu m:menuList){
				for(Privilege p:privilegeList){
					if("menu".equals(p.getResourceType())){
						if(p.getResourceId().intValue()==m.getMenuId().intValue()){
							m.setMenuStatus(1);
							break;
						}else{
							m.setMenuStatus(0);
						}
					}
				}
			}
			for(Button b:buttonList){
				for(Privilege p:privilegeList){
					if("button".equals(p.getResourceType())){
						if(p.getResourceId().intValue()==b.getButtonId().intValue()){
							b.setButtonStatus(1);
							break;
						}else{
							b.setButtonStatus(0);
						}
					}
				}
			}
		}else{
			for(Menu m:menuList){
				m.setMenuStatus(0);
			}
			for(Button b:buttonList){
				b.setButtonStatus(0);
			}
		}
	}
}
