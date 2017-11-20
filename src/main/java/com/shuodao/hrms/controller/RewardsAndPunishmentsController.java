package com.shuodao.hrms.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shuodao.common.util.DateTimeUtil;
import com.shuodao.common.view.Pagination;
import com.shuodao.hrms.db.entity.RewardsAndPunishments;
import com.shuodao.hrms.db.entity.employee;
import com.shuodao.hrms.manager.EmployeeManager;
import com.shuodao.hrms.manager.RewardsAndPunishmentsManager;

@Controller
public class RewardsAndPunishmentsController extends AdminUserBaseController{
	private static final int PAGE_LENGTH=20;
	@Resource
	public EmployeeManager employeeManager;
	@Resource
	public RewardsAndPunishmentsManager rewardsAndPunishmentsManager;
	int totalCount=0;
	List<RewardsAndPunishments> rewardsAndPunishmentsList=new ArrayList<RewardsAndPunishments>();
	@RequestMapping(value="/rewardsAndpunishments_list")
	public String list(Integer pageNum,String searchword,String rewards,String punishments,Model model){
		
		if(pageNum==null) pageNum=1;
		if(rewards!=null&&!rewards.equals("")){
			rewardsAndPunishmentsList=rewardsAndPunishmentsManager.getRewardsAndPunishmentsListByConditionMultiply(searchword, rewards, (pageNum-1)*PAGE_LENGTH,PAGE_LENGTH);
			totalCount=rewardsAndPunishmentsManager.getRewardsAndPunishmentsListCountByConditionMultiply(searchword, rewards);
		}else if(punishments!=null&&!punishments.equals("")){
			rewardsAndPunishmentsList=rewardsAndPunishmentsManager.getRewardsAndPunishmentsListByConditionMultiply(searchword,punishments, (pageNum-1)*PAGE_LENGTH, PAGE_LENGTH);
			totalCount=rewardsAndPunishmentsManager.getRewardsAndPunishmentsListCountByConditionMultiply(searchword, punishments);
		}else if(searchword!=null&&!searchword.equals("")){
			rewardsAndPunishmentsList=rewardsAndPunishmentsManager.getRewardsAndPunishmentsListByConditionMultiply(searchword, null, (pageNum-1)*PAGE_LENGTH, PAGE_LENGTH);
			totalCount=rewardsAndPunishmentsManager.getRewardsAndPunishmentsListCountByConditionMultiply(searchword, null);
		}else{
			rewardsAndPunishmentsList=rewardsAndPunishmentsManager.getAll();
			totalCount=rewardsAndPunishmentsList.size();
		}
		
		model.addAttribute("pagination", new Pagination(totalCount,pageNum, PAGE_LENGTH));
		model.addAttribute("rewardsAndPunishmentsList", rewardsAndPunishmentsList);
		model.addAttribute("rewards", rewards);
		model.addAttribute("punishments", punishments);
		model.addAttribute("searchword", searchword);
		//model.addAttribute("jlcx", jlcx);
		return ftl("RewardsAndPunishments_list");
	}
	@RequestMapping(value="/rewardsAndpunishments_info_edit")
	public String Edit(Integer rpid,Integer eid,Model model){
		RewardsAndPunishments rewardsAndPunishments=rewardsAndPunishmentsManager.getRewardsAndPunishmentsInfo(rpid);
		employee em=null;
		if(rpid==null){
			em=employeeManager.getEmployeeInfo(eid);
		}
		model.addAttribute("rewardsAndPunishments", rewardsAndPunishments);
		model.addAttribute("employee", em);
		return ftl("RewardsAndPunishments_info_edit");
	}
	@RequestMapping(value="/rewardsAndpunishments_info_edit.do")
	public String doEdit(Integer rpid,Integer employeeid,String ename,
						String title,String rewards,String punishments,
						String content,String rptime,Model model) throws ParseException{
		RewardsAndPunishments rp=new RewardsAndPunishments();
		rp.setId(rpid);
		if(ename!=null){
				rp.setRewardsuser(ename);
		}else{
			employee em=employeeManager.getEmployeeInfo(employeeid);
			rp.setRewardsuser(em.getName());
		}
		rp.setRewardstitle(title);
		if(rewards!=null&&!rewards.equals("")){
			System.out.println("rewards="+rewards);
			rp.setRewardscategory(rewards);
		}
		if(punishments!=null&&!punishments.equals("")){
			System.out.println("punishments="+punishments);
			rp.setRewardscategory(punishments);
		}
		rp.setRewardscontext(content);
		rp.setRewardstime(DateTimeUtil.parseDate(rptime));
		if(rpid!=null){
			rewardsAndPunishmentsManager.updateRewardsAndPunishments(rp);
		}else{
			rewardsAndPunishmentsManager.insertRewardsAndPunishments(rp);
		}
		return "redirect:rewardsAndpunishments_list";
	}
	@RequestMapping(value="/RewardsAndPunishment_user_select")
	public String selectRewardsAndPunishmentUser(Model model){
		List<employee> employee=employeeManager.getAll();
		Map<String,String> employeeMap=new HashMap<String,String>();
		if(employee.size()>0){
			for(int i=0;i<employee.size();i++){
				employee e=employee.get(i);
				String name=e.getName();
				employeeMap.put(Integer.toString(i), name);
			}
			model.addAttribute("employeeMap",employeeMap);
			
		}
		return ftl("RewardsAndPunishment_user_select");
	}
	@RequestMapping(value="/RewardsAndPunishment_user_select.do")
	public String doSelect(String username,Model model){
		employee em=employeeManager.getEmployeeName(username);
		Integer eid=em.getId();
		return "redirect:rewardsAndpunishments_info_edit?eid="+eid;
	}
	@RequestMapping(value="/rewardsAndpunishments_list_edit")
	public String doRewardsAndPunishmentsList(Integer rpid,String action){
		RewardsAndPunishments rp=rewardsAndPunishmentsManager.getRewardsAndPunishmentsInfo(rpid);
		if(rp!=null){
			if("delete".equals(action)){
				rewardsAndPunishmentsManager.deleteRewardsAndPunishments(rpid);
				return "redirect:rewardsAndpunishments_list?rpid="+rpid;
			}
			
		}
		return "redirect:rewardsAndpunishments_list";
	}
}
