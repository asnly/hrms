package com.shuodao.hrms.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shuodao.common.view.Pagination;
import com.shuodao.hrms.db.entity.DeptInfo;
import com.shuodao.hrms.db.entity.Dossier;
import com.shuodao.hrms.db.entity.employee;
import com.shuodao.hrms.manager.DeptInfoManager;
import com.shuodao.hrms.manager.DossierManager;
import com.shuodao.hrms.manager.EmployeeManager;

@Controller
public class DossierController extends AdminUserBaseController{
	@Resource
	private DossierManager dossierManager;
	@Resource
	private EmployeeManager employeeManager;
	@Resource
	private DeptInfoManager deptInfoManager;
	private static int PAGE_NUMBER=20;
	@RequestMapping(value="/dossior_list")
	public String paramList(Integer dossiorId,Integer pageNum,Model model){
		List<Dossier> dossierList=dossierManager.getAllDossierInfo();
		Map<Integer,String> employeeMap=new HashMap<Integer,String>();
		//employee em=new employee();
		//String name=new String();
//		employee em=new employee();
//		if(dossiorId!=null){
//			Dossier dossier=dossierManager.getDossierInfo(dossiorId);
//			em=employeeManager.getEmployeeInfo(dossier.getEmployeeid());
//		}else{
//			em=employeeManager.getEmployeeInfo(employeeid);
//		}
		if(pageNum==null) pageNum=1;
		int  totalCount=dossierManager.getCount();
		model.addAttribute("pagination", new Pagination(totalCount, pageNum, PAGE_NUMBER));
		model.addAttribute("dossierList", dossierList);
		return ftl("dossior_list");
	}
	@RequestMapping(value="/dossior_info_edit.do")
	public String doEditdossiorInfo(Integer dossiorid,Integer employeeid,String num,String DeptId,
			String context,String remark,String designation,Model model){
//		System.out.println(infoId);
//		List<employee> em=employeeManager.getAll();
//		Integer userid=null;
//		for(employee e:em){
//			userid=e.getId();
//		}
//		Dossier dossior=new Dossier();
//		dossior.setId(dossiorid);
//		dossior.setDossiernum(num);
//		dossior.setDepartment(DeptId);
//		dossior.setContext(context);
//		dossior.setRemark(remark);
//		dossior.setDesignation(designation);
//		dossior.setEmployeeid(employeeid);
		if(dossiorid!=null){
			Dossier dossior=dossierManager.getDossierInfo(dossiorid);
			dossior.setDossiernum(num);
			dossior.setDepartment(DeptId);
			dossior.setContext(context);
			dossior.setRemark(remark);
			dossior.setDesignation(designation);
			dossierManager.updateDossier(dossior);
		}else{
			Dossier dossior=new Dossier();
			dossior.setDossiernum(num);
			dossior.setDepartment(DeptId);
			dossior.setContext(context);
			dossior.setRemark(remark);
			dossior.setDesignation(designation);
			dossior.setEmployeeid(employeeid);
			dossior.setDossiertime(new Date());
			dossierManager.insertDossier(dossior);
		}
		//dossiorid=dossior.getId();
		return "redirect:dossior_list";
	}
//	@RequestMapping("/dossior_info_edit")
//	public String infoEdit(Integer infoid,String action,Model model){
//		if("delete".equals(action)){
//			dossierManager.deleteDossier(infoid);
//		}
//		return "redirect:dossior_info";
//	}
	@RequestMapping(value="/dossior_info_edit")
	public String editdossiorinfo(Integer dossiorId,Integer eid,Model model){
		System.out.println("eid="+eid);
		List<DeptInfo> deptInfo=deptInfoManager.getAll();
		Dossier dossier=dossierManager.getDossierInfo(dossiorId);
		Map<String,String> deptInfoMap=new HashMap<String,String>();
		if(deptInfo.size()>0){
			for(int i=0;i<deptInfo.size();i++){
				DeptInfo dept=deptInfo.get(i);
				String deptName=dept.getDeptName();
				deptInfoMap.put(Integer.toString(i+1), deptName);
			}
		}
		employee em=new employee();
		if(dossiorId!=null){
			dossier=dossierManager.getDossierInfo(dossiorId);
			em=employeeManager.getEmployeeInfo(dossier.getEmployeeid());
		}else{
			em=employeeManager.getEmployeeInfo(eid);
		}
		model.addAttribute("employee",em);
		//employee em=employeeManager.getEmployeeInfo(eid);
		System.out.println("em="+em);
		//employeeManager.getEmployeeInfo(dossier.getEmployeeid());
		model.addAttribute("employee", em);
		model.addAttribute("dossior", dossier);
		model.addAttribute("deptInfoMap", deptInfoMap);
		return ftl("dossior_info_edit");
	}
	@RequestMapping(value="/username_info_select")
	public String selectUsernameInfo(Model model){
		//System.out.println(request.getRequestURL());
		List<employee> employeeList=employeeManager.getAll();
		Map<String,String> employeeMap=new HashMap<String,String>();
		if(employeeList.size()>0){
			for(int i=0;i<employeeList.size();i++){
			employee em=employeeList.get(i);
			String name=em.getName();
			employeeMap.put(Integer.toString(i+1), name);
			}
		}
		//model.addAttribute("employee", employeeList);
		model.addAttribute("employeeMap",employeeMap);
		return ftl("username_info_select");
	}
	@RequestMapping(value="/username_info_select.do")
	public String doUsernameInfoSelect(String ename,Model model){
		employee ee=employeeManager.getEmployeeName(ename);
		Integer eid=ee.getId();
		return "redirect:dossior_info_edit?eid="+eid;
	}
	@RequestMapping(value="/dossior_list_edit.do")
	public String doDossiorListEdit(Integer dossiorId,String action){
		if("delete".equals(action)){
			dossierManager.deleteDossier(dossiorId);
			return "redirect:dossior_list?dossiorId="+dossiorId;
		}
		return "redirect:dossior_list";
	}
}
