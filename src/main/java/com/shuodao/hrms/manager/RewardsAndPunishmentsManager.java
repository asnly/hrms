package com.shuodao.hrms.manager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.shuodao.hrms.db.entity.RewardsAndPunishments;
import com.shuodao.hrms.db.mapper.RewardsAndPunishmentsMapper;

@Service
public class RewardsAndPunishmentsManager {
	@Resource
	private RewardsAndPunishmentsMapper rewardsAndPunishmentsMapper;
	public void insertRewardsAndPunishments(RewardsAndPunishments rp){
		 rewardsAndPunishmentsMapper.insert(rp);
	}
	public void deleteRewardsAndPunishments(Integer id){
		if(id!=null&&id.intValue()>0){
			rewardsAndPunishmentsMapper.deleteByPrimaryKey(id);
		}
	}
	public void updateRewardsAndPunishmentsSelective(RewardsAndPunishments rp){
		rewardsAndPunishmentsMapper.updateByPrimaryKeySelective(rp);
	}
	public void updateRewardsAndPunishments(RewardsAndPunishments rp){
		rewardsAndPunishmentsMapper.updateByPrimaryKey(rp);
	}
	public RewardsAndPunishments getRewardsAndPunishmentsInfo(Integer id){
		return rewardsAndPunishmentsMapper.selectByPrimaryKey(id);
	}
	public List<RewardsAndPunishments> getAll(){
		return rewardsAndPunishmentsMapper.selectAll();
	}
	private Map<String,Object> params(String searchword,String rewardsAndpunishments){
		Map<String,Object> paramsMap=new HashMap<String,Object>();
		if(searchword!=null&&!searchword.equals("")){
			paramsMap.put("keyword", "%"+searchword+"%");
		}
		if(rewardsAndpunishments!=null&&!rewardsAndpunishments.equals("")){
			paramsMap.put("rewardsCategory", rewardsAndpunishments);
		}
		return paramsMap;
	}
	public Integer getRewardsAndPunishmentsListCountByConditionMultiply(String searchword,String rewardsAndpunishments){
		Map<String,Object> params=params(searchword, rewardsAndpunishments);
		return rewardsAndPunishmentsMapper.selectRewardsAndPunishmentsListCountByConditionMultiply(params);
	}
	public List<RewardsAndPunishments> getRewardsAndPunishmentsListByConditionMultiply(String searchword,String rewardsAndpunishments,int offset,int size){
		Map<String,Object> params=params(searchword, rewardsAndpunishments);
		return rewardsAndPunishmentsMapper.selectRewardsAndPunishmentsListByConditionMultiply(params, new RowBounds(offset, size));
	}
	public List<RewardsAndPunishments> getRewardsAndPunishmentsByName(String name){
		return rewardsAndPunishmentsMapper.selectByRewardsuser(name);
	}
}
