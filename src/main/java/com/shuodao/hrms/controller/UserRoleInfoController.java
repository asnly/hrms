package com.shuodao.hrms.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shuodao.hrms.db.entity.Account;
import com.shuodao.hrms.db.entity.AccountRole;
import com.shuodao.hrms.db.entity.RoleInfo;
import com.shuodao.hrms.manager.AccountManager;
import com.shuodao.hrms.manager.AccountRoleManager;
import com.shuodao.hrms.manager.RoleInfoManager;

@Controller
public class UserRoleInfoController extends AdminUserBaseController{
	@Resource
	public AccountManager accountManager;
	@Resource
	public RoleInfoManager roleInfoManager;
	@Resource
	public AccountRoleManager accountRoleManager;
	@RequestMapping(value="/user_role_list")
	public String info(Model model){
		List<AccountRole> accountRoleList=accountRoleManager.getAll();
		model.addAttribute("accoutRoleList", accountRoleList);
		return ftl("user_role_list");
	}
	@RequestMapping(value="/user_info_select")
	public String selectuserinfo(Model model){
		List<Account> accountList=accountManager.getAll();
		Map<String,String> userinfo=new HashMap<String,String>();
		if(accountList.size()>0){
			for(int i=0;i<accountList.size();i++){
				Account account=accountList.get(i);
				String name=account.getUsername();
				userinfo.put(Integer.toString(i), name);
			}
		}
		//model.addAttribute("accountList", accountList);
		model.addAttribute("userinfo", userinfo);
		return ftl("/user_info_select");
	}
	@RequestMapping(value="/user_info_select.do")
	public String editUserinfoselect(String username,Model model){
		Account account=accountManager.getAccountInfoByName(username);
		Integer userid=account.getId();
		return "redirect:user_role_info_edit?userid="+userid;
	}
	@RequestMapping(value="/user_role_info_edit")
	public String editUserRoleInfo(Integer userRoleId,Integer userid,Model model){
		List<RoleInfo> roleInfoList=roleInfoManager.getAll();
		AccountRole accountRole=accountRoleManager.selectById(userRoleId);
		Map<String,String> roleinfoMap=new HashMap<String,String>();
		if(roleInfoList.size()>0){
			for(int i=0;i<roleInfoList.size();i++){
				RoleInfo roleinfo=roleInfoList.get(i);
				String rolename=roleinfo.getRolename();
				roleinfoMap.put(Integer.toString(i), rolename);
			}
		}
		Account account=accountManager.getAccountinfo(userid);
		model.addAttribute("accountRoleInfo", accountRole);
		model.addAttribute("account",account);
		model.addAttribute("roleinfoMap", roleinfoMap);
		return ftl("user_role_info_edit");
	}
	@RequestMapping(value="/user_role_info_edit.do")
	public String addUserRoleInfo(Integer accountId,String useraccount,Integer userRoleId,String rolename,Model model){
		AccountRole accountRole=new AccountRole();
		accountRole.setRolename(rolename);
		if(accountId!=null){
			Account account=accountManager.getAccountinfo(accountId);
			accountRole.setUsername(account.getUsername());
		}else{
			accountRole.setUsername(useraccount);
		}
		
		accountRole.setId(userRoleId);
		if(userRoleId!=null){
			accountRoleManager.updateAccountRole(accountRole);
		}else{
			accountRoleManager.insertAccountRole(accountRole);
		}
		userRoleId=accountRole.getId();
		return "redirect:user_role_list?&userRoleId="+userRoleId;
	}
//	@RequestMapping(value="/user_role_info_edit.do")
//	public String editUserRoleInfo(Integer userid,Integer roleid,Model model){
//		Account account=accountManager.getAccountinfo(userid);
//		RoleInfo roleinfo=roleInfoManager.getRoleInfoById(roleid);
//		String name=account.getUsername();
//		model.addAttribute("name", name);
//		return "redirect:user_role_info";
//	}
	@RequestMapping(value="/user_role_list_edit")
	public String deleteinfo(Integer accountRoleid,String action){
		if("delete".equals(action)){
			accountRoleManager.deleteAccountRole(accountRoleid);
			return "redirect:user_role_list?accountRoleid="+accountRoleid;
		}
		return "redirect:user_role_list";
	}
}
