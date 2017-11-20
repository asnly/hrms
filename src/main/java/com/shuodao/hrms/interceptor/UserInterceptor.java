package com.shuodao.hrms.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class UserInterceptor extends HandlerInterceptorAdapter{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		String uri=request.getRequestURI();
		String from=request.getServletPath();
		if(isIngored(uri)){
			return true;
		}
		Object obj=request.getSession().getAttribute("accountRole");
		if(obj==null){
			String path=request.getContextPath()+"/login";
			String queryStr=request.getQueryString();
			if(!StringUtils.isEmpty(queryStr)){
				from=from+"?"+queryStr;
			}
			response.sendRedirect(path+"?form"+from);
			return false;
		}
		return true;
	}

	protected boolean isIngored(String uri) {
		// TODO Auto-generated method stub
		return uri.matches(".+(?i)(login|logout|403|404|400|500)+");
	}
	protected boolean isIndexUri(String uri){
		return uri.matches(".+(?i)(index)+");
	}
}
