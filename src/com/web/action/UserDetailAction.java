package com.web.action;

import java.util.HashMap;
import java.util.Map;

import com.entity.User;
import com.entity.UserDetail;
import com.service.UserDetailService;
import com.service.UserService;

public class UserDetailAction extends BaseAction {
	private UserDetailService userDetailService;
	private UserService userService;
	private Map<String,Object> jsonMap=new HashMap<String, Object>();
	private String userLoginName;
	private String telephone;
	private String mail;
	private String sign;

	public UserDetailService getUserDetailService() {
		return userDetailService;
	}

	public void setUserDetailService(UserDetailService userDetailService) {
		this.userDetailService = userDetailService;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public Map<String, Object> getJsonMap() {
		return jsonMap;
	}
	
	
	public String getUserLoginName() {
		return userLoginName;
	}

	public void setUserLoginName(String userLoginName) {
		this.userLoginName = userLoginName;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public String getUserDetailById(){
		try {
			User user=(User) session.get("loginUser");
			UserDetail detail=userDetailService.findById(user.getUserId());
			session.remove("userDetail");
			session.put("userDetail", detail);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "jsonMap";
	}
	
	public String updateUserInfo(){
		try {
			User user=userService.findById(((User)session.get("loginUser")).getUserId());
			user.setUserLoginName(userLoginName);
			userService.updateUser(user);
			UserDetail detail=userDetailService.findById(((User)session.get("loginUser")).getUserId());
			detail.setTelephone(telephone);
			detail.setMail(mail);
			detail.setSign(sign);
			userDetailService.updateDetail(detail);
			jsonMap.clear();
			jsonMap.put("msg", "更新完成");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "jsonMap";
	}
}
