package com.shuodao.hrms.manager;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shuodao.hrms.db.entity.DepartmentLevelInfo;
import com.shuodao.hrms.db.entity.DeptInfo;
import com.shuodao.hrms.db.mapper.DepartmentLevelInfoMapper;
import com.shuodao.hrms.db.mapper.DeptInfoMapper;

@Service
public class DepartmentLevelInfoManager {
	@Resource
	private DepartmentLevelInfoMapper deptlevalInfoMapper;
	public static DepartmentLevelInfoManager departmentLevelInfoManager;
	@Resource
	private DeptInfoMapper deptInfoMapper;
	public void insertDepartmentLevalInfo(DepartmentLevelInfo deptleval){
		deptlevalInfoMapper.insert(deptleval);
	}
	public void deleteDepartLevelInfoManager(Integer id){
		if(id!=null&&id.intValue()>0){
			deptlevalInfoMapper.deleteByPrimaryKey(id);
		}
	}
	public void deleteAllinfo(Integer id){
		if(id!=null&&id.intValue()>0){
			deptlevalInfoMapper.deleteDeptlevelAndDeptInfo(id);
		}
	}
	public void deleteById(Integer id){
		if(id!=null&&id.intValue()>0){
			deptlevalInfoMapper.deleteById(id);
		}
	}
	public void updateDepartmentLevelBySelective(DepartmentLevelInfo deptleval){
		deptlevalInfoMapper.updateByPrimaryKeySelective(deptleval);
	}
	public void updateDepartmentLevel(DepartmentLevelInfo deptleval){
		deptlevalInfoMapper.updateByPrimaryKey(deptleval);
	}
	public List<DepartmentLevelInfo> getAll(){
		return deptlevalInfoMapper.selectAll();
	}
	public DepartmentLevelInfo getDepartmentLevelInfo(Integer id){
		return deptlevalInfoMapper.selectByPrimaryKey(id);
	}
	public static DepartmentLevelInfoManager getInstance(){
		return departmentLevelInfoManager;
	}
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
	
	public List<DeptInfo> getDeptInfoAll(){
		return deptInfoMapper.selectAll();
	}
//	public List<DepartmentLevelInfo> getlevelInfo(Integer id,String name){
//		List<String,Integer>
//	}
//	public DepartmentLevelInfo getDeptInfoByName(String name){
//		return deptlevalInfoMapper.selectByName(name);
//	}
	public void deleteByDeptNum(int id){
		deptInfoMapper.deleteByDeptNum(id);
	}
}
