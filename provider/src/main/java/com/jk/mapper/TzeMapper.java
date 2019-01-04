package com.jk.mapper;

import com.jk.model.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface TzeMapper {

    List<Order> findList();


    void saveTitleBean( TitleBean titleBeans);
    void saveProductBean(ProductBean productBeans);
    void saveFigure(Figure figures);

    void saveFigures(Figure figures);
    /*定价单发布*/
    void saveEnquiry(@Param("enq") Enquiry enquiry);

    void saveTitle(TitleBean title);

    void saveProduct(ProductBean product);

    List<Nav> getNodes(String id);
}
