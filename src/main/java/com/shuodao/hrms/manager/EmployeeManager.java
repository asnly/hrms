package com.shuodao.hrms.manager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import com.shuodao.hrms.db.entity.employee;
import com.shuodao.hrms.db.mapper.employeeMapper;

@Service
public class EmployeeManager {
	@Resource
	private employeeMapper employeeMapper;
	private static EmployeeManager employeeManager;
	public void insert(employee em){
		employeeMapper.insert(em);
	}
	public void deleteEmployee(Integer id){
		if(id!=null&&id.intValue()>0){
			employeeMapper.deleteByPrimaryKey(id);
		}
	}
	public void updateEmployeeSelective(employee em){
		employeeMapper.updateByPrimaryKeySelective(em);
	}
	public void updateEmployee(employee em){
		employeeMapper.updateByPrimaryKey(em);
	}
	public employee getEmployeeInfo(Integer id){
		return employeeMapper.selectByPrimaryKey(id);
	}
	public List<employee> getAll(){
		return employeeMapper.selectAll();
	}
	public List<employee> getByAge(String gender,String age){
		Map<String,Object> params=params(gender, age);
		return employeeMapper.selectByAge(params);
	}
	public Integer getEmployeeListCountByMultiCondition(String education,String department,String rstatus,String keyword){
		Map<String,Object> params=packParams(education,department,rstatus,keyword);
		return employeeMapper.selectEmployeeListCountByMultiCondition(params);
	}
	private Map<String,Object> params(String gender,String age){
		Map<String,Object> params=new HashMap<String,Object>();
		if(gender!=null&&!gender.equals("")){
			params.put("gender", gender);
		}
		if(age!=null&&!age.equals("")){
			params.put("age", age);
		}
		return params;
	}
	private Map<String, Object> packParams(String education,String department, String rstatus, String keyword) {
		// TODO Auto-generated method stub
		Map<String,Object> paramsMap=new HashMap<String,Object>();
		
		if(education!=null&&!education.equals("")){
			paramsMap.put("education", education);
		}
		if(department!=null&&!department.equals("")){
			paramsMap.put("department", department);
		}
		if(rstatus!=null&&!rstatus.equals("")){
			paramsMap.put("rstatus", rstatus);
		}
		if(keyword!=null&&!keyword.equals("")){
			paramsMap.put("keyword", "%"+keyword+"%");
		}
		return paramsMap;
	}
	
	public static EmployeeManager getInstance(){
		return employeeManager;
	}
	public employee getEmployeeEdu(String edu){
		return employeeMapper.selectByEmployeeEdu(edu);
	}
	public employee getEmployeeDept(String department){
		return employeeMapper.selectByEmployeeDept(department);
	}
	public employee getEmployeeRstatus(String rstatus){
		return employeeMapper.selectByEmployeeRstatus(rstatus);
	}
	public List<employee> getEmployeeByKeyword(String keyword){
		return employeeMapper.selectByKeyword(keyword);
	}
	public List<employee> getEmployeeByMultiCondition(String education,String department,String rstatus,String keyword,int offset,int size){
		Map<String,Object> params=packParams(education, department, rstatus, keyword);
		System.out.println("aaaa"+employeeMapper.selectEmployeeListByMultiCondition(params, new RowBounds(offset, size)));
		return employeeMapper.selectEmployeeListByMultiCondition(params, new RowBounds(offset, size));
	}
	public employee getEmployeeName(String name){
		return employeeMapper.selectByName(name);
	}
	public Integer getEmployeeBaseListCountByMultiCondition(String gender,String education,String degree,Integer department,String keyword){
		Map<String,Object> params=packParamsEmployeeBase(gender,education,degree,department,keyword);
		return employeeMapper.selectEmployeeBaseListCountByMultiCondition(params);
	}
	private Map<String, Object> packParamsEmployeeBase(String gender, String education, String degree,
			Integer department, String keyword) {
		// TODO Auto-generated method stub
		Map<String,Object> paramsBase=new HashMap<String,Object>();
		if(gender!=null&&!gender.equals("")){
			paramsBase.put("gender", gender);
		}
		if(education!=null&&!education.equals("")){
			paramsBase.put("education", education);
		}
		if(degree!=null&&!degree.equals("")){
			paramsBase.put("degree", degree);
		}
		if(department!=null){
			paramsBase.put("department", department);
		}
		if(keyword!=null&&!keyword.equals("")){
			paramsBase.put("keyword", "%"+keyword+"%");
		}
		return paramsBase;
	}
	public List<employee> getEmployeeBaseListByMultiCondition(String gender,String education,String degree,Integer department,String keyword,int offset,int size){
		Map<String,Object> params=packParamsEmployeeBase(gender, education, degree, department, keyword);
		return employeeMapper.selectEmployeeBaseListByMultiCondition(params, new RowBounds(offset, size));
	}
	public employee getinfoByUserid(String userid){
		return employeeMapper.selectByUserid(userid);
	}
}
