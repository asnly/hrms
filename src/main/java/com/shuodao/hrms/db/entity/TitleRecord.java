package com.shuodao.hrms.db.entity;

import java.util.Date;

public class TitleRecord {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column TitleRecord.id
     *
     * @mbg.generated Sat Oct 28 21:30:32 CST 2017
     */
    private Integer id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column TitleRecord.Titlename
     *
     * @mbg.generated Sat Oct 28 21:30:32 CST 2017
     */
    private String titlename;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column TitleRecord.TitleTime
     *
     * @mbg.generated Sat Oct 28 21:30:32 CST 2017
     */
    private Date titletime;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column TitleRecord.employeeid
     *
     * @mbg.generated Sat Oct 28 21:30:32 CST 2017
     */
    private String employeeid;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column TitleRecord.id
     *
     * @return the value of TitleRecord.id
     *
     * @mbg.generated Sat Oct 28 21:30:32 CST 2017
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column TitleRecord.id
     *
     * @param id the value for TitleRecord.id
     *
     * @mbg.generated Sat Oct 28 21:30:32 CST 2017
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column TitleRecord.Titlename
     *
     * @return the value of TitleRecord.Titlename
     *
     * @mbg.generated Sat Oct 28 21:30:32 CST 2017
     */
    public String getTitlename() {
        return titlename;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column TitleRecord.Titlename
     *
     * @param titlename the value for TitleRecord.Titlename
     *
     * @mbg.generated Sat Oct 28 21:30:32 CST 2017
     */
    public void setTitlename(String titlename) {
        this.titlename = titlename;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column TitleRecord.TitleTime
     *
     * @return the value of TitleRecord.TitleTime
     *
     * @mbg.generated Sat Oct 28 21:30:32 CST 2017
     */
    public Date getTitletime() {
        return titletime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column TitleRecord.TitleTime
     *
     * @param titletime the value for TitleRecord.TitleTime
     *
     * @mbg.generated Sat Oct 28 21:30:32 CST 2017
     */
    public void setTitletime(Date titletime) {
        this.titletime = titletime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column TitleRecord.employeeid
     *
     * @return the value of TitleRecord.employeeid
     *
     * @mbg.generated Sat Oct 28 21:30:32 CST 2017
     */
    public String getEmployeeid() {
        return employeeid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column TitleRecord.employeeid
     *
     * @param employeeid the value for TitleRecord.employeeid
     *
     * @mbg.generated Sat Oct 28 21:30:32 CST 2017
     */
    public void setEmployeeid(String employeeid) {
        this.employeeid = employeeid;
    }
}