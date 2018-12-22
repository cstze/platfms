package com.jk.controller;

import com.alibaba.fastjson.JSON;
import com.jk.model.Order;
import com.jk.service.TzeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.List;

@Controller
public class TzeController {
   @Autowired
    private TzeService tzeService;
    @RequestMapping("findList")
    @ResponseBody
    public List<Order> findList(){
        List<Order> list =tzeService.findList();
        return list;
    }

    //redis
    @Autowired
    private RedisTemplate redisTemplate;
    @RequestMapping("saveOrder")
    @ResponseBody
    public void saveOrder(Order order){
        redisTemplate.opsForValue().set("order", JSON.toJSONString(order));
        Object ore = redisTemplate.opsForValue().get("order");
        System.out.println(ore);
    }
}
