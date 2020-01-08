package com.web.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.codehaus.jackson.map.ObjectMapper;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class BaseAction extends ActionSupport 
	implements ServletRequestAware,SessionAware,ServletResponseAware {
	protected HttpServletRequest request;
	protected HttpServletResponse response;
	protected Map<String, Object> session;
	

	@Override
	public void setServletResponse(HttpServletResponse response) {
		// TODO Auto-generated method stub
		if(response==null){
		this.response=ServletActionContext.getResponse();
		}else{
			this.response=response;
		}
	}

	@Override
	public void setSession(Map<String, Object> session) {
		// TODO Auto-generated method stub
		if(session==null){
			this.session=ActionContext.getContext().getSession();
		}else{
			this.session=session;
		}
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		if(request==null){
			this.request=ServletActionContext.getRequest();
		}else{
			this.request=request;
		}	
	}

}
