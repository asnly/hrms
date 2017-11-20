package com.shuodao.hrms.controller;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shuodao.hrms.db.entity.employee;
import com.shuodao.hrms.db.entity.trainigRecord;
import com.shuodao.hrms.manager.EmployeeManager;
import com.shuodao.hrms.manager.trainigRecordManager;

@Controller
public class TrainingResultsController extends AdminUserBaseController{
	@Resource
	public trainigRecordManager trainigRecordManager;
	@Resource
	public EmployeeManager employeeManager;
	private static final int PAGE_LENGTH=20;
	@RequestMapping(value="/Training_results_info")
	public String InfoTrainingResults(Model model){
		List<trainigRecord> tr=trainigRecordManager.getAll();
		System.out.println(tr);
		trainigRecord record=new trainigRecord();
		Integer count=null;
		Integer sum=null;
		if(tr.size()>0){
			for (int i = 0; i < tr.size(); i++) {
				record=tr.get(i);
//				List<trainigRecord> trainigRecord=trainigRecordManager.getByEid(record.getEmployeeid());
//				System.out.println(trainigRecord);
//				if(trainigRecord.size()>0){
//					for(int j=0;j<trainigRecord.size();j++){
//						record=trainigRecord.get(j);
//						List<trainigRecord> train=trainigRecordManager.getByCategory(record.getCategory());
//						System.out.println(train.size());
//						if(train.size()>0){
//							for(int k=0;k<train.size();k++){
//								record=train.get(k);
//								count=trainigRecordManager.getCountByName(record.getName());
//								float aa=Float.valueOf(Integer.toString(record.getScore()))*Float.valueOf(record.getGrading());
//								System.out.println(aa);
//							}
//						}
//						System.out.println(count);
//						
//						System.out.println("sum="+sum);
//					}
//				}
			}
		}
		model.addAttribute("count", count);
		model.addAttribute("trainigRecordList", tr);
		return ftl("Training_results_info");
	}
	@RequestMapping(value="/Training_results_info_edit")
	public String editTrainingResults(Integer eid,Model model){
		List<trainigRecord> tr=trainigRecordManager.getByEid(Integer.toString(eid));
		Map<String,String> categoryMap=new ConcurrentHashMap<String,String>();
		Map<String,String> subjectMap=new ConcurrentHashMap<String,String>();
		if(tr.size()>0){
			for(int i=0;i<tr.size();i++){
				trainigRecord t=tr.get(i);
				categoryMap.put(Integer.toString(i), t.getCategory());
				List<trainigRecord> trainigRecord=trainigRecordManager.getByCategory(t.getCategory());
				if(trainigRecord.size()>0){
					for(int j=0;j<trainigRecord.size();i++){
						trainigRecord t1=trainigRecord.get(j);
						subjectMap.put(Integer.toString(j), t.getSubject());
					}
				}
			}
		}
		model.addAttribute("tcMap", categoryMap);
		model.addAttribute("tcSubject", subjectMap);
		return ftl("training_results_info_edit");
	}
	
	@RequestMapping(value="/training_results_info_user")
	public String select(Model model){
		List<employee> em=employeeManager.getAll();
		Map<String,String> emMap=new ConcurrentHashMap<String,String>();
		if(em.size()>0){
			for(int i=0;i<em.size();i++){
				employee e=em.get(i);
				emMap.put(Integer.toString(i), e.getName());
			}
		}
		model.addAttribute("emMap", emMap);
		return ftl("training_results_info_user");
	}
	@RequestMapping(value="/Training_results_info_user_select.do")
	public String doSelectTitleRecordInfoUser(String ename,Model model){
		employee em=employeeManager.getEmployeeName(ename);
		Integer eid=em.getId();
		return "redirect:training_results_info_edit?eid="+eid;
		//return "0";
	}
}
