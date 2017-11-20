 package com.shuodao.hrms.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shuodao.hrms.db.entity.DepartmentLevelInfo;
import com.shuodao.hrms.db.entity.DeptInfo;
import com.shuodao.hrms.manager.DepartmentLevelInfoManager;
import com.shuodao.hrms.manager.DeptInfoManager;

@Controller
public class InstitutionalLevelController extends AdminUserBaseController{
	@Resource
	//public DeptInfoManager deptInfoManager;
	public DepartmentLevelInfoManager deptLevelInfoManager;
	@Resource
	public DeptInfoManager deptInfoManager;
	@RequestMapping(value="/Institutional_level")
	public String deptInfo(Model model){
//		List<DeptInfo> deptInfo=deptInfoManager.getAll();
//		model.addAttribute("deptInfoList",deptInfo);
		List<DepartmentLevelInfo> deptlevalInfo=deptLevelInfoManager.getAll();
		model.addAttribute("deptLevelInfoList",deptlevalInfo);
		return ftl("Institutional_level");
	}
	@RequestMapping(value="/Institutional_level_edit.do")
	public String editDeptInfo(Integer deptlevelid,String deptLevelname,String status,Model model){
		if(deptlevelid!=null){
			DepartmentLevelInfo dlinfo=deptLevelInfoManager.getDepartmentLevelInfo(deptlevelid);
			dlinfo.setName(deptLevelname);
			dlinfo.setStatus(status);
			deptLevelInfoManager.updateDepartmentLevel(dlinfo);
		}else{
			DepartmentLevelInfo dlinfo=new DepartmentLevelInfo();
			dlinfo.setName(deptLevelname);
			dlinfo.setStatus(status);
			deptLevelInfoManager.insertDepartmentLevalInfo(dlinfo);
		}
		return "redirect:Institutional_level";
	}
	@RequestMapping(value="/Institutional_level_edit")
	public String deldeptInfo(Integer deptlevelid,String action){
		if("delete".equals(action)){
			deptLevelInfoManager.deleteDepartLevelInfoManager(deptlevelid);
			deptLevelInfoManager.deleteByDeptNum(deptlevelid);
			return "redirect:Institutional_level";
		}
		return "redirect:Institutional_level";
	}
	@RequestMapping(value="/department_info")
	public String addDeptInfo(Integer levelid,Model model){
		//System.out.println(levelid);
//		DepartmentLevelInfo deptinfo=deptLevelInfoManager.getDepartmentLevelInfo(levelid);
//		model.addAttribute("deptinfo",deptinfo);
//		if(levelid!=null){
//			deptinfo=deptLevelInfoManager.getDepartmentLevelInfo(levelid);
//		}else{
//			deptinfo=
//		}
//		DeptInfo info=deptInfoManager.getDeptInfo(deptid);
//		System.out.println("info="+info);
//		String name=deptinfo.getName();
//		if(deptid!=null){
//			System.out.println("deptid="+deptid);
//			System.out.println("name="+name);
//			model.addAttribute("info",info);
//			model.addAttribute("name",name);
//		}
//		System.out.println("deptid="+deptid);
		if(levelid!=null){
			List<DeptInfo> deptInfo=deptInfoManager.getDeptInfoByDeptNum(levelid);
			model.addAttribute("deptinfo", deptInfo);
			DepartmentLevelInfo deptlevel=deptLevelInfoManager.getDepartmentLevelInfo(levelid);
			model.addAttribute("deptlevel", deptlevel);
			
		}
		
		
		return ftl("department_info");
	}
	
	@RequestMapping(value="/dept_info_edit.do")
	public String editDeptInfo(Integer levelid,Integer deptid,String level,String deptname,Model model){
		System.out.println("deptid="+deptid+"levelid="+levelid);
		DeptInfo info=new DeptInfo();
		info.setDeptName(deptname);
		info.setDeptNum(Integer.toString(levelid));
		info.setId(deptid);
		if(deptid!=null){
			System.out.println("levelid is"+levelid);
			deptInfoManager.updateDeptInfo(info);
		}else{
			
			deptInfoManager.insertDeptInfo(info);
		}
		deptid=info.getId();
		return "redirect:department_info?&deptid="+deptid+"&levelid="+levelid;
	}
	
	@RequestMapping(value="/delete_dept_info")
	public String deldeptInfo(String action,Integer levelid,Integer deptid){
		if("delete".equals(action)){
			deptInfoManager.deleteDeptInfo(deptid);
			return "redirect:department_info?levelid="+levelid;
		}
		return "redirect:department_info";
	}
}
