package com.jk.service;

import com.jk.model.*;

import java.util.List;

public interface TzeCsService {
    List<Order> findList();

    void savetpf(TitleBean titleBeans, ProductBean productBeans, Figure figures);

    void saveFigure(Figure figures);

    void savetfEnquiry(TitleBean title, ProductBean product, Enquiry enquiry);

    List<Nav> findNva();
}
