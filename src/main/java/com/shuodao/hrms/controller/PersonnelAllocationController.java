package com.shuodao.hrms.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shuodao.common.view.Pagination;
import com.shuodao.hrms.db.entity.DeptInfo;
import com.shuodao.hrms.db.entity.TitleRecord;
import com.shuodao.hrms.db.entity.TransferInformation;
import com.shuodao.hrms.db.entity.employee;
import com.shuodao.hrms.manager.DeptInfoManager;
import com.shuodao.hrms.manager.EmployeeManager;
import com.shuodao.hrms.manager.TitleRecordManager;
import com.shuodao.hrms.manager.TransferInformationManager;
import com.shuodao.hrms.util.DateTimeUtil;

@Controller
public class PersonnelAllocationController extends AdminUserBaseController{
	@Resource
	private EmployeeManager employeeManager;
	@Resource
	private TransferInformationManager transferInformationManager;
	@Resource
	private TitleRecordManager titleRecordManager;
	@Resource
	private DeptInfoManager deptInfoManager;
	private static final int PAGE_LENGTH=20;
	@RequestMapping(value="/employee_mobilization_list")
	public String listEmployeeMobilization(Integer pageNum,Model model){
		List<TransferInformation> TransferInformationList=transferInformationManager.getAll();
		int totalCount=TransferInformationList.size();
		if(pageNum==null) pageNum=1;
		model.addAttribute("TransferInformationList", TransferInformationList);
		model.addAttribute("pagination", new Pagination(totalCount, pageNum, PAGE_LENGTH));
		return ftl("employee_mobilization_list");
	}
	@RequestMapping(value="/employee_mobilization_info_edit")
	public String editEmployeeMobilizationInfo(Integer eid,Integer tid,String afterDept,Model model){
		employee e=new employee();
		TitleRecord tr=new TitleRecord();
		Map<String,String> deptInfoMap=new ConcurrentHashMap<String,String>();
		TransferInformation t=transferInformationManager.getByPrimaryKey(tid);
		List<DeptInfo> dept=deptInfoManager.getAll();
		if(tid!=null){
			//t=transferInformationManager.getByPrimaryKey(tid);
			String employeeid=t.getEmployeeid();
			e=employeeManager.getEmployeeInfo(Integer.valueOf(employeeid));
			tr=titleRecordManager.getTitleRecordByEmployeeid(employeeid);
		}else{
			e=employeeManager.getEmployeeInfo(eid);
			if(e!=null){
				String employeeid=Integer.toString(e.getId());
				tr=titleRecordManager.getTitleRecordByEmployeeid(employeeid);
			}
			
			
		}
		if(dept.size()>0){
			for(int i=0;i<dept.size();i++){
				DeptInfo deptInfo=dept.get(i);
				String deptname=deptInfo.getDeptName();
				deptInfoMap.put(Integer.toString(i), deptname);
			}
		}
		model.addAttribute("deptInfoMap", deptInfoMap);
		model.addAttribute("afterDept",afterDept);
		model.addAttribute("transferinfo", t);
		model.addAttribute("employee", e);
		//model.addAttribute("titleRecord", tr);
		return ftl("employee_mobilization_info_edit");
	
	}
	@RequestMapping(value="/employee_mobilization_info_edit.do")
	public String doEditEmployeeMobilizationInfo(Integer tid,Integer eid,String beforeDept,String afterDept,
			String beforeJob,String afterJob,String reason,String transferType,String transferTime,String tType,String afterdept,Model model) throws ParseException{
		TransferInformation ti=new TransferInformation();
		ti.setId(tid);
		ti.setBeforedept(beforeDept);
		
		if(afterDept!=null&&!afterDept.equals("")){
			ti.setAfterdept(afterDept);
		}else if(afterdept!=null&&!afterdept.equals("")){
			ti.setAfterdept(afterdept);
		}
		ti.setBeforeposition(beforeJob);
		ti.setAfterposition(afterJob);
		ti.setEmployeeid(Integer.toString(eid));
		ti.setReason(reason);
		if(transferType!=null&&!transferType.equals("")){
			ti.setType(transferType);
		}else if(tType!=null&&!tType.equals("")){
			ti.setType(tType);
		}
		
		
		ti.setTransfertime(DateTimeUtil.parseDate(transferTime));
		if(tid!=null){
			transferInformationManager.updateTransferInformation(ti);
		}else{
			transferInformationManager.insertTransferInformation(ti);
		}
		return "redirect:employee_mobilization_list";
	}
	@RequestMapping(value="/employee_mobilization_list_edit")
	public String editEmployeeMobilizationlist(Integer tid,String action){
		if("delete".equals(action)){
			TransferInformation t=transferInformationManager.getByPrimaryKey(tid);
			if(t!=null){
				transferInformationManager.deleteTransferInformation(tid);;
				return "redirect:employee_mobilization_list?tid="+tid;
			}
		}
		return "redirect:employee_mobilization_list";
	}
	@RequestMapping(value="/personnel_change_search")
	public String searchPersonnelChange(Integer pageNum,String allocationsearch,String transferType,Model model){
		TitleRecord tr=new TitleRecord();
		employee em=new employee();
		List<TransferInformation> ti=new ArrayList<TransferInformation>();
		if(pageNum==null) pageNum=1;
		int totalCount=0;
		if((allocationsearch!=null&&!allocationsearch.equals(""))||(transferType!=null&&!transferType.equals(""))){
			ti=transferInformationManager.getTransferInformationListByMultiCondition(transferType, allocationsearch, (pageNum-1)*PAGE_LENGTH, PAGE_LENGTH);
			totalCount=transferInformationManager.getTransferInformationCountByMultiCondition(transferType, allocationsearch);
			
		}else{
			ti=transferInformationManager.getAll();
			totalCount=ti.size();
		}
		if(ti.size()>0){
			for(int i=0;i<ti.size();i++){
				TransferInformation transferInformation=ti.get(i);
				String eid=transferInformation.getEmployeeid();
				tr=titleRecordManager.getTitleRecordByEmployeeid(eid);
				em=employeeManager.getEmployeeInfo(Integer.valueOf(eid));
			}
		}
		model.addAttribute("titleRecord", tr);
		model.addAttribute("TransferInfoList", ti);
		model.addAttribute("employee", em);
		model.addAttribute("pagination", new Pagination(totalCount, pageNum, PAGE_LENGTH));
		model.addAttribute("transferType", transferType);
		return ftl("personnel_change_search");
	}
	@RequestMapping(value="/employee_mobilization_user_info")
	public String InfoEmployeeMobilizationUser(Model model){
		List<employee> e=employeeManager.getAll();
		Map<String,String> emMap=new HashMap<String,String>();
		if(e.size()>0){
			for(int i=0;i<e.size();i++){
				employee ee=e.get(i);
				String name=ee.getName();
				emMap.put(Integer.toString(i), name);
			}
		}
		model.addAttribute("emMap", emMap);
		return ftl("employee_mobilization_user_info");
	}
	@RequestMapping(value="/employee_mobilization_user_info.do")
	public String doEmployeeMobilizationUserInfo(String ename,Model model){
		employee em=employeeManager.getEmployeeName(ename);
		Integer eid=em.getId();
		return "redirect:employee_mobilization_info_edit?eid="+eid;
	}
}
