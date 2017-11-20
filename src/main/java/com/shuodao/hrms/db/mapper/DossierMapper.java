package com.shuodao.hrms.db.mapper;

import java.util.List;

import com.shuodao.hrms.db.entity.Dossier;

public interface DossierMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table Dossier
     *
     * @mbg.generated Thu Sep 28 23:11:02 CST 2017
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table Dossier
     *
     * @mbg.generated Thu Sep 28 23:11:02 CST 2017
     */
    int insert(Dossier record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table Dossier
     *
     * @mbg.generated Thu Sep 28 23:11:02 CST 2017
     */
    int insertSelective(Dossier record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table Dossier
     *
     * @mbg.generated Thu Sep 28 23:11:02 CST 2017
     */
    Dossier selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table Dossier
     *
     * @mbg.generated Thu Sep 28 23:11:02 CST 2017
     */
    int updateByPrimaryKeySelective(Dossier record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table Dossier
     *
     * @mbg.generated Thu Sep 28 23:11:02 CST 2017
     */
    int updateByPrimaryKey(Dossier record);
    List<Dossier> selectAll();
    int selectNums();
    Dossier selectByEid(Integer eid);
}