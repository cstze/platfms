package com.jk.service;

import com.jk.mapper.PoMapper;
import com.jk.model.Img;
import com.jk.model.Materialszl;
import com.jk.model.Polling;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.UUID;

@Service
public class Poserviceimpl implements  Poservice{

    @Autowired
    private PoMapper poMapper;


    @Override
    public List<Img> getimg() {
        return poMapper.getimg();
    }

    @Override
    public HashMap<String, Object> querylist(Integer page, Integer rows, Polling polling) {

        HashMap<String,Object> hashMap = new HashMap<String, Object>();
         ///总条数
        List<Polling> list = poMapper.querylist(page,rows,polling);
        //查询  数据
        int total = poMapper.getcount(polling);
        hashMap.put("rows",list);
        hashMap.put("total", total);
        return hashMap;
    }

    @Override
    public List<Materialszl> getCL() {
        return poMapper.getCL();
    }

    @Override
    public int delCL(String id) {
        return poMapper.delCL(id);
    }

    @Override
    public int insertMaterialszl(Materialszl materialszl) {
        materialszl.setId(UUID.randomUUID().toString());
        return poMapper.insertMaterialszl(materialszl);
    }

    @Override
    public Polling queryPollingId(Integer id) {
        return poMapper.queryPollingId(id);
    }


}
