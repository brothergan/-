package com.web.action;

import java.util.HashMap;
import java.util.Map;

import com.entity.Admin;
import com.entity.PageBean;
import com.service.AdminService;
import com.utils.StringUtils;

public class AdminAction extends BaseAction {
	private AdminService adminService;
	private Map<String,Object> jsonMap=new HashMap<String, Object>();
	private String adminId;
	private String newPassword;
	private String configPassword;
	private int pageIndex;
	public AdminService getAdminService() {
		return adminService;
	}
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
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
	
	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	public Map<String, Object> getJsonMap() {
		return jsonMap;
	}
	public String updateAdminPassword(){
		try {
			Admin admin=adminService.findById(StringUtils.str2Integer(adminId, 0));
			if(admin!=null){
				admin.setPassword(newPassword);
				adminService.updateAdmin(admin);
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
	public String listAdmin(){
		try {
			int pageSize=10;
			Map<String,Object> paraMap=new HashMap<String, Object>();
			PageBean<Admin> pageBean=adminService.getPageBeanByCondition(paraMap, pageIndex, pageSize);
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
	public String loadAdminById(){
		try{
			session.remove("admin");
			Admin admin=adminService.findById(StringUtils.str2Integer(adminId, 0));
			if(admin!=null){
				session.put("admin", admin);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return "jsonMap";
	}
	public String suspendAdmin(){
		try {
			Admin admin=adminService.findById(StringUtils.str2Integer(adminId, 0));
			admin.setAdminStatus(0);
			adminService.updateAdmin(admin);
			session.remove("admin");
			session.put("admin", admin);
			jsonMap.clear();
			jsonMap.put("msg", "禁用管理员成功");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "jsonMap";
	}
	public String activeAdmin(){
		try {
			Admin admin=adminService.findById(StringUtils.str2Integer(adminId, 0));
			admin.setAdminStatus(1);
			adminService.updateAdmin(admin);
			session.remove("admin");
			session.put("admin", admin);
			jsonMap.clear();
			jsonMap.put("msg", "激活管理员成功");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "jsonMap";
	}
	public String addAdmin(){
		Admin admin=new Admin();
		admin.setPassword("123456");
		admin.setAdminStatus(1);
		try {
			adminService.saveAdmin(admin);	
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		jsonMap.clear();
		jsonMap.put("msg", "新建管理员成功");
		return "jsonMap";
	}
}
