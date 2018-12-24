package com.jk.serviceplaapi;

import com.jk.model.Order;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@RequestMapping("orderServiceApi")
public interface OrderServiceApi {

    @PostMapping("OrderList")
    List<Order> queryOrderList(Order order, @RequestParam("page") Integer page, @RequestParam("size") Integer size);

    @PostMapping("queryCount")
    int queryCount(Order order, @RequestParam("page") Integer page, @RequestParam("size") Integer size);

    @PostMapping("findLists")
    List<Order> findLists(Order order);
}
