package com.shuodao.hrms.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shuodao.common.view.Pagination;
import com.shuodao.hrms.db.entity.Account;
import com.shuodao.hrms.db.entity.DeptInfo;
import com.shuodao.hrms.db.entity.employee;
import com.shuodao.hrms.manager.AccountManager;
import com.shuodao.hrms.manager.DeptInfoManager;
import com.shuodao.hrms.manager.EmployeeManager;

import sun.misc.Compare;

@Controller
public class PersonnelController extends AdminUserBaseController{
	@Resource
	private EmployeeManager employeeManager;
	@Resource
	private DeptInfoManager deptInfoManager;
	@Resource
	private AccountManager accountManager;
	private static final int PAGE_LENGTH=20;
	@RequestMapping(value="/base_info_edit")
	public String editBaseinfo(String username,Integer employeeInfoId,Model model,String EducationId){
		List<Account> accountList=accountManager.getAll();
		List<DeptInfo> deptList=deptInfoManager.getAll();
		Account accountinfo=new Account();
		
			accountinfo=accountManager.getAccountInfoByName(username);
		
		if(employeeInfoId!=null){
			employee em=employeeManager.getEmployeeInfo(employeeInfoId);
			accountinfo=accountManager.getAccountinfo(Integer.valueOf(em.getUserid()));
		}
		
		Map<String,String> userinfo=new HashMap<String,String>();
		Map<String,String> deptinfo=new HashMap<String,String>();
		if(accountList.size()>0){
			for(int i=0;i<accountList.size();i++){
				Account account=accountList.get(i);
				String name=account.getUsername();
				userinfo.put(Integer.toString(i+1), name);
			}
		}
		if(deptList.size()>0){
			for(int i=0;i<deptList.size();i++){
				DeptInfo dept=deptList.get(i);
				String departname=dept.getDeptName();
					deptinfo.put(Integer.toString(i+1), departname);
			}
		}
		
		
		model.addAttribute("userinfo", userinfo);
		model.addAttribute("deptinfo", deptinfo);
		model.addAttribute("account", accountinfo);
		model.addAttribute("EducationId", EducationId);
		model.addAttribute("info",employeeManager.getEmployeeInfo(employeeInfoId));
		return ftl("base_info_edit");
	}
	@RequestMapping(value="/base_info_edit.do")
	public String doEditBaseInfo(Integer accountid,String degree,Integer infoId,String username,String fullname,String age,String gender,String EducationId,
					String DegreeId,String DeptId,String duties,String file1,String file2,String Pstatus,String file0,String file3,String file7){
		employee em=new employee();
		StringBuffer sb1=new StringBuffer();
		StringBuffer sb2=new StringBuffer();
		StringBuffer sb3=new StringBuffer();
		StringBuffer sb4=new StringBuffer();
		StringBuffer sb5=new StringBuffer();
		//System.out.println(request.getParameterValues("EducationId"));
		sb1.append("<img src=\""+file0+"\""+"/>");
		sb2.append("<img src=\""+file1+"\""+"/>");
		if(DegreeId.equals("1")){
			sb3.append("该学士无学位");
		}else{
			sb3.append("<img src=\""+file2+"\""+"/>");
		}
		sb4.append("<img src=\""+file3+"\""+"/>");
		sb5.append("<img src=\""+file7+"\""+"/>");
		if(accountid!=null){
			Account account=accountManager.getAccountinfo(accountid);
			em.setUserid(Integer.toString(account.getId()));
		}
		if(infoId!=null){
			System.out.println("infoId="+infoId);
			em=employeeManager.getEmployeeInfo(infoId);
			Account account=accountManager.getAccountinfo(Integer.valueOf(em.getUserid()));
			em.setUserid(Integer.toString(account.getId()));
		}
		em.setId(infoId);
		em.setName(fullname);
		em.setGender(gender);
		em.setEducation(EducationId);
		em.setRstatus(Pstatus);
		em.setImage(sb1.toString());
		em.setEducationimage(sb2.toString());
		em.setDegreeimage(sb3.toString());
		em.setIdcard1(sb4.toString());
		em.setIdcard2(sb5.toString());
		em.setPosition(duties);
		em.setAge(age);
		em.setDegree(DegreeId);
		em.setDepartment(DeptId);
		if(infoId==null){
			employeeManager.insert(em);
		}else{
			employeeManager.updateEmployee(em);
		}
		infoId=em.getId();
		return "redirect:base_info?infoId＝"+infoId;
		
	}
	@RequestMapping(value="/base_info")
	public String BaseInfo(String education,String department,String status,String searchword,Integer pageNum,Model model){
		//List<employee> employeeList=employeeManager.getAll();
		if(pageNum==null) pageNum=1;
		List<DeptInfo> deptList=deptInfoManager.getAll();
		Map<String,String> deptMap=new ConcurrentHashMap<String,String>();
		List<employee> employeeList=employeeManager.getEmployeeByMultiCondition(education, department, status, searchword, (pageNum-1)*PAGE_LENGTH, PAGE_LENGTH);
		//List<employee> employeeList=employeeManager.getEmployeeEdu(education);
		int totalCount=employeeManager.getEmployeeListCountByMultiCondition(education, department, status, searchword);
		//System.out.println(totalCount);
		if(deptList.size()>0){
			for(int i=0;i<deptList.size();i++){
				DeptInfo dept=deptList.get(i);
				deptMap.put(Integer.toString(i), dept.getDeptName());
			}
		}
		//System.out.println(session.getAttribute("accountRole"));
		//System.out.println(session.getValueNames()));
		model.addAttribute("deptMap", deptMap);
		model.addAttribute("employeeList", employeeList);
		model.addAttribute("education", education);
		model.addAttribute("department",department);
		model.addAttribute("status",status);
		model.addAttribute("searchword",searchword);
		model.addAttribute("pagination", new Pagination(totalCount, pageNum, PAGE_LENGTH));
		return ftl("base_info");
	}
	@RequestMapping(value="/base_info_del")
	public String delBaseInfo(Integer employeeInfoId,String action){
		if("delete".equals(action)){
			employeeManager.deleteEmployee(employeeInfoId);
			return "redirect:base_info";
		}
		return "redirect:base_info";
	}
	@RequestMapping(value="/employee_base_info")
	public String info(Integer pageNum,String gender,String education,String searchword,String degree,Integer dept,Model model){
		if(pageNum==null) pageNum=1;
		//if(education==null&&gender==null&&keyword==null&&degree==null&&department==null)
		List<DeptInfo> deptinfo=deptInfoManager.getAll();
		Map<String,String> deptMap=new ConcurrentHashMap<String,String>();
		if(deptinfo.size()>0){
			for(int i=0;i<deptinfo.size();i++){
				DeptInfo info=deptinfo.get(i);
				if(i==0){
					deptMap.put(Integer.toString(i), "本部门");
				}
					deptMap.put(Integer.toString(i+1), info.getDeptName());
				
				
			}
		}
		
		List<employee> employeeList=employeeManager.getEmployeeBaseListByMultiCondition(gender, education, degree, dept, searchword, (pageNum-1)*PAGE_LENGTH, PAGE_LENGTH);
		int totalCount=employeeManager.getEmployeeBaseListCountByMultiCondition(gender, education, degree, dept, searchword);
		model.addAttribute("deptMap", deptMap);
		model.addAttribute("employeeList",employeeList);
		model.addAttribute("pagination", new Pagination(totalCount, pageNum, PAGE_LENGTH));
		model.addAttribute("gender",gender);
		model.addAttribute("education", education);
		model.addAttribute("searchword", searchword);
		model.addAttribute("dept", dept);
		model.addAttribute("degree", degree);
		return ftl("employee_base_info");
	}
}
