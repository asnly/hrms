package com.shuodao.hrms.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shuodao.hrms.db.entity.RoleInfo;
import com.shuodao.hrms.manager.RoleInfoManager;

@Controller
public class RoleInfoController extends AdminUserBaseController{
	@Resource
	public RoleInfoManager roleInfoManager;
	
	@RequestMapping(value="/role_info")
	public String getInfo(Model model){
		List<RoleInfo> roleInfoList=roleInfoManager.getAll();
		model.addAttribute("RoleInfoList", roleInfoList);
		return ftl("Role_info");
	}
	
	@RequestMapping(value="/role_info_edit.do")
	public String editRoleInfo(Integer roleid,String rolename,String description,Model model){
		
		if(roleid!=null){
			RoleInfo info=roleInfoManager.getRoleInfoById(roleid);
			info.setRolename(rolename);
			info.setDescription(description);
			roleInfoManager.updateRoleinfo(info);
		}else{
			RoleInfo info=new RoleInfo();
			info.setRolename(rolename);
			info.setDescription(description);
			info.setCreatetime(new Date());;
			roleInfoManager.insertRoleInfo(info);
		}
		return "redirect:role_info";
	}
//	@RequestMapping(value="/role_info_edit.do")
//	public String editRoleInfo(Integer roleid,String rolename,String personnalDossier,String personnelAllocation,String education,String systemManagement,Model model){
//		RoleInfo info=new RoleInfo();
//		info.setId(roleid);
//		info.setRolename(rolename);
//		if(personnalDossier!=null){
//			info.setPermission1(personnalDossier);
//		}else{
//			info.setPermission1("该角色无该权限");
//		}
//		if(personnelAllocation!=null){
//			info.setPermission2(personnelAllocation);
//		}else{
//			info.setPermission2("该角色无该权限");
//		}
//		if(education!=null){
//			info.setPermission3(education);
//		}else{
//			info.setPermission3("该角色无该权限");
//		}
//		if(systemManagement!=null){
//			info.setPermission4(systemManagement);
//		}else{
//			info.setPermission4("该角色无该权限");
//		}
//		if(roleid!=null){
//			roleInfoManager.updateRoleinfo(info);
//		}else{
//			roleInfoManager.insertRoleInfo(info);
//		}
//		roleid=info.getId();
//		return "redirect:role_info?roleid="+roleid;
//	}
	@RequestMapping(value="/role_info_edit")
	public String deleteRoleInfo(Integer roleid,String action,Model model){
		if("delete".equals(action)){
			roleInfoManager.deleteRoleInfo(roleid);
			return "redirect:role_info";
		}
		return "redirect:role_info";
	}
}
