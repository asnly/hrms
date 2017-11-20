package com.shuodao.hrms.manager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shuodao.hrms.db.entity.TitleRecord;
import com.shuodao.hrms.db.mapper.TitleRecordMapper;

@Service
public class TitleRecordManager {
	@Resource
	private TitleRecordMapper titleRecordMapper;
	public void insertTitleRecord(TitleRecord tr){
		titleRecordMapper.insert(tr);
	}
	public void deleteTitleRecord(Integer trid){
		if(trid!=null&&trid.intValue()>0){
			titleRecordMapper.deleteByPrimaryKey(trid);
		}
	}
	public void updateTitleRecord(TitleRecord tr){
		titleRecordMapper.updateByPrimaryKey(tr);
	}
	public TitleRecord getTitleRecord(Integer id){
		return titleRecordMapper.selectByPrimaryKey(id);
	}
	public TitleRecord getTitleRecordByEmployeeid(String eid){
		return titleRecordMapper.selectByEmployeeid(eid);
	}
	public List<TitleRecord> getAll(){
		return titleRecordMapper.selectAll();
	}
	public int getTitleRecordListByKeyword(String keyword){
		Map<String,Object> params=params(keyword);
		return titleRecordMapper.selectTitleRecordListByKeyword(params);
	}
	public List<TitleRecord> getTitleRecordByKeyWord(String keyword){
		return titleRecordMapper.selectByKeyWord(keyword);
	}
	private Map<String, Object> params(String keyword) {
		// TODO Auto-generated method stub
		Map<String,Object> paramsMap=new HashMap<String,Object>();
		if(keyword!=null&&!keyword.equals("")){
			paramsMap.put("keyword", "%"+keyword+"%");
		}
		return paramsMap;
	}
}
