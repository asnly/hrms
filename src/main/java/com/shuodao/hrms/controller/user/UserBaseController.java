package com.shuodao.hrms.controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shuodao.hrms.db.entity.Account;
import com.shuodao.hrms.db.entity.AccountRole;

@Controller
@RequestMapping("/user/*")
public class UserBaseController {
	protected static final String NAMESPACE="user";
	protected String errMsg;
	@Autowired
	protected HttpSession session;
	@Autowired
	protected HttpServletRequest request;
	protected String ftl(String ftlFilename){
		return NAMESPACE+"/"+ftlFilename;
	}
	public String errMsg(){
		return errMsg;
	}
	public AccountRole getAccount(){
		return (AccountRole) session.getAttribute("accountRole");
	}
	public String getReferUrl(){
		return request.getHeader("referer");
	}
}
