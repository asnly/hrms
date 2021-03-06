package com.shuodao.hrms.db.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.shuodao.hrms.db.entity.Contract;

public interface ContractMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table Contract
     *
     * @mbg.generated Tue Sep 05 23:24:41 CST 2017
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table Contract
     *
     * @mbg.generated Tue Sep 05 23:24:41 CST 2017
     */
    int insert(Contract record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table Contract
     *
     * @mbg.generated Tue Sep 05 23:24:41 CST 2017
     */
    int insertSelective(Contract record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table Contract
     *
     * @mbg.generated Tue Sep 05 23:24:41 CST 2017
     */
    Contract selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table Contract
     *
     * @mbg.generated Tue Sep 05 23:24:41 CST 2017
     */
    int updateByPrimaryKeySelective(Contract record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table Contract
     *
     * @mbg.generated Tue Sep 05 23:24:41 CST 2017
     */
    int updateByPrimaryKeyWithBLOBs(Contract record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table Contract
     *
     * @mbg.generated Tue Sep 05 23:24:41 CST 2017
     */
    int updateByPrimaryKey(Contract record);
    List<Contract> selectByKeyWord(@Param("keyword") String keyword);
    int selectContractListCountByKeyword(Map<String,Object> params);
    List<Contract> selectAll();
    Contract selectByEmployeeid(String employeeid);
    
}