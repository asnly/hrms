package com.shuodao.hrms.manager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.shuodao.hrms.db.entity.TransferInformation;
import com.shuodao.hrms.db.mapper.TransferInformationMapper;
import com.shuodao.hrms.db.mapper.trainigRecordMapper;

@Service
public class TransferInformationManager {
	@Resource
	private TransferInformationMapper transferInformationMapper;
	public static TransferInformationManager transferInformationManager;
	public void insertTransferInformation(TransferInformation ti){
		transferInformationMapper.insert(ti);
	}
	public TransferInformation getByPrimaryKey(Integer dtid){
		return transferInformationMapper.selectByPrimaryKey(dtid);
	}
	public void deleteTransferInformation(Integer dtid){
		if(dtid!=null&&dtid.intValue()>0){
			transferInformationMapper.deleteByPrimaryKey(dtid);
		}
	}
	public void updateTransferInformation(TransferInformation ti){
		transferInformationMapper.updateByPrimaryKey(ti);
	}
	public List<TransferInformation> getAll(){
		return transferInformationMapper.selectAll();
	}
	public List<TransferInformation> getByKeyword(String keyword){
		return transferInformationMapper.selectByKeyword(keyword);
	}
	public Map<String,Object> params(String type,String employeeid){
		Map<String,Object> paramsMap=new HashMap<String,Object>();
		if(type!=null&&!type.equals("")){
			paramsMap.put("type", type);
		}
		if(employeeid!=null&&!employeeid.equals("")){
			paramsMap.put("employeeid", employeeid);
		}
		return paramsMap;
	}
	public List<TransferInformation> getTransferInformationListByMultiCondition(String type,String employeeid,int offset,int size){
		Map<String,Object> param=params(type,employeeid);
		return transferInformationMapper.selectTransferInformationListByMultiCondition(param, new RowBounds(offset,size));
	}
	public int getTransferInformationCountByMultiCondition(String type,String employeeid){
		Map<String,Object> param=params(type, employeeid);
		return transferInformationMapper.selectTransferInformationCountByMultiCondition(param);
	}
	public static TransferInformationManager getInstance(){
		return transferInformationManager;
	}
	
}
