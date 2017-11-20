package com.shuodao.hrms.manager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.shuodao.hrms.db.entity.DemissionInfo;
import com.shuodao.hrms.db.mapper.DemissionInfoMapper;

@Service
public class DemissionInfoManager {
	@Resource
	private DemissionInfoMapper demissionInfoMapper;
	public static DemissionInfoManager demissionInfoManager;
	
	public void insertDemissionInfo(DemissionInfo info){
		demissionInfoMapper.insert(info);
	}
	public void deleteDemissionInfo(Integer deid){
		if(deid!=null&&deid.intValue()>0){
			demissionInfoMapper.deleteByPrimaryKey(deid);
		}
	}
	public void updateDemissionInfo(DemissionInfo info){
		demissionInfoMapper.updateByPrimaryKey(info);
	}
	public DemissionInfo getDemissionInfoById(Integer deid){
		return demissionInfoMapper.selectByPrimaryKey(deid);
	}
	public List<DemissionInfo> getAll(){
		return demissionInfoMapper.selectAll();
	}
	public List<DemissionInfo> getDemissionListByMultiCondition(String employeeid,Integer type,int offset,int size){
		Map<String,Object> params=packParams(employeeid,type);
		return demissionInfoMapper.selectDemissionListByMultiCondition(params, new RowBounds(offset,size));
	}
	public Integer getDemissionCountByMultiCondition(String employeeid,Integer type){
		Map<String,Object> params=packParams(employeeid,type);
		return demissionInfoMapper.selectDemissionCountByMultiCondition(params);
	}
	private Map<String, Object> packParams(String employeeid, Integer type) {
		// TODO Auto-generated method stub
		Map<String,Object> params=new HashMap<String,Object>();
		if(employeeid!=null&&!employeeid.equals("")){
			params.put("employeeid", employeeid);
		}
		if(type!=null){
			params.put("type", type);
		}
		
		return params;
	}
	public static DemissionInfoManager getInstance(){
		return demissionInfoManager;
	}
}
