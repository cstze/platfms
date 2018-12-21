package com.jk.controller;

import com.jk.model.Order;
import com.jk.service.TzeCsService;
import com.jk.serviceplaapi.TzeServiceapi;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class TzeController implements TzeServiceapi {
    @Autowired
    private TzeCsService tzeCsService;

    @Override
    public List<Order> findList() {
        System.out.println(2);
        return tzeCsService.findList();
    }
}
