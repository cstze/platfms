package com.jk.controller;

import com.alibaba.fastjson.JSON;
import com.jk.model.*;
import com.jk.service.TzeService;

import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

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
    private RedisTemplate redisCacheTemplate;
    @RequestMapping("saveOrder")
    @ResponseBody
    public void saveOrder(Order order){
        redisCacheTemplate.opsForValue().set("order", JSON.toJSONString(order));
        Object ore = redisCacheTemplate.opsForValue().get("order");
        System.out.println(ore);
    }
//B-1
    @RequestMapping("saveTitle")
    @ResponseBody
    public void saveTitle(TitleBean titleBean){
        titleBean.settId(UUID.randomUUID().toString().replaceAll("-",""));
        redisCacheTemplate.opsForValue().set("titleBean",titleBean);
    }
    //B-2
    @RequestMapping("saveProduct")
    @ResponseBody
    public void saveProduct(ProductBean productBean){
        productBean.setProductId(UUID.randomUUID().toString().replaceAll("-",""));
        redisCacheTemplate.opsForValue().set("productBean",productBean);
    }
    //图单redis  b-1-1
    @RequestMapping("savefigure")
    @ResponseBody
    public void insertmaterial(Figure figure){
        figure.setFigureid(UUID.randomUUID().toString().replaceAll("-",""));
        redisCacheTemplate.opsForValue().set("figure",figure);
        Object  mk=redisCacheTemplate.opsForValue().get("figure");
        System.out.print(mk);
    }
    //询价单确认发布
    @Autowired//注入rabbitMq工具类
    private AmqpTemplate amqpTemplate;

    @PostMapping("savetpf")
    @ResponseBody
    public void savetpf(TitleBean titleBean, ProductBean productBean, Figure figure){
        TitleBean  titleBeans= (TitleBean) redisCacheTemplate.opsForValue().get("titleBean");
        ProductBean  productBeans = (ProductBean) redisCacheTemplate.opsForValue().get("productBean");
        Figure  figures= (Figure) redisCacheTemplate.opsForValue().get("figure");
        Map<String,Object> map =new HashMap<String,Object>();
        map.put("title",titleBeans);
        map.put("product",productBeans);
        map.put("figures",figures);
        amqpTemplate.convertAndSend("myqueuecs",map);
     }
    @PostMapping("saveFigure")
    @ResponseBody
      public void savetpf(){
        Figure  figures= (Figure) redisCacheTemplate.opsForValue().get("figure");
        tzeService.saveFigure(figures);
    }

    /*
       B-1-3
     */
    @PostMapping("saveEnquiry")
    @ResponseBody
    public void saveEnquiry(Enquiry enquiry){
        enquiry.setEnquiryId(UUID.randomUUID().toString().replaceAll("-",""));
        redisCacheTemplate.opsForValue().set("enquiry",enquiry);
    }

    @PostMapping("savetfEnquiry")
    @ResponseBody
    public void savetfEnquiry(TitleBean titleBean, ProductBean productBean,Enquiry enquiry){
        TitleBean  titleBeans= (TitleBean) redisCacheTemplate.opsForValue().get("titleBean");
        ProductBean  productBeans = (ProductBean) redisCacheTemplate.opsForValue().get("productBean");
        Enquiry  enquirys= (Enquiry) redisCacheTemplate.opsForValue().get("enquiry");
        Map<String,Object> map =new HashMap<String,Object>();
        map.put("title",titleBeans);
        map.put("product",productBeans);
        map.put("enquirys",enquirys);
        amqpTemplate.convertAndSend("myqueuell",map);
    }

    /*递归树*/

    @RequestMapping("findNva")
    @ResponseBody
    public List<Nav> findNva(){
        List<Nav> nva =tzeService.findNva();
        return nva;
    }
}
