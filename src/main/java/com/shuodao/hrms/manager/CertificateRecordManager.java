package com.shuodao.hrms.manager;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shuodao.hrms.db.entity.CertificateRecord;
import com.shuodao.hrms.db.mapper.CertificateRecordMapper;

@Service
public class CertificateRecordManager {
	@Resource
	private CertificateRecordMapper certificateRecordMapper;
	
	public CertificateRecord getCertificateRecordInfo(Integer id){
		return certificateRecordMapper.selectByPrimaryKey(id);
	}
	public void insertCertificateRecord(CertificateRecord cr){
		certificateRecordMapper.insert(cr);
	}
	public void updateCertificateRecord(CertificateRecord cr){
		certificateRecordMapper.updateByPrimaryKey(cr);
	}
	public void updateCertificateRecordSelective(CertificateRecord cr){
		certificateRecordMapper.updateByPrimaryKeySelective(cr);
	}
	public void deleteCertificateRecord(Integer id){
		if(id!=null&&id.intValue()>0){
			certificateRecordMapper.deleteByPrimaryKey(id);
		}
	}
	
}
