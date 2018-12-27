/**
 * 版权 ： 2018  XXX有限公司
 * 文件名: Enquiry
 * 作者姓名:   段苏峡
 * 时间:     2018/12/26 14:51
 */
package com.jk.model;

public class Enquiry {

    private String enquiryId;        //询价单id
    private Integer startTimeType;  //报价开始日期类型
    private String startTime;     //报价开始时间
    private String endTime;          //截止日期
    private Integer resultTimeType;   //结果公布日期类型
    private String resultTime;       //结果公布日期
    private Integer receivingCycle;   //期望收货周期
    private Integer suppliersType;   //供应商范围
    private Integer suppliersMinNum;  //最低参与报价供应商的数量
    private Double tatolPrice;      //预期总价（含税）
    private String prepaymentRatio;  //预付款比例
    private Integer prepaymentDays;  //预付款账期
    private String deliveryRatio;  //交付款比例
    private Integer deliveryDays;  //交付款账期
    private String paymentRatio;  //票到款比例
    private Integer paymentDays;  //票到款账期
    private String finalRatio;   //尾款比例
    private Integer finalDays;   //尾款账期
    private Integer invoiceType;  //发票类型
    private Integer makeOutType;  //开票方式
    private String settlement;  //结算商
    private Integer distri;    //配送方式
    private String address;   //收货地址
    private String remark;    //备注信息
    private String fileId;   //文件id
    private String fileName;   //文件名称
    private Integer materials; //是否提供材料单
    private String taxRate; //税率

    public String getEnquiryId() {
        return enquiryId;
    }

    public void setEnquiryId(String enquiryId) {
        this.enquiryId = enquiryId;
    }

    public Integer getStartTimeType() {
        return startTimeType;
    }

    public void setStartTimeType(Integer startTimeType) {
        this.startTimeType = startTimeType;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public Integer getResultTimeType() {
        return resultTimeType;
    }

    public void setResultTimeType(Integer resultTimeType) {
        this.resultTimeType = resultTimeType;
    }

    public String getResultTime() {
        return resultTime;
    }

    public void setResultTime(String resultTime) {
        this.resultTime = resultTime;
    }

    public Integer getReceivingCycle() {
        return receivingCycle;
    }

    public void setReceivingCycle(Integer receivingCycle) {
        this.receivingCycle = receivingCycle;
    }

    public Integer getSuppliersType() {
        return suppliersType;
    }

    public void setSuppliersType(Integer suppliersType) {
        this.suppliersType = suppliersType;
    }

    public Integer getSuppliersMinNum() {
        return suppliersMinNum;
    }

    public void setSuppliersMinNum(Integer suppliersMinNum) {
        this.suppliersMinNum = suppliersMinNum;
    }

    public Double getTatolPrice() {
        return tatolPrice;
    }

    public void setTatolPrice(Double tatolPrice) {
        this.tatolPrice = tatolPrice;
    }

    public String getPrepaymentRatio() {
        return prepaymentRatio;
    }

    public void setPrepaymentRatio(String prepaymentRatio) {
        this.prepaymentRatio = prepaymentRatio;
    }

    public Integer getPrepaymentDays() {
        return prepaymentDays;
    }

    public void setPrepaymentDays(Integer prepaymentDays) {
        this.prepaymentDays = prepaymentDays;
    }

    public String getDeliveryRatio() {
        return deliveryRatio;
    }

    public void setDeliveryRatio(String deliveryRatio) {
        this.deliveryRatio = deliveryRatio;
    }

    public Integer getDeliveryDays() {
        return deliveryDays;
    }

    public void setDeliveryDays(Integer deliveryDays) {
        this.deliveryDays = deliveryDays;
    }

    public String getPaymentRatio() {
        return paymentRatio;
    }

    public void setPaymentRatio(String paymentRatio) {
        this.paymentRatio = paymentRatio;
    }

    public Integer getPaymentDays() {
        return paymentDays;
    }

    public void setPaymentDays(Integer paymentDays) {
        this.paymentDays = paymentDays;
    }

    public String getFinalRatio() {
        return finalRatio;
    }

    public void setFinalRatio(String finalRatio) {
        this.finalRatio = finalRatio;
    }

    public Integer getFinalDays() {
        return finalDays;
    }

    public void setFinalDays(Integer finalDays) {
        this.finalDays = finalDays;
    }

    public Integer getInvoiceType() {
        return invoiceType;
    }

    public void setInvoiceType(Integer invoiceType) {
        this.invoiceType = invoiceType;
    }

    public Integer getMakeOutType() {
        return makeOutType;
    }

    public void setMakeOutType(Integer makeOutType) {
        this.makeOutType = makeOutType;
    }

    public String getSettlement() {
        return settlement;
    }

    public void setSettlement(String settlement) {
        this.settlement = settlement;
    }

    public Integer getDistri() {
        return distri;
    }

    public void setDistri(Integer distri) {
        this.distri = distri;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getFileId() {
        return fileId;
    }

    public void setFileId(String fileId) {
        this.fileId = fileId;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public Integer getMaterials() {
        return materials;
    }

    public void setMaterials(Integer materials) {
        this.materials = materials;
    }

    public String getTaxRate() {
        return taxRate;
    }

    public void setTaxRate(String taxRate) {
        this.taxRate = taxRate;
    }
}
