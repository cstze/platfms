package com.jk.controller;


import com.jk.model.Order;
import com.jk.service.OrderService;
import org.aspectj.weaver.ast.Or;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.alibaba.fastjson.JSON;


@Controller
public class OrderController {

    @Autowired
    private OrderService orderService;

    @RequestMapping("queryOrderPage")
    @ResponseBody
    public Map queryOrderList(Order order, Integer page, Integer size){
        Map<Object, Object> map = new HashMap<>();
        int count = orderService.queryCount(order,page,size);
        List<Order> list =  orderService.queryOrderList(order,page,size);
        map.put("total",count);
        map.put("rows",list);
        return  map;
    }

    @RequestMapping("findLists")
    @ResponseBody
    public List<Order> findLists(Order order){
        List<Order> list =  orderService.findLists(order);
        return  list;
    }
    //ע��rabbitMq������
    @Autowired
    private AmqpTemplate amqpTemplate;
    @RequestMapping("saveBook")
    @ResponseBody
    public void insertBook(){
        //convertAndSend ����з���һ����Ϣ ��һ������Ϊ�������� �ڶ�������Ϊ��������
        Map<String, Object> bookMap = new HashMap<>();
        bookMap.put("bookId","a56sds4fd5gf");
        bookMap.put("bookName","��������");
        amqpTemplate.convertAndSend("myqueue",JSON.toJSONString(bookMap));
    }
}
