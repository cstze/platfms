package com.jk.service;

import com.jk.mapper.OrderMapper;
import com.jk.model.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class OrderServiceImpls implements OrderServices {

    @Autowired
    private OrderMapper orderMapper;

    @Override
    public List<Order> queryOrderList(Order order,Integer page,Integer size) {
        Map<String, Object> map = new HashMap<>();
        map.put("order",order);
        map.put("page",(page-1)*size);
        map.put("size",size);
        return orderMapper.queryOrderList(map);
    }

    @Override
    public int queryCount(Order order, Integer page, Integer size) {
        Map<String, Object> map = new HashMap<>();
        map.put("order",order);
        map.put("page",(page-1)*size);
        map.put("size",size);
        return orderMapper.queryCount(map);
    }

    @Override
    public List<Order> findLists(Order order) {
        return orderMapper.findLists(order);
    }
}
