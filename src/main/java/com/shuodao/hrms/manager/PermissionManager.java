package com.shuodao.hrms.manager;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shuodao.hrms.db.entity.Permission;
import com.shuodao.hrms.db.mapper.PermissionMapper;

@Service
public class PermissionManager {
	@Resource
	public PermissionMapper permissionMapper;
	public static PermissionManager permissionManager;
	public void insertPermission(Permission p){
		permissionMapper.insert(p);
	}
	public void deletePermission(Integer pid){
		if(pid!=null&&pid.intValue()>0){
			permissionMapper.deleteByPrimaryKey(pid);
		}
	}
	public void updatePermission(Permission p){
		permissionMapper.updateByPrimaryKey(p);
	}
	public Permission getInfoById(Integer pid){
		return permissionMapper.selectByPrimaryKey(pid);
	}
	public List<Permission> getAll(){
		return permissionMapper.selectAll();
	}
}
