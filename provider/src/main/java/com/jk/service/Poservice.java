package com.jk.service;

import com.jk.model.Img;
import com.jk.model.Materialszl;
import com.jk.model.Polling;

import java.util.HashMap;
import java.util.List;

public interface Poservice {
    List<Img> getimg();

    HashMap<String, Object> querylist(Integer page, Integer rows, Polling polling);

    List<Materialszl> getCL();

    int delCL(String id);

    int insertMaterialszl(Materialszl materialszl);

    Polling queryPollingId(Integer id);
}
