package com.jk.model;

import java.util.Date;

public class MaterialBean {
    private  String mid;
    private  String mname;
    private  String channel;
    private Date mdate;

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

    public Date getMdate() {
        return mdate;
    }

    public void setMdate(Date mdate) {
        this.mdate = mdate;
    }

    @Override
    public String toString() {
        return "MaterialBean{" +
                "mid='" + mid + '\'' +
                ", mname='" + mname + '\'' +
                ", channel='" + channel + '\'' +
                ", mdate=" + mdate +
                '}';
    }
}
