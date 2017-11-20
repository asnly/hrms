package com.shuodao.hrms.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shuodao.common.view.Pagination;
import com.shuodao.hrms.db.entity.Contract;
import com.shuodao.hrms.db.entity.employee;
import com.shuodao.hrms.manager.ContractManager;
import com.shuodao.hrms.manager.EmployeeManager;
import com.shuodao.hrms.util.DateTimeUtil;

@Controller
public class ContractInfoController extends AdminUserBaseController{
	@Resource
	public EmployeeManager employeeManager;
	@Resource
	public ContractManager contractManager;
	private static final int PAGE_LENGTH=20;
	@RequestMapping(value="/Contract_list")
	public String list(Integer pageNum,String searchword,Model model){
		List<Contract> contractList=new ArrayList<Contract>();
		int totalCount=0;
		if(pageNum==null) pageNum=1;
		if(searchword!=null&&!searchword.equals("")){
			contractList=contractManager.getContractListByKeyword(searchword);
			totalCount=contractManager.getContractListCountByKeyword(searchword);
		}else{
			contractList=contractManager.getAll();
			totalCount=contractList.size();
		}
		model.addAttribute("contractList", contractList);
		model.addAttribute("pagination", new Pagination(totalCount, pageNum, PAGE_LENGTH));
		return ftl("contract_list");
	}
	@RequestMapping(value="/contract_info_edit")
	public String editContractInfo(Integer eid,Integer contractid,Model model){
		employee em=new employee();
		Contract c=contractManager.getContractInfo(contractid);
		if(contractid!=null){
			c=contractManager.getContractInfo(contractid);
			String employeeid=c.getEmployeeid();
			em=employeeManager.getEmployeeInfo(Integer.valueOf(employeeid));
		}else{
			em=employeeManager.getEmployeeInfo(eid);
		}
		model.addAttribute("contract", c);
		model.addAttribute("employee", em);
		return ftl("contract_info_edit");
	}
	@RequestMapping(value="/contract_info_edit.do")
	public String EditContractInfo(Integer eid,String username,Integer contractid,String contractnum,String quarters,String context,String begintime,String endtime,Model model) throws ParseException{
		Contract c=new Contract();
		employee em=new employee();
		if(username!=null){
			em=employeeManager.getEmployeeName(username);
			Integer employeeid=em.getId();
			c.setEmployeeid(Integer.toString(employeeid));
		}else{
			c.setEmployeeid(Integer.toString(eid));
		}
		c.setContractnum(contractnum);
		c.setContent(context);
		c.setId(contractid);
		c.setStarttime(DateTimeUtil.parseDate(begintime));
		c.setEndtime(DateTimeUtil.parseDate(endtime));
		c.setQuarters(quarters);
		if(contractid!=null){
			contractManager.updateContract(c);
		}else{
			contractManager.insertContract(c);
		}
		return "redirect:Contract_list";
	}
	@RequestMapping(value="/contract_list_edit.do")
	public String doEditContractInfo(Integer contractid,String action){
		if("delete".equals(action)){
			Contract c=contractManager.getContractInfo(contractid);
			if(c!=null){
				contractManager.deleteContract(contractid);
				return "redirect:Contract_list?&contractid="+contractid;
			}
		}
		return "redirect:Contract_list";
	}
	@RequestMapping(value="/contract_user_info")
	public String info(Model model){
		List<employee> em=employeeManager.getAll();
		Map<String,String> emMap=new ConcurrentHashMap<String,String>();
		if(em.size()>0){
			for(int i=0;i<em.size();i++){
				employee e=em.get(i);
				emMap.put(Integer.toString(i),e.getName());
			}
		}
		model.addAttribute("emMap", emMap);
		return ftl("contract_user_info");
	}
	@RequestMapping(value="/contract_user_info.do")
	public String doinfo(String ename,Model model){
		employee em=employeeManager.getEmployeeName(ename);
		Integer eid=em.getId();
		return "redirect:contract_info_edit?eid="+eid;
	}
	@RequestMapping(value="/contract_content_info_show")
	public String showinfo(Integer contractid,Model model){
		Contract ct=contractManager.getContractInfo(contractid);
		model.addAttribute("contract", ct);
		return ftl("contract_content_info_show");
	}
	@RequestMapping(value="download_contract_content_info.do")
	public void DoinfoDownloadContractContent(){
		//return “”
	}
}
