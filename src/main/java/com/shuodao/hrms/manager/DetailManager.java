package com.shuodao.hrms.manager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.shuodao.hrms.db.entity.Detail;
import com.shuodao.hrms.db.mapper.DetailMapper;

@Service
public class DetailManager {
	@Resource
	private DetailMapper detailmapper;
	public static DetailManager detailManager;
	public void insertDetail(Detail detail){
		detailmapper.insert(detail);
	}
	public void deleteDetail(Integer id){
		if(id!=null&&id.intValue()>0){
			detailmapper.deleteByPrimaryKey(id);
		}
	}
	public void updateDetailSelective(Detail detail){
		detailmapper.updateByPrimaryKeySelective(detail);
	}
	public void updateDetail(Detail detail){
		detailmapper.updateByPrimaryKey(detail);
	}
	public Detail getDetailInfo(Integer id){
		return detailmapper.selectByPrimaryKey(id);
	}
	public List<Detail> getAll(){
		return detailmapper.selectAll();
	}
	public static DetailManager getInstance(){
		return detailManager;
	}
	public List<Detail> getDetailListByMultiCondition(String keyword,int offset,int size){
		Map<String,Object> paramsMap=packParams(keyword);
		return detailmapper.selectDetailListByMultiCondition(paramsMap,new RowBounds(offset,size));
	}
	public int getDetailListCountByMultiCondition(String keyword){
		Map<String,Object> params=packParams(keyword);
		return detailmapper.selectDetailListCountByMultiCondition(params);
	}
	private Map<String,Object> packParams(String keyword){
		Map<String,Object> params=new HashMap<String,Object>();
		if(keyword!=null&&!keyword.equals("")){
			params.put("keyword", "%"+keyword+"%");
		}
		return params;
	}
	public List<Detail> getDetailInfoByKeyword(String keyword){
		return detailmapper.selectByKeyword("%"+keyword+"%");
	}
	public Detail getDetailByEid(String eid){
		return detailmapper.selectByEid(eid);
	}
}
