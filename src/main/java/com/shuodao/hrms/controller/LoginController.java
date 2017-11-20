package com.shuodao.hrms.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import com.shuodao.hrms.config.YamlConfig;
import com.shuodao.hrms.config.YamlConfig.ConfigEntry;
import com.shuodao.hrms.controller.user.UserBaseController;
import com.shuodao.hrms.db.entity.Account;
import com.shuodao.hrms.db.entity.AccountRole;
import com.shuodao.hrms.db.entity.AdminUser;
import com.shuodao.hrms.manager.AccountManager;
import com.shuodao.hrms.manager.AdminUserManager;
import com.shuodao.hrms.util.CryptUtil;

@Controller
public class LoginController extends AdminUserBaseController{
	@Resource
	private AdminUserManager adminUserManager;
	@Resource
	private AccountManager accountManager;
	@RequestMapping(value= "/")
	public String root(){
		if(getAdminUser()!=null){
			return "redirect:/admin/index";
		}
		return "redirect:admin/login";
	}
	@RequestMapping(value="/login")
	public String login(String user,String pwd,String job,String from,Model model){
		AdminUser adminUser=null;
		if(user!=null&&user.length()>0&&pwd!=null&&pwd.length()>0){
			ConfigEntry configEntry=YamlConfig.getInstance().getConfigEntry();
				if(configEntry!=null&&user.equals(configEntry.admin_user)&&pwd.equals(configEntry.admin_password)){
					adminUser=new AdminUser();
					adminUser.setAdminId(user);
					adminUser.setNick("管理员");
				}else{
					adminUser=adminUserManager.getAdminUser(user);
					if(adminUser!=null&&!CryptUtil.sha1(pwd).equals(adminUser.getPassword())){
						adminUser=null;
					}
				}
			
			
			
			if(adminUser!=null){
				session.setAttribute("adminUser", adminUser);
				if(from!=null&&from.length()>0){
					return "redirect:"+from;
				}
				return "redirect:/admin/index";
			}else{
				model.addAttribute("error", "true");
			}
		}
		model.addAttribute("from", from);
		return ftl("login");
	}
	@RequestMapping(value="/logout")
	public String logout(){
		//session.removeAttribute("adminUser");
		if(session.getAttribute("accountRole")!=null){
			AccountRole accountRole=(AccountRole) session.getAttribute("accountRole");
			Account account=accountManager.getAccountInfoByName(accountRole.getUsername());
			account.setStatus("已注销");
			accountManager.updateAccount(account);
			session.removeAttribute("accountRole");
			return "redirect:/user/login";
		}else{
			session.removeAttribute("adminUser");
			return "redirect:/admin/login";
		}
		
	}
}
