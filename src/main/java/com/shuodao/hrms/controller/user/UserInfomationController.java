package com.shuodao.hrms.controller.user;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shuodao.hrms.db.entity.Account;
import com.shuodao.hrms.db.entity.AccountRole;
import com.shuodao.hrms.db.entity.Contract;
import com.shuodao.hrms.db.entity.Detail;
import com.shuodao.hrms.db.entity.Dossier;
import com.shuodao.hrms.db.entity.RewardsAndPunishments;
import com.shuodao.hrms.db.entity.employee;
import com.shuodao.hrms.manager.AccountManager;
import com.shuodao.hrms.manager.AccountRoleManager;
import com.shuodao.hrms.manager.ContractManager;
import com.shuodao.hrms.manager.DetailManager;
import com.shuodao.hrms.manager.DossierManager;
import com.shuodao.hrms.manager.EmployeeManager;
import com.shuodao.hrms.manager.RewardsAndPunishmentsManager;

@Controller
public class UserInfomationController extends UserBaseController{
	@Resource
	private EmployeeManager employeeManager;
	@Resource
	private DossierManager dossierManager;
	@Resource
	private DetailManager detailManager;
	@Resource
	private ContractManager contractManager;
	@Resource
	private RewardsAndPunishmentsManager rpManager;
	@Resource
	private AccountManager accountManager;
	
	@RequestMapping(value="/preview_info")
	public String info(Model model){
		Account account=accountManager.getAccountInfoByName(getAccount().getUsername());
		employee em=employeeManager.getinfoByUserid(Integer.toString(account.getId()));
		Dossier dossier=dossierManager.getDossierInfoByEid(em.getId());
		Detail detail=detailManager.getDetailByEid(Integer.toString(em.getId()));
		Contract c=contractManager.getContractInfoByEmployeeid(Integer.toString(em.getId()));
		List<RewardsAndPunishments> rp=rpManager.getRewardsAndPunishmentsByName(em.getName());
		model.addAttribute("employee", em);
		model.addAttribute("dossier", dossier);
		model.addAttribute("detail", detail);
		model.addAttribute("contract", c);
		model.addAttribute("rewardsAndpunishments", rp);
		return ftl("preview_info");
	}
}
