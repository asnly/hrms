package com.shuodao.hrms.controller;

import java.text.ParseException;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shuodao.hrms.db.entity.TrainCategory;
import com.shuodao.hrms.db.entity.trainigRecord;
import com.shuodao.hrms.manager.trainigRecordManager;
import com.shuodao.hrms.manager.trainingCategoryManager;
import com.shuodao.hrms.util.DateTimeUtil;

@Controller
public class TrainController extends AdminUserBaseController{
	@Resource
	public trainingCategoryManager trainingCategoryManager;
	@Resource
	public trainigRecordManager trainigRecordManager;
	@RequestMapping(value="/trainingCategory_info")
	public String infoTrainingCategory(Model model){
		List<TrainCategory> trainingCategoryList=trainingCategoryManager.getAll();
		model.addAttribute("trainingCategoryList", trainingCategoryList);
		return ftl("/trainingCategory_info");
	}
	@RequestMapping(value="/trainingCategory_info_edit.do")
	public String editTrainingCategory(Integer trainingCategoryid,String code,String categoryname,Model model){
		TrainCategory tc=new TrainCategory();
		tc.setCategory(categoryname);
		tc.setCatrgorycode(code);
		tc.setId(trainingCategoryid);
		if(trainingCategoryid!=null){
			trainingCategoryManager.updateTrainingCategory(tc);
		}else{
			trainingCategoryManager.insertTrainingCategory(tc);
		}
		return "redirect:trainingCategory_info";
	}
	@RequestMapping(value="/trainingCategory_info_edit")
	public String editTrainingCategoryInfo(Integer trainingid,String action){
		if("delete".equals(action)){
			if(trainingid!=null&&trainingid.intValue()>0){
				TrainCategory tc=trainingCategoryManager.selectTrainingCategory(trainingid);
				if(tc!=null){
					trainingCategoryManager.deleteTrainingCategory(trainingid);
					return "redirect:trainingCategory_info?trainingCategoryid="+trainingid;
				}
			}
		}
		return "redirect:trainingCategory_info";
	}
	@RequestMapping(value="/trainingRecord_list")
	public String ListTrainingRecord(Model model){
		List<trainigRecord> tr=trainigRecordManager.getAll();
		List<TrainCategory> tc=trainingCategoryManager.getAll();
		Map<String,String> tcMap=new ConcurrentHashMap<String,String>();
		if(tc.size()>0){
			for(int i=0;i<tc.size();i++){
				TrainCategory trainigCategory=tc.get(i);
				String category=trainigCategory.getCategory();
				tcMap.put(Integer.toString(i), category);
			}
		}
		model.addAttribute("tcMap", tcMap);
		model.addAttribute("trainigRecordList", tr);
		return ftl("trainingRecord_list");
	}
	
	@RequestMapping(value="/trainingRecord_info_edit.do")
	public String doEdit(String pxxz,String subject,String teacher,String classHour,String price,String subjectPercent,Integer trid,String pxfs,String category,Model model){
		trainigRecord tr=new trainigRecord();
		tr.setId(trid);
		tr.setCategory(category);
		tr.setSubject(subject);
		tr.setTeacher(teacher);
		tr.setClassinfo(classHour);
		tr.setPrice(Integer.valueOf(price));
		tr.setGrading(subjectPercent);
		tr.setMethods(pxfs);
		tr.setNature(pxxz);
		tr.setTotalprice(Integer.valueOf(classHour)*(Integer.valueOf(price)));
		if(trid!=null){
			trainigRecordManager.updateTraingRecord(tr);
		}else{
			trainigRecordManager.insertTraingRecordMapper(tr);
		}
		return "redirect:trainingRecord_list";
	}
	@RequestMapping(value="/training_base_info.do")
	public String DoTrainingBaseInfo(Integer trid,String type,String nature,String trainName,Integer price,
						String teacher,String classinfo,String location,String sponsor,String method,String principal,String starttime,
						String endtime,String subjectPercent,String subject,Model model) throws ParseException{
		if(trid!=null){
			trainigRecord tr=trainigRecordManager.getTrainigRecordInfo(trid);
			tr.setCategory(type);
			tr.setClassinfo(classinfo);
			tr.setEndtime(DateTimeUtil.parseDate(endtime));
			tr.setStarttime(DateTimeUtil.parseDate(starttime));
			//tr.setGrading(grading);
			tr.setGrading(subjectPercent);
			tr.setLocation(location);
			tr.setMethods(method);
			tr.setName(trainName);
			tr.setNameofpersonincharge(principal);
			tr.setNature(nature);
			tr.setOrganizer(principal);
			//tr.setParticipants(participants);
			tr.setPrice(price);
			//tr.setScore(score);
			tr.setSubject(subject);
			tr.setTeacher(teacher);
			
			trainigRecordManager.updateTraingRecord(tr);
		}
		return "redirect:trainingRecord_list";
	}
	@RequestMapping(value="/trainingRecord_info")
	public String InfoTrainingRecord(Integer trid,Model model){
		List<TrainCategory> tc=trainingCategoryManager.getAll();
		trainigRecord tr=trainigRecordManager.getTrainigRecordInfo(trid);
		Map<String,String> tcMap=new ConcurrentHashMap<String,String>();
		if(tc.size()>0){
			for(int i=0;i<tc.size();i++){
				TrainCategory trainCategory=tc.get(i);
				tcMap.put(Integer.toString(i), trainCategory.getCategory());
			}
		}
		model.addAttribute("tcMap", tcMap);
		model.addAttribute("trainigRecord", tr);
		return ftl("trainingRecord_info");
	}
	@RequestMapping(value="/trainingRecord_list_edit.do")
	public String editTrainingRecord(Integer trid,String action){
		if("delete".equals(action)){
			trainigRecord tr=trainigRecordManager.getTrainigRecordInfo(trid);
			if(tr!=null){
				trainigRecordManager.deleteTrainigRecord(trid);
				return "redirect:trainingRecord_list?trainingRecordid="+trid;
			}
			
		}
		return "redirect:trainingRecord_list";
	}

}
