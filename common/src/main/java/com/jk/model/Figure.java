package com.jk.model;

import java.io.Serializable;

//图单
public class Figure implements Serializable {

    private  String  figureid;

    private  String starttimetype;

    private  String  sarttime;

    private  String  endtime;

    private  String  resuittime;

    private  String  remark;

    private  String  fileid;

    private  String  filename;

    private  String  status;

    public String getFigureid() {
        return figureid;
    }

    public void setFigureid(String figureid) {
        this.figureid = figureid;
    }

    public String getStarttimetype() {
        return starttimetype;
    }

    public void setStarttimetype(String starttimetype) {
        this.starttimetype = starttimetype;
    }

    public String getSarttime() {
        return sarttime;
    }

    public void setSarttime(String sarttime) {
        this.sarttime = sarttime;
    }

    public String getEndtime() {
        return endtime;
    }

    public void setEndtime(String endtime) {
        this.endtime = endtime;
    }

    public String getResuittime() {
        return resuittime;
    }

    public void setResuittime(String resuittime) {
        this.resuittime = resuittime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getFileid() {
        return fileid;
    }

    public void setFileid(String fileid) {
        this.fileid = fileid;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
