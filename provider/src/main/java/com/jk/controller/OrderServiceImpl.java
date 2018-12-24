package com.jk.controller;

import com.jk.model.Order;
import com.jk.service.OrderServices;
import com.jk.serviceplaapi.OrderServiceApi;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.alibaba.fastjson.JSON;

@RestController
public class OrderServiceImpl implements OrderServiceApi {
    @Autowired
    private OrderServices orderservices;


    @Override
    public List<Order> queryOrderList(@RequestBody Order order, @RequestParam("page") Integer page,@RequestParam("size") Integer size) {
        return orderservices.queryOrderList(order,page,size);
    }

    @Override
    public int queryCount(@RequestBody Order order, Integer page, Integer size) {
        return   orderservices.queryCount(order,page,size);
    }

    @Override
    public List<Order> findLists(Order order){
        return  orderservices.findLists(order);
    }

    @RabbitListener(queues = "myqueue")
    public void listenerBookMessage(String message){
        Map map = JSON.parseObject(message, Map.class);
        System.out.println("message = [" + map.toString() + "]");
    }

}
