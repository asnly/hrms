package com.shuodao.hrms.manager;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shuodao.hrms.db.entity.TrainCategory;
import com.shuodao.hrms.db.mapper.TrainCategoryMapper;

@Service
public class trainingCategoryManager {
	@Resource
	private TrainCategoryMapper trainCategoryMapper;
	private static trainingCategoryManager trainingCategoryManager;
	public void insertTrainingCategory(TrainCategory tc){
		trainCategoryMapper.insert(tc);
	}
	public void deleteTrainingCategory(Integer tid){
		if(tid!=null&&tid.intValue()>0){
			trainCategoryMapper.deleteByPrimaryKey(tid);
		}
	}
	public void updateTrainingCategory(TrainCategory tc){
		trainCategoryMapper.updateByPrimaryKey(tc);
	}
	public TrainCategory selectTrainingCategory(Integer tid){
		return trainCategoryMapper.selectByPrimaryKey(tid);
	}
	public List<TrainCategory> getAll(){
		return trainCategoryMapper.selectAll();
	}
}
