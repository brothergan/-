package com.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter{
	private String[] filtedURL={
		"login-demo.jsp",
		"register-demo.jsp"
	};
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest req=(HttpServletRequest) request;
		String uri=req.getRequestURI();
		Boolean flag=false;
		for(String i:filtedURL){
			if(uri.endsWith(i)){
				flag=true;
				break;
			}
		}
		if(flag){
			chain.doFilter(request, response);
		}else{
			HttpSession session=req.getSession();
			if(session.getAttribute("loginUser")!=null||session.getAttribute("loginAdmin")!=null){
				chain.doFilter(request, response);
			}else{
				PrintWriter out=response.getWriter();
				out.println("<script type='text/javascript'>top.location.href='login-demo.jsp';</script>");
			}
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
