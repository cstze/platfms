package com.jk.model;
//图单
public class Figure {

    private  String  figureid;

    private  Integer starttimetype;

    private  String  sarttime;

    private  String  endtime;

    private  String  resuittime;

    private  String  remark;

    private  String  fileid;

    private  String  filename;

    private  Integer  status;


    public String getFigureid() {
        return figureid;
    }

    public void setFigureid(String figureid) {
        this.figureid = figureid;
    }

    public Integer getStarttimetype() {
        return starttimetype;
    }

    public void setStarttimetype(Integer starttimetype) {
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

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
