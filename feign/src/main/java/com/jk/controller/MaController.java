package com.jk.controller;

import com.alibaba.fastjson.JSON;
import com.jk.model.Material;
import com.jk.service.MaService;
import com.jk.utils.PageResult;


import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class MaController {
    @Autowired
    private MaService maService;
   @Autowired
    private AmqpTemplate amqpTemplate;

      @Autowired
      private RedisTemplate redisTemplate;




     //我的材料单
    @RequestMapping("malList")
    @ResponseBody
    public PageResult malList( Material material, Integer  page, Integer  rows){
        return maService.metlist(material,page,rows);
    }

     //查看材料单
      @RequestMapping("malterlist")
       @ResponseBody
      public List<Material> malterlist(){
         return   maService.malterlist();

      }
      //新增
  @RequestMapping("insert")
    @ResponseBody
    public void insert(Material material) {
            amqpTemplate.convertAndSend("myqueuels", material);

    }

   //测试redis
   @RequestMapping("savematerial")
   @ResponseBody
   public void insertmaterial(Material  material){
       //convertAndSend 向队列发送一个消息 第一个参数为队列名称 第二个参数为队列内容
       redisTemplate.opsForValue().set("material", JSON.toJSONString(material));
       redisTemplate.opsForValue().get("material");
       System.out.println("material = [" + material.getMname() + "]");
       Object sss = redisTemplate.opsForValue().get("sss");
   }

}
