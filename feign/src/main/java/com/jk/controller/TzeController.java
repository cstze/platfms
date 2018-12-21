package com.jk.controller;

import com.jk.model.Order;
import com.jk.service.TzeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("tze")
public class TzeController {
   @Autowired
    private TzeService tzeService;
    @RequestMapping("findList")
    @ResponseBody
    public List<Order> findList(){
        System.out.println(1);
        List<Order> list =tzeService.findList();
        return list;
    }
}
