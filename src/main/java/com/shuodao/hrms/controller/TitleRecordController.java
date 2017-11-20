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
import com.shuodao.hrms.db.entity.TitleRecord;
import com.shuodao.hrms.db.entity.employee;
import com.shuodao.hrms.manager.EmployeeManager;
import com.shuodao.hrms.manager.TitleRecordManager;
import com.shuodao.hrms.util.DateTimeUtil;

@Controller
public class TitleRecordController extends AdminUserBaseController{
	@Resource
	public EmployeeManager employeeManager;
	@Resource
	public TitleRecordManager titleRecordManager;
	private static final int PAGE_LENGTH=20;
	@RequestMapping(value="/TitleRecord_info_list")
	public String listTitleRecordInfo(Integer pageNum,String searchword,Model model){
		List<TitleRecord> titleRecordList=new ArrayList<TitleRecord>();
		int totalCount=0;
		if(pageNum==null) pageNum=1;
		if(searchword!=null&&!searchword.equals("")){
			employee e=employeeManager.getEmployeeName(searchword);
			if(e!=null){
				Integer eid=e.getId();
				searchword=Integer.toString(eid);
				titleRecordList=titleRecordManager.getTitleRecordByKeyWord(searchword);
			}else{
				titleRecordList=titleRecordManager.getTitleRecordByKeyWord(searchword);
				
			}
			totalCount=titleRecordManager.getTitleRecordListByKeyword(searchword);
		}else{
			titleRecordList=titleRecordManager.getAll();
			totalCount=titleRecordList.size();
		}
		model.addAttribute("titleRecordList", titleRecordList);
		model.addAttribute("pagination", new Pagination(totalCount, pageNum, PAGE_LENGTH));
		return ftl("titleRecord_info_list");
	}
	@RequestMapping(value="/TitleRecord_info_user_select")
	public String info(Model model){
		List<employee> em=employeeManager.getAll();
		Map<String,String> emMap=new ConcurrentHashMap<String,String>();
		if(em.size()>0){
			for(int i=0;i<em.size();i++){
				employee e=em.get(i);
				emMap.put(Integer.toString(i), e.getName());
			}
		}
		model.addAttribute("emMap", emMap);
		return ftl("TitleRecord_info_user");
	}
	@RequestMapping(value="/TitleRecord_info_user_select.do")
	public String doTitleRecordInfoUserSelect(String ename){
		employee em=employeeManager.getEmployeeName(ename);
		Integer userid=em.getId();
		return "redirect:TitleRecord_info_edit?userid="+userid;
	}
	@RequestMapping(value="/TitleRecord_info_edit")
	public String EditTitleRecordInfo(Integer userid,Integer tcid,Model model){
		employee em=new employee();
		TitleRecord tc=titleRecordManager.getTitleRecord(tcid);
		if(tcid!=null){
			tc=titleRecordManager.getTitleRecord(tcid);
			String employeeid=tc.getEmployeeid();
			em=employeeManager.getEmployeeInfo(Integer.valueOf(employeeid));
		}else{
			em=employeeManager.getEmployeeInfo(userid);
		}
		model.addAttribute("employee", em);
		model.addAttribute("titleRecord", tc);
		return ftl("titleRecord_info_edit");
	}
	@RequestMapping(value="/TitleRecord_info_edit.do")
	public String doTitleRecordInfoEdit(Integer employeeid,Integer trid,String username,String title,String titletime,Model model) throws ParseException{
		employee em=new employee();
		TitleRecord tr=new TitleRecord();
		if(username!=null){
			em=employeeManager.getEmployeeName(username);
			Integer emid=em.getId();
			tr.setEmployeeid(Integer.toString(emid));
		}else{
			tr.setEmployeeid(Integer.toString(employeeid));
		}
		tr.setId(trid);
		tr.setTitlename(title);
		tr.setTitletime(DateTimeUtil.parseDate(titletime));
		if(trid!=null){
			titleRecordManager.updateTitleRecord(tr);
		}else{
			titleRecordManager.insertTitleRecord(tr);
		}
		return "redirect:TitleRecord_info_list";
	}
	@RequestMapping(value="/TitleRecord_info_list_edit.do")
	public String doEditTitleRecordInfoList(String action,Integer tcid){
		if("delete".equals(action)){
			TitleRecord tr=titleRecordManager.getTitleRecord(tcid);
			if(tr!=null){
				titleRecordManager.deleteTitleRecord(tcid);
				return "redirect:TitleRecord_info_list?tcid="+tcid;
			}
		}
		return "redirect:TitleRecord_info_list";
	}
}
