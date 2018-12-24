package com.jk.service;

import com.jk.model.Order;

import java.util.List;

public interface OrderServices {
    List<Order> queryOrderList(Order order, Integer page, Integer size);

    List<Order> findLists(Order order);

    int queryCount(Order order, Integer page, Integer size);
}
