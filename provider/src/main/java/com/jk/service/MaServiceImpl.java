package com.jk.service;

import com.jk.mapper.MaMapper;
import com.jk.model.Material;
import com.jk.utils.PageResult;

import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.UUID;

@Service
public class MaServiceImpl implements MaService {
    @Autowired
    private MaMapper maMapper;
    @Override
    public PageResult metlist(Material material, Integer  page, Integer  rows) {
        HashMap<String, Object> hashMap = new HashMap<>();
        PageResult pageResult = new PageResult();
        int count=maMapper.couponselectcount(hashMap);
        pageResult.setTotal(count);
        hashMap.put("page", (page-1)*rows);
        hashMap.put("rows", rows);
        hashMap.put("mname", material.getMname());
        List<Material> list=maMapper.couponselectList(hashMap);
        pageResult.setRows(list);
        return pageResult;

    }

    @Override
    public List<Material> malterlist() {
        return maMapper.malterlist();
    }


    //新增修改
    @RabbitListener(queues = "myqueuels")
    public void  insert(Material material){

        String id = material.getMid();
        if(null!=id && !"".equals(id)){
            maMapper.updatinserttype(material);
        }else{
            String uuid = UUID.randomUUID().toString();
            material.setMid(uuid);
            maMapper.insert(material);
        }

    }
}
