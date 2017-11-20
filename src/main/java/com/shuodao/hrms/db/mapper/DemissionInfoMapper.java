package com.shuodao.hrms.db.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.shuodao.hrms.db.entity.DemissionInfo;

public interface DemissionInfoMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table DemissionInfo
     *
     * @mbg.generated Wed Nov 01 00:11:57 CST 2017
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table DemissionInfo
     *
     * @mbg.generated Wed Nov 01 00:11:57 CST 2017
     */
    int insert(DemissionInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table DemissionInfo
     *
     * @mbg.generated Wed Nov 01 00:11:57 CST 2017
     */
    int insertSelective(DemissionInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table DemissionInfo
     *
     * @mbg.generated Wed Nov 01 00:11:57 CST 2017
     */
    DemissionInfo selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table DemissionInfo
     *
     * @mbg.generated Wed Nov 01 00:11:57 CST 2017
     */
    int updateByPrimaryKeySelective(DemissionInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table DemissionInfo
     *
     * @mbg.generated Wed Nov 01 00:11:57 CST 2017
     */
    int updateByPrimaryKey(DemissionInfo record);
    
    List<DemissionInfo> selectAll();
    List<DemissionInfo> selectDemissionListByMultiCondition(Map<String,Object> params,RowBounds rowBounds);
    int selectDemissionCountByMultiCondition(Map<String,Object> params);
}