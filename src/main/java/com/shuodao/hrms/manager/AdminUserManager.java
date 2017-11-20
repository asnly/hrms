package com.shuodao.hrms.manager;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shuodao.hrms.db.entity.AdminUser;
import com.shuodao.hrms.db.mapper.AdminUserMapper;

@Service
public class AdminUserManager {
	
	@Resource
	private AdminUserMapper adminUserMapper;
	private Map<String,AdminUser> adminUserMap=new ConcurrentHashMap<String,AdminUser>();
	@PostConstruct
	public void init(){
		refresh();
	}
	private synchronized void refresh() {
		// TODO Auto-generated method stub
		List<AdminUser> userList = adminUserMapper.selectAll();
		Map<String,AdminUser> tmpMap=new ConcurrentHashMap<String,AdminUser>();
		for(AdminUser adminUser:userList){
			tmpMap.put(adminUser.getAdminId(), adminUser);
		}
		adminUserMap=tmpMap;
	}
	public void insert(AdminUser adminUser){
		adminUserMapper.insert(adminUser);
		refresh();
	}
	public void update(AdminUser adminUser){
		adminUserMapper.updateByPrimaryKeySelective(adminUser);
		refresh();
	}
	public void deleteAdminUser(String adminId){
		if(adminId!=null&&adminId.length()>0){
			adminUserMapper.deleteByPrimaryKey(adminId);
			refresh();
		}
		
	}
	public AdminUser getAdminUser(String adminId){
		return adminUserMap.get(adminId);
	}
}
