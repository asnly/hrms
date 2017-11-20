package com.shuodao.hrms.manager;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shuodao.hrms.db.entity.Dossier;
import com.shuodao.hrms.db.mapper.DossierMapper;

@Service
public class DossierManager {
	@Resource
	private DossierMapper dossierMapper;
	public void insertDossier(Dossier dossier){
		dossierMapper.insert(dossier);
	}
	public void deleteDossier(Integer id){
		if(id!=null&&id.intValue()>0){
			dossierMapper.deleteByPrimaryKey(id);
		}
	}
	public void updateDossier(Dossier dossier){
		dossierMapper.updateByPrimaryKey(dossier);
	}
	public void updateDossierSelective(Dossier dossier){
		dossierMapper.updateByPrimaryKeySelective(dossier);
	}
	public Dossier getDossierInfo(Integer id){
		return dossierMapper.selectByPrimaryKey(id);
	}
	public List<Dossier> getAllDossierInfo(){
		return dossierMapper.selectAll();
	}
	public int getCount(){
		return dossierMapper.selectNums();
	}
	public Dossier getDossierInfoByEid(Integer eid){
		return dossierMapper.selectByEid(eid);
	}
}
