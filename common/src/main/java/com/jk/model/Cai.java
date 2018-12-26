package com.jk.model;

public class Cai {

    private String id;

    private int bill;  //我的材料单 下拉

    private  int stencll;    //我的模板  下拉

    private  String category; //类目

    private  String  name;    //物料名称

    private String  material;  //物料编码

    private String  quantity;  //数量L

    private int  diamete;     //工程直径 回显

    private int  diametes;    //工程直径 新增

    private int grade;   //厚度等级 回显

    private  int grades;    //厚度等级 新增

    private  int ods;      //外径   新增、

    private int  od;     //外径  回显

    private int texture; //材质 回显

    private int  textutes; //材质 新增

    private  int standard;  // 生产标准 回显

    private int  standards;  //生产标准 新增

    private  String items;    //服务项 回显

    private  String titleid;   //关联类目表的id  是东东的

    private  String materialszlid;  // 关联物料表的id   赵露的

    public String getTitleid() {
        return titleid;
    }

    public void setTitleid(String titleid) {
        this.titleid = titleid;
    }

    public String getMaterialszlid() {
        return materialszlid;
    }

    public void setMaterialszlid(String materialszlid) {
        this.materialszlid = materialszlid;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getBill() {
        return bill;
    }

    public void setBill(int bill) {
        this.bill = bill;
    }

    public int getStencll() {
        return stencll;
    }

    public void setStencll(int stencll) {
        this.stencll = stencll;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public int getDiamete() {
        return diamete;
    }

    public void setDiamete(int diamete) {
        this.diamete = diamete;
    }

    public int getDiametes() {
        return diametes;
    }

    public void setDiametes(int diametes) {
        this.diametes = diametes;
    }

    public int getGrade() {
        return grade;
    }

    public void setGrade(int grade) {
        this.grade = grade;
    }

    public int getGrades() {
        return grades;
    }

    public void setGrades(int grades) {
        this.grades = grades;
    }

    public int getOds() {
        return ods;
    }

    public void setOds(int ods) {
        this.ods = ods;
    }

    public int getOd() {
        return od;
    }

    public void setOd(int od) {
        this.od = od;
    }

    public int getTexture() {
        return texture;
    }

    public void setTexture(int texture) {
        this.texture = texture;
    }

    public int getTextutes() {
        return textutes;
    }

    public void setTextutes(int textutes) {
        this.textutes = textutes;
    }

    public int getStandard() {
        return standard;
    }

    public void setStandard(int standard) {
        this.standard = standard;
    }

    public int getStandards() {
        return standards;
    }

    public void setStandards(int standards) {
        this.standards = standards;
    }

    public String getItems() {
        return items;
    }

    public void setItems(String items) {
        this.items = items;
    }
}
