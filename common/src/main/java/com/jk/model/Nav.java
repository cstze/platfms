package com.jk.model;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

public class Nav implements Serializable {

    private final static int HashCode = 60;
    private static final long serialVersionUID = -4747829095924088752L;
    /*
     树表
     */
    /*
    id
     */
    private String id;
    /*
     节点名称
     */
    private String text;
    /*
    节点路径
     */
    private String url;
    /*
    父级Id
     */
    private String pid;
    /*
     样式
     */
    private Boolean leaf;
    /*
    是否可选中
     */
    private Boolean selectable;
    /*
    子级节点集合
     */
    private List<Nav> nodes;
    private Map<String,Object> state;
    private Boolean showBorder;
    public Map<String, Object> getState() {
        return state;
    }

    public Boolean getShowBorder() {
        return showBorder;
    }

    public void setShowBorder(Boolean showBorder) {
        this.showBorder = showBorder;
    }

    public void setState(Map<String, Object> state) {
        this.state = state;
    }

    public Boolean getLeaf() {
        return leaf;
    }

    public void setLeaf(Boolean leaf) {
        this.leaf = leaf;
    }

    public Boolean getSelectable() {
        return selectable;
    }

    public void setSelectable(Boolean selectable) {
        this.selectable = selectable;
    }

    public List<Nav> getNodes() {
        return nodes;
    }

    public void setNodes(List<Nav> nodes) {
        this.nodes = nodes;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }
    @Override
    public int hashCode() {
        return HashCode;
    }

    /**
     *
     */
    @Override
    public boolean equals(Object obj) {
        if(!(obj instanceof Nav)) {
            return false;
        }
        //对传入对象上转型为Devices对象
        Nav na = (Nav) obj;
        //判断两个对象设备id一致认为是一个设备
        return this.id.equals(na.getId());
    }


}
