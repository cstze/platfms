package com.jk.model;

import java.util.Date;

public class Order {

    private String orderId;
    private String orderName;
    private String buyerName;
    private Date releaseTime;
    private Integer orderStatus;
    private Integer partinNum;
    private Integer totalNum;
    private Integer avgPrice;
    private Integer settlementPrice;
    private Integer avgTransactionPrice;
    private Integer transactionPrice;


    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getOrderName() {
        return orderName;
    }

    public void setOrderName(String orderName) {
        this.orderName = orderName;
    }

    public String getBuyerName() {
        return buyerName;
    }

    public void setBuyerName(String buyerName) {
        this.buyerName = buyerName;
    }

    public Date getReleaseTime() {
        return releaseTime;
    }

    public void setReleaseTime(Date releaseTime) {
        this.releaseTime = releaseTime;
    }

    public Integer getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(Integer orderStatus) {
        this.orderStatus = orderStatus;
    }

    public Integer getPartinNum() {
        return partinNum;
    }

    public void setPartinNum(Integer partinNum) {
        this.partinNum = partinNum;
    }

    public Integer getTotalNum() {
        return totalNum;
    }

    public void setTotalNum(Integer totalNum) {
        this.totalNum = totalNum;
    }

    public Integer getAvgPrice() {
        return avgPrice;
    }

    public void setAvgPrice(Integer avgPrice) {
        this.avgPrice = avgPrice;
    }

    public Integer getSettlementPrice() {
        return settlementPrice;
    }

    public void setSettlementPrice(Integer settlementPrice) {
        this.settlementPrice = settlementPrice;
    }

    public Integer getAvgTransactionPrice() {
        return avgTransactionPrice;
    }

    public void setAvgTransactionPrice(Integer avgTransactionPrice) {
        this.avgTransactionPrice = avgTransactionPrice;
    }

    public Integer getTransactionPrice() {
        return transactionPrice;
    }

    public void setTransactionPrice(Integer transactionPrice) {
        this.transactionPrice = transactionPrice;
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderId='" + orderId + '\'' +
                ", orderName='" + orderName + '\'' +
                ", buyerName='" + buyerName + '\'' +
                ", releaseTime=" + releaseTime +
                ", orderStatus=" + orderStatus +
                ", partinNum=" + partinNum +
                ", totalNum=" + totalNum +
                ", avgPrice=" + avgPrice +
                ", settlementPrice=" + settlementPrice +
                ", avgTransactionPrice=" + avgTransactionPrice +
                ", transactionPrice=" + transactionPrice +
                '}';
    }
}
