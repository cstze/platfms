package com.jk.service;

import com.jk.mapper.TzeMapper;
import com.jk.model.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TzeServiceImpl implements TzeCsService{
    @Autowired
    private TzeMapper tzeMapper;

    @Override
    public List<Order> findList() {
        System.out.println(3);
        List<Order> list = tzeMapper.findList();
        return list;
    }
}
