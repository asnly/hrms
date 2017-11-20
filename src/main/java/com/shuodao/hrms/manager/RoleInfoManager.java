package com.shuodao.hrms.manager;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shuodao.hrms.db.entity.RoleInfo;
import com.shuodao.hrms.db.mapper.RoleInfoMapper;

@Service
public class RoleInfoManager {
	@Resource
	private RoleInfoMapper roleinfoMapper;
	
	public static RoleInfoManager roleInfoManager;
	public void deleteRoleInfo(Integer roleid){
		if(roleid!=null&&roleid.intValue()>0){
			roleinfoMapper.deleteByPrimaryKey(roleid);
		}
	}
	public void insertRoleInfo(RoleInfo info){
		roleinfoMapper.insert(info);
	}
	public RoleInfo getRoleInfoById(Integer roleid){
		return roleinfoMapper.selectByPrimaryKey(roleid);
	}
	public void updateRoleinfo(RoleInfo info){
		roleinfoMapper.updateByPrimaryKey(info);
	}
	public List<RoleInfo> getAll(){
		return roleinfoMapper.selectAll();
	}
	public static RoleInfoManager getInstance(){
		return roleInfoManager;
	}
	public RoleInfo getRoleInfoByRoleName(String name){
		return roleinfoMapper.selectByName(name);
	}
}
