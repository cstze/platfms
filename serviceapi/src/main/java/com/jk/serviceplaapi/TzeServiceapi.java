package com.jk.serviceplaapi;

import com.jk.model.Order;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@RequestMapping("TzeServiceapi")
public interface TzeServiceapi{
    @GetMapping("findList")
    List<Order> findList();

}
