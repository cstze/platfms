package com.jk.controller;

import com.jk.model.*;
import com.jk.service.TzeCsService;
import com.jk.serviceplaapi.TzeServiceapi;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
public class TzeController implements TzeServiceapi {
    @Autowired
    private TzeCsService tzeCsService;


    @Override
    public List<Order> findList() {
        return tzeCsService.findList();
    }

    @Override
    public void saveFigure(@RequestBody Figure figures) {
        tzeCsService.saveFigure(figures);
    }

    @RabbitListener(queues = "myqueuecs")
    public void savetpf(Map<String, Object> map) {
        TitleBean title = (TitleBean) map.get("title");
        ProductBean  product = (ProductBean) map.get("product");
        Figure figure = (Figure) map.get("figures");
        tzeCsService.savetpf(title,product,figure);
    }

    @RabbitListener(queues = "myqueuell")
    public void savetfEnquiry(Map<String,Object> map) {
        TitleBean title = (TitleBean) map.get("title");
        ProductBean  product = (ProductBean) map.get("product");
        Enquiry enquiry = (Enquiry) map.get("enquirys");
        tzeCsService.savetfEnquiry(title,product,enquiry);
    }
  //递归树

    @Override
    public List<Nav> findNva() {

        return tzeCsService.findNva();
    }

}
