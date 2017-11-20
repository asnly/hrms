package com.shuodao.hrms.manager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shuodao.hrms.db.entity.trainigRecord;
import com.shuodao.hrms.db.mapper.trainigRecordMapper;

@Service
public class trainigRecordManager {
	@Resource
	private trainigRecordMapper trainigRecordMapper;
	public void insertTraingRecordMapper(trainigRecord tr){
		trainigRecordMapper.insert(tr);
	}
	public void deleteTrainigRecord(Integer id){
		if(id!=null&&id.intValue()>0){
			trainigRecordMapper.deleteByPrimaryKey(id);
		}
	}
	public void updateTraingRecordSelective(trainigRecord tr){
		trainigRecordMapper.updateByPrimaryKeySelective(tr);
	}
	public void updateTraingRecord(trainigRecord tr){
		trainigRecordMapper.updateByPrimaryKey(tr);
	}
	public trainigRecord getTrainigRecordInfo(Integer id){
		return trainigRecordMapper.selectByPrimaryKey(id);
	}
	public List<trainigRecord> getAll(){
		return trainigRecordMapper.selectAll();
	}
	public List<trainigRecord> getByCategory(String category){
		Map<String,Object> paramMap=packParam(category);
		return trainigRecordMapper.selectByCategory(paramMap);
	}
	public List<trainigRecord> getByEid(String eid){
		Map<String,Object> param=packParams(eid);
		return trainigRecordMapper.selectByEid(param);
	}
	public Integer getCountByName(String name){
		Map<String,Object> param=packParam1(name);
		return trainigRecordMapper.selectCountByName(param);
	}
	public Integer getByCount(){
		return trainigRecordMapper.getCount();
	}
	public Map<String,Object> packParams(String employeeid){
		Map<String,Object> params=new HashMap<String,Object>();
		if(employeeid!=null&&!employeeid.equals("")){
			params.put("employeeid", employeeid);
		}
		return params;
	}
	
	public Map<String,Object> packParam(String category){
		Map<String,Object> params=new HashMap<String,Object>();
		if(category!=null&&!category.equals("")){
			params.put("category", category);
		}
		return params;
	}
	public Map<String,Object> packParam1(String name){
		Map<String,Object> params=new HashMap<String,Object>();
		if(name!=null&&!name.equals("")){
			params.put("name", name);
		}
		return params;
	}
}
