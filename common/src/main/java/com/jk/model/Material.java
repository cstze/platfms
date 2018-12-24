package com.jk.model;

import java.io.Serializable;
//材料表
public class Material implements Serializable {

    private  String mid;

    private  String  mname;

    private  String channel;

    private  String  mdate;

    private  String category;

    private  String  mnmaeid;

    private  Integer  mnumber;    //编号

    private  Integer mcount;

    private  String   brand;

    private   Double unitprice;

    private String  stileid;  /// 类目id‘

    private  String ttname;   ///类目   临时字段

    public String getTtname() {
        return ttname;
    }

    public void setTtname(String ttname) {
        this.ttname = ttname;
    }

    public String getStileid() {
        return stileid;
    }

    public void setStileid(String stileid) {
        this.stileid = stileid;
    }

    public String getMid() {
        return mid;
    }

    public void setMid(String mid) {
        this.mid = mid;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public String getChannel() {
        return channel;
    }

    public void setChannel(String channel) {
        this.channel = channel;
    }

    public String getMdate() {
        return mdate;
    }

    public void setMdate(String mdate) {
        this.mdate = mdate;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getMnmaeid() {
        return mnmaeid;
    }

    public void setMnmaeid(String mnmaeid) {
        this.mnmaeid = mnmaeid;
    }

    public Integer getMnumber() {
        return mnumber;
    }

    public void setMnumber(Integer mnumber) {
        this.mnumber = mnumber;
    }

    public Integer getMcount() {
        return mcount;
    }

    public void setMcount(Integer mcount) {
        this.mcount = mcount;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public Double getUnitprice() {
        return unitprice;
    }

    public void setUnitprice(Double unitprice) {
        this.unitprice = unitprice;
    }
}
