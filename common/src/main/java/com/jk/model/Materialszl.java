package com.jk.model;

import java.io.Serializable;

public class Materialszl implements Serializable {    ///物料

    private String id;
    private String zhijing;
    private String dengji;
    private String xilie;
    private String caizhi;
    private String shengcanbz;

    private String  stileid;  /// 类目id‘

    private  String ttname;   ///类目   临时字段


    public String getStileid() {
        return stileid;
    }

    public void setStileid(String stileid) {
        this.stileid = stileid;
    }

    public String getTtname() {
        return ttname;
    }

    public void setTtname(String ttname) {
        this.ttname = ttname;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getZhijing() {
        return zhijing;
    }

    public void setZhijing(String zhijing) {
        this.zhijing = zhijing;
    }

    public String getDengji() {
        return dengji;
    }

    public void setDengji(String dengji) {
        this.dengji = dengji;
    }

    public String getXilie() {
        return xilie;
    }

    public void setXilie(String xilie) {
        this.xilie = xilie;
    }

    public String getCaizhi() {
        return caizhi;
    }

    public void setCaizhi(String caizhi) {
        this.caizhi = caizhi;
    }

    public String getShengcanbz() {
        return shengcanbz;
    }

    public void setShengcanbz(String shengcanbz) {
        this.shengcanbz = shengcanbz;
    }
}
