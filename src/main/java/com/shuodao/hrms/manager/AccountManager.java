package com.shuodao.hrms.manager;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shuodao.hrms.db.entity.Account;
import com.shuodao.hrms.db.mapper.AccountMapper;

@Service
public class AccountManager {
	@Resource
	private AccountMapper accountMapper;
	public static AccountManager accountManager;
	public void insertAccount(Account account){
		accountMapper.insert(account);
	}
	public void deleteAccount(Integer id){
		if(id!=null&&id.intValue()>0){
			accountMapper.deleteByPrimaryKey(id);
		}
	}
	public void updateAccountSelective(Account account){
		accountMapper.updateByPrimaryKeySelective(account);
	}
	
	public Account getAccountinfo(Integer id){
		return accountMapper.selectByPrimaryKey(id);
	}
	public void updateAccount(Account account){
		accountMapper.updateByPrimaryKey(account);
	}
	public List<Account> getAll(){
		return accountMapper.selectAll();
	}
	public static AccountManager getInstance(){
		return accountManager;
	}
	public Account getAccountInfoByName(String name){
		return accountMapper.selectByname(name);
	}
	
}
