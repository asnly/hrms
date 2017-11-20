package com.shuodao.hrms.manager;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shuodao.hrms.db.entity.DeptInfo;
import com.shuodao.hrms.db.mapper.DeptInfoMapper;

@Service
public class DeptInfoManager {
	@Resource
	private DeptInfoMapper deptInfoMapper;
	private static DeptInfoManager deptInfoManager;
	public void insertDeptInfo(DeptInfo record){
		deptInfoMapper.insert(record);
	}
	public void deleteDeptInfo(Integer id){
		if(id!=null&&id.intValue()>0){
			deptInfoMapper.deleteByPrimaryKey(id);
		}
	}
	public void updateDeptInfo(DeptInfo record){
		deptInfoMapper.updateByPrimaryKey(record);
	}
	public DeptInfo getDeptInfo(Integer id){
		return deptInfoMapper.selectByPrimaryKey(id);
	}
	public static DeptInfoManager getInstance(){
		return deptInfoManager;
	}
	public List<DeptInfo> getAll(){
		return deptInfoMapper.selectAll();
	}
	public List<DeptInfo> getDeptInfoByDeptNum(Integer deptNum){
		return deptInfoMapper.selectByDeptNum(deptNum);
	}
}
