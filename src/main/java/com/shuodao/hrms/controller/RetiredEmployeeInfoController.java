package com.shuodao.hrms.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shuodao.common.view.Pagination;
import com.shuodao.hrms.db.entity.DemissionInfo;
import com.shuodao.hrms.db.entity.employee;
import com.shuodao.hrms.manager.DemissionInfoManager;
import com.shuodao.hrms.manager.EmployeeManager;

@Controller
public class RetiredEmployeeInfoController extends AdminUserBaseController{
	@Resource
	private EmployeeManager employeeManager;
	@Resource
	private DemissionInfoManager demissionInfoManager;
	private static final int PAGE_LENGTH=20;
	@RequestMapping(value="/retired_employee_list")
	public String listRetiredEmployee(Integer pageNum,String employeeid,String searchword,Integer lzlx,Model model){
		int totalCount=0;
		if(pageNum==null) pageNum=1;
		List<DemissionInfo> demissionList=new ArrayList<DemissionInfo>();
		if((searchword!=null&&!searchword.equals(""))&&(lzlx!=null)){
			demissionList=demissionInfoManager.getDemissionListByMultiCondition(employeeid, lzlx, (pageNum-1)*PAGE_LENGTH, PAGE_LENGTH);
			totalCount=demissionInfoManager.getDemissionCountByMultiCondition(employeeid, lzlx);
		}else{
			demissionList=demissionInfoManager.getAll();
			totalCount=demissionList.size();
		}
		model.addAttribute("demissionList", demissionList);
		model.addAttribute("pagination", new Pagination(totalCount,pageNum, PAGE_LENGTH));
		return ftl("retired_employee_list");
	}
	@RequestMapping(value="/retired_employee_info_edit")
	public String EditRetiredEmployeeInfo(String lzlx,Model model){
		model.addAttribute("lzlx", lzlx);
		return ftl("retired_employee_info_edit");
	}
	@RequestMapping(value="/retired_employee_info_edit.do")
	public String doEditRetiredEmployeeInfo(){
		return "redirect:retired_employee_list";
	}
	@RequestMapping(value="/retired_employee_user")
	public String UserRetiredEmployee(Model model){
		List<employee> em=employeeManager.getAll();
		Map<String,String> emMap=new HashMap<String,String>();
		if(em.size()>0){
			for(int i=0;i<em.size();i++){
				employee e=em.get(i);
				String age=e.getAge();
				String gender=e.getGender();
				String name=e.getName();
				if(gender.equals("男")&&(Integer.valueOf(age)>61)){
					emMap.put(Integer.toString(i),name);
				}else if(gender.equals("女")&&(Integer.valueOf(age)>51)){
					emMap.put(Integer.toString(i), name);
				}else{
					emMap.put(Integer.toString(i), e.getName());
				}
			}
		}
		model.addAttribute("emMap", emMap);
		return ftl("retired_employee_user");
	}
	@RequestMapping(value="/retired_employee_user.do")
	public String doRetiredEmployeeUser(String username,Model model){
		employee ee=employeeManager.getEmployeeName(username);
		Integer eid=ee.getId();
		return "forward:retired_employee_info_edit?eid="+eid;
	}
	@RequestMapping(value="/retired_employee_list.do")
	public String doRetiredEmployeeList(){
		return "redirect:retired_employee_list";
	}
}
