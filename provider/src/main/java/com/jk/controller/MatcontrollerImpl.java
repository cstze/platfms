package com.jk.controller;

import com.jk.model.Material;

import com.jk.service.MaService;

import com.jk.serviceplaapi.MeServiceApi;
import com.jk.utils.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class MatcontrollerImpl implements MeServiceApi {
      @Autowired
      private MaService maService;
  //查询材料
    @Override
    public PageResult metlist(@RequestBody  Material material, Integer page, Integer rows) {
        return maService.metlist(material,page,rows);
    }

    @Override
    public List<Material> malterlist() {
        return  maService.malterlist();
    }
    //新增
    @Async//声明此方法是一个异步run方法
    public void insert(Material material) {
        maService.insert(material);
    }
}
