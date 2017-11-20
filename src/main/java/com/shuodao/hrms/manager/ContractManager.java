package com.shuodao.hrms.manager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shuodao.hrms.db.entity.Contract;
import com.shuodao.hrms.db.mapper.ContractMapper;

@Service
public class ContractManager {
	@Resource
	private ContractMapper contractMapper;
	
	public void insertContract(Contract ct){
		contractMapper.insert(ct);
	}
	public void deleteContract(Integer id){
		if(id!=null&&id.intValue()>0){
			contractMapper.deleteByPrimaryKey(id);
		}
	}
	public void updateContractSelective(Contract ct){
		contractMapper.updateByPrimaryKeySelective(ct);
	}
	public void updateContract(Contract ct){
		contractMapper.updateByPrimaryKey(ct);
	}
	public Contract getContractInfo(Integer id){
		return contractMapper.selectByPrimaryKey(id);
	}
	public Map<String,Object> params(String keyword){
		Map<String,Object> params=new HashMap<String,Object>();
		if(keyword!=null&&!keyword.equals("")){
			params.put("keyword", "%"+keyword+"%");
		}
		return params;
	}
	public int getContractListCountByKeyword(String keyword){
		Map<String,Object> params=params(keyword);
		return contractMapper.selectContractListCountByKeyword(params);
	}
	public List<Contract> getContractListByKeyword(String keyword){
		return contractMapper.selectByKeyWord("%"+keyword+"%");
	}
	public List<Contract> getAll(){
		return contractMapper.selectAll();
	}
	public Contract getContractInfoByEmployeeid(String eid){
		return contractMapper.selectByEmployeeid(eid);
	}
}
