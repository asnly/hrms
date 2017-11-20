package com.shuodao.hrms.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shuodao.hrms.db.entity.Account;
import com.shuodao.hrms.db.entity.AccountRole;
import com.shuodao.hrms.manager.AccountManager;
import com.shuodao.hrms.manager.AccountRoleManager;

@Controller
public class UserInfoController extends AdminUserBaseController{
	@Resource
	public AccountManager accountManager;
	@Resource
	public AccountRoleManager accountRoleManager;
	@RequestMapping(value="/user_info")
	public String info(Model model){
		List<Account> userinfo=accountManager.getAll();
		model.addAttribute("userinfoList", userinfo);
		return ftl("user_info");
	}
	@RequestMapping(value="/user_info_edit.do")
	public String EditUserInfo(Integer userid,String username,String pwd,Model model){
		Account account=new Account();
		account.setId(userid);
		account.setUsername(username);
		account.setPwd(pwd);
		if(userid!=null){
			accountManager.updateAccount(account);
		}else{
			accountManager.insertAccount(account);;
		}
		userid=account.getId();
		return "redirect:user_info?userid="+userid;
	}
	@RequestMapping(value="/user_info_edit")
	public String deleteInfo(Integer userid,String action,Model model){
		Account account=accountManager.getAccountinfo(userid);
		String name=account.getUsername();
		AccountRole accountRole=accountRoleManager.selectByName(name);
		Integer id=null;
		if(accountRole!=null){
			id=accountRole.getId();
		}
		
		if("delete".equals(action)){
			accountManager.deleteAccount(userid);
			if(id!=null&&id.intValue()>0){
				accountRoleManager.deleteAccountRole(id);
			}
			
			return "redirect:user_info?userid="+userid;
		}
		return "redirect:user_info";
	}
}
