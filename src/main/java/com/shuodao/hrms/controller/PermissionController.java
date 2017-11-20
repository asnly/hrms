package com.shuodao.hrms.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shuodao.hrms.db.entity.Permission;
import com.shuodao.hrms.db.entity.RoleInfo;
import com.shuodao.hrms.manager.PermissionManager;
import com.shuodao.hrms.manager.RoleInfoManager;

@Controller
public class PermissionController extends AdminUserBaseController{
	@Resource
	public RoleInfoManager roleInfoManager;
	@Resource 
	public PermissionManager permissionManager;
	@RequestMapping(value="/permission_info")
	public String info(Model model){
		//System.out.println(roleid);
		List<Permission> permissioninfo=permissionManager.getAll();
		List<RoleInfo> roleinfo=roleInfoManager.getAll();
		Map<String,String> roleMap=new HashMap<String,String>();
		if(roleinfo.size()>0){
			for(int i=0;i<roleinfo.size();i++){
				RoleInfo r=roleinfo.get(i);
				String name=r.getRolename();
				roleMap.put(Integer.toString(i+1), name);
			}
				
		}
//		permissionManager.getInfoById(permissionid);
		//RoleInfo info=roleInfoManager.getRoleInfoById(roleid);
		//String name=info.getRolename();
		model.addAttribute("roleMap", roleMap);
		model.addAttribute("permissionList", permissioninfo);
		//model.addAttribute("info", info);
		//model.addAttribute("RoleInfoList", roleinfo);
		return ftl("permission_info");
	}
	@RequestMapping(value="/permission_info_edit.do")
	public String EditPermissionInfo(Integer permissionid,String rolename,String personnalDossier,String personnelAllocation,String education,String systemManagement,Model model){
		//System.out.println(permissionid);
		Permission permission=new Permission();
		//permission.setId(permissionid);
		if(personnalDossier!=null){
			permission.setPermission1(personnalDossier);
		}else{
			permission.setPermission1("该角色无该权限");
		}
		if(personnelAllocation!=null){
			permission.setPermission2(personnelAllocation);
		}else{
			permission.setPermission2("该角色无该权限");
		}
		if(education!=null){
			permission.setPermission3(education);
		}else{
			permission.setPermission3("该角色无该权限");
		}
		if(systemManagement!=null){
			permission.setPermission4(systemManagement);
		}else{
			permission.setPermission4("该角色无该权限");
		}
		if(rolename!=null){
			RoleInfo info=roleInfoManager.getRoleInfoByRoleName(rolename);
			permission.setRoleName(rolename);
			permission.setRoleid(Integer.toString(info.getId()));
		}else{
			RoleInfo info=roleInfoManager.getRoleInfoByRoleName(permissionManager.getInfoById(permissionid).getRoleName());
			permission.setRoleName(info.getRolename());
			permission.setRoleid(Integer.toString(info.getId()));
			
		}
		
		if(permissionid==null){
			permissionManager.insertPermission(permission);
		}else{
			permissionManager.updatePermission(permission);
		}
		permissionid=permission.getId();
		return "redirect:permission_info?permissionid="+permissionid;
		//return "redirect:permission_info";
	}
	@RequestMapping(value="/permission_info_edit")
	public String deleteinfo(Integer permissionId,String action){
		if("delete".equals(action)){
			permissionManager.deletePermission(permissionId);
			return "redirect:permission_info?permissionid="+permissionId;
		}
		return "redirect:permission_info";
	}
}
