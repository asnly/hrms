package com.shuodao.hrms.controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shuodao.hrms.manager.DetailManager;

@Controller
public class AdminIndexController extends AdminUserBaseController{
	@RequestMapping(value="/index")
	public String index(Model model){
		return ftl("index_admin");
	}
}
