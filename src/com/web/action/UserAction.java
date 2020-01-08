package com.web.action;

import java.util.HashMap;
import java.util.Map;

import com.entity.Admin;
import com.entity.PageBean;
import com.entity.User;
import com.entity.UserDetail;
import com.service.UserDetailService;
import com.service.UserService;
import com.utils.StringUtils;

public class UserAction extends BaseAction {
	private UserService userService;
	private UserDetailService userDetailService;
	private Map<String,Object> jsonMap=new HashMap<String, Object>();
	private String userId;
	private String newPassword;
	private String configPassword;
	private int pageIndex;
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public UserDetailService getUserDetailService() {
		return userDetailService;
	}
	public void setUserDetailService(UserDetailService userDetailService) {
		this.userDetailService = userDetailService;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getNewPassword() {
		return newPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	public String getConfigPassword() {
		return configPassword;
	}
	public void setConfigPassword(String configPassword) {
		this.configPassword = configPassword;
	}
	public Map<String, Object> getJsonMap() {
		return jsonMap;
	}
	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	public String getUserMessage(){
		try {
			User user=userService.findById(StringUtils.str2Integer(userId, 0));
			UserDetail detail=userDetailService.findById(StringUtils.str2Integer(userId, 0));
			session.remove("user");
			session.remove("detail");
			session.put("user", user);
			session.put("detail", detail);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "jsonMap";
	}
	
	public String updateUserPassword(){
		try {
			User user=userService.findById(StringUtils.str2Integer(userId, 0));
			if(user!=null){
				user.setPassword(newPassword);
				userService.updateUser(user);
				jsonMap.clear();
				jsonMap.put("msg", "修改密码成功");
			}else{
				jsonMap.clear();
				jsonMap.put("msg", "修改密码失败");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "jsonMap";
	}
	public String listUser(){
		try {
			int pageSize=10;
			Map<String,Object> paraMap=new HashMap<String, Object>();
			PageBean<User> pageBean=userService.getPageBeanByCondition(paraMap, pageIndex, pageSize);
			jsonMap.clear();
			jsonMap.put("pageIndex", pageBean.getPageIndex());
			jsonMap.put("pageCount", pageBean.getPageCount());
			jsonMap.put("totalCount", pageBean.getTotalCount());
			jsonMap.put("pageSize", pageBean.getPageSize());
			jsonMap.put("list", pageBean.getList());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "jsonMap";
	}
	public String suspendUser(){
		try {
			User user=userService.findById(StringUtils.str2Integer(userId, 0));
			user.setUserStatus(0);;
			userService.updateUser(user);;
			session.remove("user");
			session.put("user", user);
			jsonMap.clear();
			jsonMap.put("msg", "禁用用户成功");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "jsonMap";
	}
	public String activeUser(){
		try {
			User user=userService.findById(StringUtils.str2Integer(userId, 0));
			user.setUserStatus(1);;
			userService.updateUser(user);;
			session.remove("user");
			session.put("user", user);
			jsonMap.clear();
			jsonMap.put("msg", "激活用户成功");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "jsonMap";
	}
}
