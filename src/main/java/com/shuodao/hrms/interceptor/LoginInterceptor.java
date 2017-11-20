package com.shuodao.hrms.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		String from=request.getServletPath();
		String uri=request.getRequestURI();
		if(isIngnoredUri(uri)){
			return true;
		}
		Object obj=request.getSession().getAttribute("adminUser");
		if(obj==null){
			obj=request.getSession().getAttribute("accountRole");
		}
		if(obj==null){
			String path=request.getContextPath()+"/login";
			String queryStr=request.getQueryString();
			if(!StringUtils.isEmpty(queryStr)){
				from=from+"?"+queryStr;
			}
			response.sendRedirect(path+"?from="+from);
			return false;
		}
		return true;
	}

	protected boolean isIngnoredUri(String uri) {
		// TODO Auto-generated method stub
		return uri.matches(".+(?i)(login|logout|403|404|500|400)");
	}
	protected boolean isIndexUri(String uri){
		return uri.matches(".+(?i)(index)+");
	}
}
