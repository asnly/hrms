package com.shuodao.hrms.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shuodao.hrms.db.entity.Account;
import com.shuodao.hrms.db.entity.AdminUser;

@Controller
@RequestMapping("/admin/*")
public class AdminUserBaseController {
	protected static final String NAMESPACE="admin";
	//protected static final String SESSION_KEY_ID="currentId";
	protected String errMsg;
	@Autowired
	protected HttpSession session;
	@Autowired
	protected HttpServletRequest request;
	//protected static final String SESSION_KEY_SHOP_ID
	protected String ftl(String ftlFilename){
		return NAMESPACE+"/"+ftlFilename;
	}
	public String getErrorMsg(){
		return errMsg;
	}
	public AdminUser getAdminUser(){
		return (AdminUser) session.getAttribute("adminUser");
	}
	public String getReferUrl(){
		return request.getHeader("referer");
	}
//	public String getCurrentId(){
//		System.out.println(session.getAttribute(SESSION_KEY_ID));
//		return (String) session.getAttribute(SESSION_KEY_ID);
//	}
	
}
