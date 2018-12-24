package com.jk.mapper;


import com.jk.model.Order;

import java.util.List;
import java.util.Map;

public interface OrderMapper {


    List<Order> queryOrderList(Map map);

    int queryCount(Map map);

    List<Order>  findLists(Order order);
 }
