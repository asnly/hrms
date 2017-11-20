package com.shuodao.hrms.manager;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shuodao.hrms.db.entity.AccountRole;
import com.shuodao.hrms.db.mapper.AccountRoleMapper;

@Service
public class AccountRoleManager {
	@Resource
	private AccountRoleMapper accountRoleMapper;
	public static AccountRoleManager accountRoleManager;
	public void insertAccountRole(AccountRole accountRole){
		accountRoleMapper.insert(accountRole);
	}
	public void deleteAccountRole(Integer accountRoleid){
		if(accountRoleid!=null&&accountRoleid.intValue()>0){
			accountRoleMapper.deleteByPrimaryKey(accountRoleid);
		}
	}
	public void updateAccountRole(AccountRole accountRole){
		accountRoleMapper.updateByPrimaryKey(accountRole);
	}
	public AccountRole selectById(Integer aid){
		return accountRoleMapper.selectByPrimaryKey(aid);
	}
	public List<AccountRole> getAll(){
		return accountRoleMapper.selectAll();
	}
	public AccountRole selectByName(String username){
		return accountRoleMapper.selectByName(username);
	}
	public static AccountRoleManager getInstance(){
		return accountRoleManager;
	}
}
