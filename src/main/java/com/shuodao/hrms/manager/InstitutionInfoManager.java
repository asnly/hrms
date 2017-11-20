package com.shuodao.hrms.manager;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shuodao.hrms.db.entity.InstitutionInfo;
import com.shuodao.hrms.db.mapper.InstitutionInfoMapper;

@Service
public class InstitutionInfoManager {
	@Resource
	private InstitutionInfoMapper institutionInfoMapper;
	private static InstitutionInfoManager institutionInfoManager;
	public void insertInstitutionInfo(InstitutionInfo institutionInfo){
		institutionInfoMapper.insert(institutionInfo);
	}
	public void deleteInstitutionInfo(Integer id){
		if(id!=null&&id.intValue()>0){
			institutionInfoMapper.deleteByPrimaryKey(id);
		}
	}
	public void updateInstitutionInfo(InstitutionInfo institutionInfo){
		institutionInfoMapper.updateByPrimaryKey(institutionInfo);
	}
	public InstitutionInfo getInstitutionInfo(Integer id){
		return institutionInfoMapper.selectByPrimaryKey(id);
	}
	public static InstitutionInfoManager getInstance(){
		return institutionInfoManager;
	}
	public List<InstitutionInfo> getAllInstitutionInfo(){
		return institutionInfoMapper.selectAll();
	}
}
