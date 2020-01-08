package com.web.action;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;

import com.entity.Admin;
import com.entity.Button;
import com.entity.Menu;
import com.entity.Privilege;
import com.entity.User;
import com.entity.UserDetail;
import com.service.AdminService;
import com.service.ButtonService;
import com.service.MenuService;
import com.service.PrivilegeService;
import com.service.UserService;
import com.utils.StringUtils;

public class LoginAction extends BaseAction {
	private String userLoginName;
	private String password;
	private String rePassword;
	private String sex;
	private String identity;
	private Map<String,Object> jsonMap=new HashMap<String, Object>();
	private AdminService adminService;
	private UserService userService;
	private PrivilegeService privilegeService;
	private MenuService menuService;
	private ButtonService buttonService;
	
	public String login() throws Exception{
		setSession(null);
		if("admin".equals(identity)){
			Admin admin=adminService.login(userLoginName, password);
			if(admin!=null){
				if(admin.getAdminStatus()!=1){
					jsonMap.clear();
					jsonMap.put("status", 0);
					jsonMap.put("msg", "该账号已被禁用，无法登陆");
//					json=mapper.writeValueAsString(jsonMap);
					return "jsonMap";
				}
				admin.setLastLoginTime(new Timestamp(System.currentTimeMillis()));
				adminService.updateAdmin(admin);
				List<Privilege> adminPrivileges=privilegeService.getPrivilegesByAdmin(admin.getAdminId());
				List<Menu> menuList=new ArrayList<Menu>();
				List<Button> buttonList=new ArrayList<Button>();
				for(Privilege privilege:adminPrivileges){
					if("menu".equals(privilege.getResourceType())){
						Menu menu=menuService.findById(privilege.getResourceId());
						menuList.add(menu);
					}else{
						Button button=buttonService.findById(privilege.getResourceId());
						buttonList.add(button);
					}
				}
				session.clear();
				session.put("loginAdmin", admin);
				session.put("privileges", adminPrivileges);
				session.put("menus", menuList);
				session.put("buttons", buttonList);
				jsonMap.clear();
				jsonMap.put("status", 1);
			}else{
				jsonMap.clear();
				jsonMap.put("status", 0);
				jsonMap.put("msg", "用户名或密码错误");
			}
		}else{
			User user=userService.login(userLoginName, password);
			if(user!=null){
				if(user.getUserStatus()!=1){
					jsonMap.clear();
					jsonMap.put("status", 0);
					jsonMap.put("msg", "该账号已被禁用，无法登陆");
//					json=mapper.writeValueAsString(jsonMap);
					return "jsonMap";
				}
				user.setLastLoginTime(new Timestamp(System.currentTimeMillis()));
				userService.updateUser(user);
				List<Privilege> userPrivileges=privilegeService.getPrivilegesByUser(user.getUserId());
				List<Menu> menuList=new ArrayList<Menu>();
				List<Button> buttonList=new ArrayList<Button>();
				for(Privilege privilege:userPrivileges){
					if("menu".equals(privilege.getResourceType())){
						Menu menu=menuService.findById(privilege.getResourceId());
						menuList.add(menu);
					}else{
						Button button=buttonService.findById(privilege.getResourceId());
						buttonList.add(button);
					}
				}
				session.clear();
				session.put("loginUser", user);
				session.put("privileges", userPrivileges);
				session.put("menus", menuList);
				session.put("buttons", buttonList);
				jsonMap.clear();
				jsonMap.put("status", 1);
			}else{
				jsonMap.clear();
				jsonMap.put("status", 0);
				jsonMap.put("msg", "用户名或密码错误");
			}
		}
//		json=mapper.writeValueAsString(jsonMap);
		return "jsonMap";
	}
	
	public String register() throws Exception{
		setSession(null);
		User user=new User();
		user.setUserLoginName(userLoginName);
		user.setPassword(password);
		user.setUserStatus(1);
		UserDetail userDetail=new UserDetail();
		userDetail.setSex(StringUtils.str2Integer(sex, 1));
		user.setUserDetail(userDetail);
		userDetail.setUser(user);
		try {
			userService.saveUser(user);
			User user1=userService.login(userLoginName, password);
			this.setPrivilegesForNewUser(user1);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		jsonMap.clear();
		jsonMap.put("msg", "注册成功");
		return "jsonMap";
	}
	
	public String quit(){
		session.clear();
		return "success";
	}

	public void setPrivilegesForNewUser(User user){
		for(Integer i=1;i<=6;i++){
			Privilege privilege=new Privilege();
			privilege.setRoleType("user");
			privilege.setRoleId(user.getUserId());
			privilege.setResourceType("menu");
			privilege.setResourceId(i);
			privilegeService.savePrivilege(privilege);
		}
		for(Integer i=1;i<=8;i++){
			Privilege privilege=new Privilege();
			privilege.setRoleType("user");
			privilege.setRoleId(user.getUserId());
			privilege.setResourceType("button");
			privilege.setResourceId(i);
			privilegeService.savePrivilege(privilege);
		}
		for(Integer i=16;i<=17;i++){
			Privilege privilege=new Privilege();
			privilege.setRoleType("user");
			privilege.setRoleId(user.getUserId());
			privilege.setResourceType("button");
			privilege.setResourceId(i);
			privilegeService.savePrivilege(privilege);
		}
	}
	
	public String getUserLoginName() {
		return userLoginName;
	}

	public void setUserLoginName(String userLoginName) {
		this.userLoginName = userLoginName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getIdentity() {
		return identity;
	}

	public void setIdentity(String identity) {
		this.identity = identity;
	}

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public void setPrivilegeService(PrivilegeService privilegeService) {
		this.privilegeService = privilegeService;
	}
	
	public void setMenuService(MenuService menuService) {
		this.menuService = menuService;
	}

	public void setButtonService(ButtonService buttonService) {
		this.buttonService = buttonService;
	}

	public Map<String, Object> getJsonMap() {
		return jsonMap;
	}

	public String getRePassword() {
		return rePassword;
	}

	public void setRePassword(String rePassword) {
		this.rePassword = rePassword;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	
	
	
}
