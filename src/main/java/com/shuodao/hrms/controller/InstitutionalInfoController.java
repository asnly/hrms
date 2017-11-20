package com.shuodao.hrms.controller;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shuodao.hrms.db.entity.AdminUser;
import com.shuodao.hrms.db.entity.InstitutionInfo;
import com.shuodao.hrms.manager.InstitutionInfoManager;

@Controller
public class InstitutionalInfoController extends AdminUserBaseController{
	@Resource
	public InstitutionInfoManager institutionInfoManager;
	@RequestMapping(value="/institution_info")
	public String ParamList(Model model){
		List<InstitutionInfo> info=institutionInfoManager.getAllInstitutionInfo();
		model.addAttribute("InstitutionInfoList", info);
		return ftl("/Institution_info");
	}
	@RequestMapping(value="/institution_info_edit.do")
	public String editInstitutionInfo(Integer tid,String title,String category,String content,Model model){
		if(tid!=null){
			InstitutionInfo institutionInfo=institutionInfoManager.getInstitutionInfo(tid);
			institutionInfo.setTitle(title);
			institutionInfo.setCategory(category);
			institutionInfo.setContent(content);
			institutionInfoManager.updateInstitutionInfo(institutionInfo);
		}else{
			InstitutionInfo institutionInfo=new InstitutionInfo();
			institutionInfo.setTitle(title);
			institutionInfo.setCategory(category);
			institutionInfo.setContent(content);
			institutionInfo.setAuthor(getAdminUser().getNick());
			institutionInfo.setIssuedate(new Date());
			institutionInfoManager.insertInstitutionInfo(institutionInfo);
		}
		return "redirect:institution_info";
	}
	@RequestMapping(value="/institution_info_edit")
	public String delInstitutionInfo(Integer instid,String action,Model model){
		if("delete".equals(action)){
			institutionInfoManager.deleteInstitutionInfo(instid);
		}
		return "redirect:institution_info";
	}
}
