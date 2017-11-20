package com.shuodao.hrms.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.solr.common.util.DateUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shuodao.common.view.Pagination;
import com.shuodao.hrms.db.entity.Contract;
import com.shuodao.hrms.db.entity.Detail;
import com.shuodao.hrms.db.entity.employee;
import com.shuodao.hrms.manager.ContractManager;
import com.shuodao.hrms.manager.DetailManager;
import com.shuodao.hrms.manager.EmployeeManager;
import com.shuodao.hrms.util.DateTimeUtil;

@Controller
public class DetailController extends AdminUserBaseController{
	@Resource
	public DetailManager detailManager;
	@Resource
	public EmployeeManager employeeManager;
	@Resource
	public ContractManager contractManager;
	private static final int PAGE_LENGTH=20;
	@RequestMapping(value="/detail_list")
	public String list(String searchword,Integer pageNum,Model model){
		if(pageNum==null) pageNum=1;
		List<Detail> detailinfo=new ArrayList<Detail>();
		int totalCount=0;
		if(searchword!=null&&!searchword.equals("")){
			employee em=employeeManager.getEmployeeName(searchword);
			/*根据名字获取相应的数据*/
			if(em!=null){
				Integer employeeid=em.getId();
				searchword=Integer.toString(employeeid);
				detailinfo=detailManager.getDetailInfoByKeyword(searchword);
			}else{
				detailinfo=detailManager.getDetailInfoByKeyword(searchword);
			}
			totalCount=detailManager.getDetailListCountByMultiCondition(searchword);
		}else{
			detailinfo=detailManager.getAll();
			totalCount=detailinfo.size();
		}
		model.addAttribute("detailList", detailinfo);
		model.addAttribute("pagination", new Pagination(totalCount, pageNum, PAGE_LENGTH));
		return ftl("detail_list");
	}
	@RequestMapping(value="/detail_username_select")
	public String DetailUsernameSelect(Model model){
		List<employee> em=employeeManager.getAll();
		Map<String,String> emMap=new HashMap<String,String>();
		if(em.size()>0){
			for(int i=0;i<em.size();i++){
				employee employee=em.get(i);
				String name=employee.getName();
				emMap.put(Integer.toString(i), name);
			}
		}
		model.addAttribute("emMap",emMap);
		return ftl("detail_username_select");
	}
	@RequestMapping(value="/detail_username_select.do")
	public String doDetailUsernameSelect(String ename,Model model){
		employee em=employeeManager.getEmployeeName(ename);
		Integer eid=em.getId();
		return "redirect:detail_info_edit?eid="+eid;
	}
	@RequestMapping(value="/detail_info_edit")
	public String EditDetailInfo(Integer eid,Integer detailid,Model model){
		employee em=new employee();
		Detail detail=detailManager.getDetailInfo(detailid);
		if(detailid!=null){
			detail=detailManager.getDetailInfo(detailid);
			String employeeid=detail.getEmployeeid();
			em=employeeManager.getEmployeeInfo(Integer.valueOf(employeeid));
		}else{
			//detail=detailManager
			em=employeeManager.getEmployeeInfo(eid);
		}
		model.addAttribute("employee", em);
		model.addAttribute("detail", detail);
		return ftl("detail_info_edit");
	}
	@RequestMapping(value="/detail_info_edit.do")
	public String doEditDetailInfo(Integer employeeid,Integer detailid,String job,
				String dept,String content,String appointmentdate,
				String achievement,Model model) throws ParseException{
		Detail detail=new Detail();
		detail.setDepartment(dept);
		detail.setId(detailid);
		detail.setPerformance(achievement);
		if(employeeid!=null){
			detail.setEmployeeid(Integer.toString(employeeid));
		}
		detail.setJob(job);
		//System.out.println(appointmentdate);
		Contract c=contractManager.getContractInfoByEmployeeid(Integer.toString(employeeid));
		if(c!=null){
			detail.setEndtime(c.getEndtime());
		}else{
			detail.setEndtime(DateUtil.parseDate("9999-12-31 23:59:59"));
		}
		detail.setStarttime(DateTimeUtil.parseDate(appointmentdate));
		
		
		detail.setWorkcontent(content);
		if(detailid!=null){
			detailManager.updateDetail(detail);
		}else{
			detailManager.insertDetail(detail);
		}
		return "redirect:detail_list";
	}
	@RequestMapping(value="/detail_info_list_edit.do")
	public String DoDetailInfoListEdit(Integer detailid,String action){
		if("delete".equals(action)){
			Detail detail=detailManager.getDetailInfo(detailid);
			if(detail!=null){
				detailManager.deleteDetail(detailid);
				return "redirect:detail_list?detailid="+detailid;
			}
		}
		return "redirect:detail_list";
	}
}
