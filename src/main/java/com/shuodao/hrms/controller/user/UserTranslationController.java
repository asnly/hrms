package com.shuodao.hrms.controller.user;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shuodao.hrms.db.entity.Account;
import com.shuodao.hrms.db.entity.employee;
import com.shuodao.hrms.db.entity.trainigRecord;
import com.shuodao.hrms.manager.AccountManager;
import com.shuodao.hrms.manager.EmployeeManager;
import com.shuodao.hrms.manager.trainigRecordManager;

@Controller
public class UserTranslationController extends UserBaseController{
	@Resource
	public trainigRecordManager trainigRecordManager;
	@Resource
	public EmployeeManager employeeManager;
	@Resource
	public AccountManager accountManager;
	@RequestMapping(value="/traigRecord_info_select")
	public String selectTraigRecordInfo(Model model){
		List<trainigRecord> tr=trainigRecordManager.getAll();
		Account account=accountManager.getAccountInfoByName(getAccount().getUsername());
		//System.out.println(account.getId());
		employee em=employeeManager.getinfoByUserid(Integer.toString(account.getId()));
		//System.out.println(em);
		model.addAttribute("trainigRecordList", tr);
		model.addAttribute("employee", em);
		return ftl("traigRecord_info_select");
	}
	@RequestMapping(value="traigRecord_info_select.do")
	public String doTraigRecord(Integer trid,String eid){
		//System.out.println(trid);
		if(trid!=null){
			trainigRecord tr=trainigRecordManager.getTrainigRecordInfo(trid);
			tr.setEmployeeid(eid);
			trainigRecordManager.updateTraingRecordSelective(tr);
		}
		return "redirect:traigRecord_info_select";
	}
}
