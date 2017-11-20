package com.shuodao.hrms.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shuodao.hrms.db.entity.AccountRole;

@Controller
public class UserIndexController extends UserBaseController{
	@RequestMapping(value="/index")
	public String index(Model model){
		session.setMaxInactiveInterval(1*60);
		return ftl("index_user");
	}
}
