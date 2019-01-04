package com.jk.controller;

import com.jk.model.Img;
import com.jk.model.Materialszl;
import com.jk.model.Polling;
import com.jk.service.Poservice;

import com.jk.serviceplaapi.Poserviceapi;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;

@RestController
public class
Pocontrollers implements Poserviceapi {

    @Autowired
    private Poservice poservice;


    @Override
    public List<Img> getimg() {
        return poservice.getimg();
    }

    @Override
    public HashMap<String, Object> querylist( Integer page,  Integer rows,@RequestBody Polling polling) {
        return poservice.querylist(page, rows,polling);
    }
    @Override
    public List<Materialszl> getCL() {
        return poservice.getCL();
    }

    @Override
    public int delCL(String id) {
        return poservice.delCL(id);
    }

    @Override
    public int insertMaterialszl(@RequestBody Materialszl materialszl) {
        return poservice.insertMaterialszl(materialszl);
    }

    @Override
    public Polling queryPollingId(Integer id) {
        return poservice.queryPollingId(id);
    }


}






