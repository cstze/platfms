package com.jk.model;

import java.io.Serializable;
import java.util.Date;

/**
 *  ///c-1-1  定价比 管理
 *      询单表
 */
public class Polling implements Serializable {

    private Integer id;
    private String coding;
    private String porname;
    private String ditch;
    private Date stadate;
    private  String status;
    private  Date enddate ;


    private String staTime;
    private String andTime;

    public String getStaTime() {
        return staTime;
    }

    public void setStaTime(String staTime) {
        this.staTime = staTime;
    }

    public String getAndTime() {
        return andTime;
    }

    public void setAndTime(String andTime) {
        this.andTime = andTime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCoding() {
        return coding;
    }

    public void setCoding(String coding) {
        this.coding = coding;
    }

    public String getPorname() {
        return porname;
    }

    public void setPorname(String porname) {
        this.porname = porname;
    }

    public String getDitch() {
        return ditch;
    }

    public void setDitch(String ditch) {
        this.ditch = ditch;
    }

    public Date getStadate() {
        return stadate;
    }

    public void setStadate(Date stadate) {
        this.stadate = stadate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getEnddate() {
        return enddate;
    }

    public void setEnddate(Date enddate) {
        this.enddate = enddate;
    }
}
