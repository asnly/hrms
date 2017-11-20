package com.shuodao.hrms.controller.user;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shuodao.hrms.config.YamlConfig;
import com.shuodao.hrms.config.YamlConfig.ConfigEntry;
import com.shuodao.hrms.db.entity.Account;
import com.shuodao.hrms.db.entity.AccountRole;
import com.shuodao.hrms.db.entity.AdminUser;
import com.shuodao.hrms.manager.AccountManager;
import com.shuodao.hrms.manager.AccountRoleManager;
import com.shuodao.hrms.manager.EmployeeManager;
import com.shuodao.hrms.util.CryptUtil;

@Controller
public class UserLoginController extends UserBaseController{
	@Resource
	private AccountManager accountManager;
	@Resource
	private AccountRoleManager accountRoleManager;
	@Resource
	private EmployeeManager employeeManager;
	//@Resource
	@RequestMapping(value="/")
	public String root(){
		if(getAccount()!=null){
			return "redirect:/user/index";
		}else{
			return "redirect:/user/login";
		}
	}
	@RequestMapping(value="/login")
	public String login(String user,String pwd,String job,String from,Model model){
		if(user!=null&&user.length()>0&&pwd!=null&&pwd.length()>0){
			Account account=accountManager.getAccountInfoByName(user);
			if(account!=null&&!pwd.equals(account.getPwd())){
				account=null;
			}
			if(account!=null){
				session.setAttribute("accountRole", accountRoleManager.selectByName(user));
				AccountRole accountRole=accountRoleManager.selectByName(user);
				
				if(job.equals("普通职员")){
					if(job.equals(accountRole.getRolename())){
						account.setStatus("已登陆");
						accountManager.updateAccount(account);
						
						if(from!=null&&from.length()>0){
							return "redirect:"+from;
						}
						return "redirect:/user/index";
					}else{
						model.addAttribute("error", "false");
					}
				}
				if(job.equals("系统管理员")||job.equals("部门经理")){
					if(job.equals(accountRole.getRolename())){
						
						if(from!=null&&from.length()>0){
							return "redirect:"+from;
						}
						return "redirect:/admin/index";
					}else{
						model.addAttribute("error", "false");
					}
				}
				
			}
			
			
		}
		model.addAttribute("from", from);
		return ftl("login");
	
	}
	@RequestMapping(value="/logout")
	public String logout(){
		AccountRole accountRole=(AccountRole) session.getAttribute("accountRole");
		Account account=accountManager.getAccountInfoByName(accountRole.getUsername());
		account.setStatus("已注销");
		accountManager.updateAccount(account);
		session.removeAttribute("accountRole");
		return "redirect:/user/login";
	}
}
