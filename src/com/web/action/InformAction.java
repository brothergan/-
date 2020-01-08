package com.web.action;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import com.entity.Document;
import com.entity.Inform;
import com.entity.PageBean;
import com.entity.User;
import com.service.DocumentService;
import com.service.InformService;
import com.service.UserService;
import com.utils.StringUtils;

public class InformAction extends BaseAction {
	private InformService informService;
	private UserService userService;
	private DocumentService documentService;
	private Map<String,Object> jsonMap=new HashMap<String, Object>();
	private String documentId;
	private String informReason;
	private String userId;
	private int pageIndex;
	private String informId;
	
	public InformService getInformService() {
		return informService;
	}
	public void setInformService(InformService informService) {
		this.informService = informService;
	}
	public UserService getUserService() {
		return userService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public DocumentService getDocumentService() {
		return documentService;
	}
	public void setDocumentService(DocumentService documentService) {
		this.documentService = documentService;
	}
	public Map<String, Object> getJsonMap() {
		return jsonMap;
	}
	public String getDocumentId() {
		return documentId;
	}
	public void setDocumentId(String documentId) {
		this.documentId = documentId;
	}
	public String getInformReason() {
		return informReason;
	}
	public void setInformReason(String informReason) {
		this.informReason = informReason;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	public String getInformId() {
		return informId;
	}
	public void setInformId(String informId) {
		this.informId = informId;
	}
	public String informDocument(){
		try {
			Inform inform=new Inform();
			inform.setInformType("document");
			inform.setTargetId(StringUtils.str2Integer(documentId, 0));
			inform.setInformReason(informReason);
			inform.setInformDate(new Timestamp(System.currentTimeMillis()));
			informService.saveInform(inform);
			jsonMap.clear();
			jsonMap.put("msg", "举报成功");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "jsonMap";
	}
	public String informUser(){
		try {
			Inform inform=new Inform();
			inform.setInformType("user");
			inform.setTargetId(StringUtils.str2Integer(userId, 0));
			inform.setInformReason(informReason);
			inform.setInformDate(new Timestamp(System.currentTimeMillis()));
			informService.saveInform(inform);
			jsonMap.clear();
			jsonMap.put("msg", "举报成功");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "jsonMap";
	}
	public String informList(){
		try {
			int pageSize=10;
			Map<String,Object> paraMap=new HashMap<String, Object>();
			PageBean<Inform> pageBean=informService.getPageBeanByCondition(paraMap, pageIndex, pageSize);
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
	public String loadInformById(){
		try {
			session.remove("informUser");
			session.remove("informDocument");
			Inform inform=informService.findById(StringUtils.str2Integer(informId, 0));
			if(inform!=null){
				if("user".equals(inform.getInformType())){
					User informUser=userService.findById(inform.getTargetId());
					
					session.put("informUser", informUser);
				}else if("document".equals(inform.getInformType())){
					Document informDocument=documentService.findById(inform.getTargetId());
					
					session.put("informDocument", informDocument);
				}
				session.remove("informMessage");
				session.put("informMessage", inform);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return "jsonMap";
	}
}
