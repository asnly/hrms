package com.shuodao.hrms.db.entity;

import java.util.Date;

public class CertificateRecord {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column CertificateRecord.id
     *
     * @mbg.generated Sun Aug 20 00:04:52 CST 2017
     */
    private Integer id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column CertificateRecord.userid
     *
     * @mbg.generated Sun Aug 20 00:04:52 CST 2017
     */
    private String userid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column CertificateRecord.tid
     *
     * @mbg.generated Sun Aug 20 00:04:52 CST 2017
     */
    private String tid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column CertificateRecord.Certificate_name
     *
     * @mbg.generated Sun Aug 20 00:04:52 CST 2017
     */
    private String certificateName;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column CertificateRecord.number
     *
     * @mbg.generated Sun Aug 20 00:04:52 CST 2017
     */
    private String number;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column CertificateRecord.certificateDate
     *
     * @mbg.generated Sun Aug 20 00:04:52 CST 2017
     */
    private Date certificatedate;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column CertificateRecord.id
     *
     * @return the value of CertificateRecord.id
     *
     * @mbg.generated Sun Aug 20 00:04:52 CST 2017
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column CertificateRecord.id
     *
     * @param id the value for CertificateRecord.id
     *
     * @mbg.generated Sun Aug 20 00:04:52 CST 2017
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column CertificateRecord.userid
     *
     * @return the value of CertificateRecord.userid
     *
     * @mbg.generated Sun Aug 20 00:04:52 CST 2017
     */
    public String getUserid() {
        return userid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column CertificateRecord.userid
     *
     * @param userid the value for CertificateRecord.userid
     *
     * @mbg.generated Sun Aug 20 00:04:52 CST 2017
     */
    public void setUserid(String userid) {
        this.userid = userid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column CertificateRecord.tid
     *
     * @return the value of CertificateRecord.tid
     *
     * @mbg.generated Sun Aug 20 00:04:52 CST 2017
     */
    public String getTid() {
        return tid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column CertificateRecord.tid
     *
     * @param tid the value for CertificateRecord.tid
     *
     * @mbg.generated Sun Aug 20 00:04:52 CST 2017
     */
    public void setTid(String tid) {
        this.tid = tid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column CertificateRecord.Certificate_name
     *
     * @return the value of CertificateRecord.Certificate_name
     *
     * @mbg.generated Sun Aug 20 00:04:52 CST 2017
     */
    public String getCertificateName() {
        return certificateName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column CertificateRecord.Certificate_name
     *
     * @param certificateName the value for CertificateRecord.Certificate_name
     *
     * @mbg.generated Sun Aug 20 00:04:52 CST 2017
     */
    public void setCertificateName(String certificateName) {
        this.certificateName = certificateName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column CertificateRecord.number
     *
     * @return the value of CertificateRecord.number
     *
     * @mbg.generated Sun Aug 20 00:04:52 CST 2017
     */
    public String getNumber() {
        return number;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column CertificateRecord.number
     *
     * @param number the value for CertificateRecord.number
     *
     * @mbg.generated Sun Aug 20 00:04:52 CST 2017
     */
    public void setNumber(String number) {
        this.number = number;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column CertificateRecord.certificateDate
     *
     * @return the value of CertificateRecord.certificateDate
     *
     * @mbg.generated Sun Aug 20 00:04:52 CST 2017
     */
    public Date getCertificatedate() {
        return certificatedate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column CertificateRecord.certificateDate
     *
     * @param certificatedate the value for CertificateRecord.certificateDate
     *
     * @mbg.generated Sun Aug 20 00:04:52 CST 2017
     */
    public void setCertificatedate(Date certificatedate) {
        this.certificatedate = certificatedate;
    }
}