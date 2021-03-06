package com.shuodao.hrms.db.mapper;

import java.util.List;

import com.shuodao.hrms.db.entity.DeptInfo;

public interface DeptInfoMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table DeptInfo
     *
     * @mbg.generated Sat Aug 19 23:28:58 CST 2017
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table DeptInfo
     *
     * @mbg.generated Sat Aug 19 23:28:58 CST 2017
     */
    int insert(DeptInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table DeptInfo
     *
     * @mbg.generated Sat Aug 19 23:28:58 CST 2017
     */
    int insertSelective(DeptInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table DeptInfo
     *
     * @mbg.generated Sat Aug 19 23:28:58 CST 2017
     */
    DeptInfo selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table DeptInfo
     *
     * @mbg.generated Sat Aug 19 23:28:58 CST 2017
     */
    int updateByPrimaryKeySelective(DeptInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table DeptInfo
     *
     * @mbg.generated Sat Aug 19 23:28:58 CST 2017
     */
    int updateByPrimaryKey(DeptInfo record);
    List<DeptInfo> selectAll();
    List<DeptInfo> selectByDeptNum(Integer dlid);
    int deleteByDeptNum(Integer id);
}