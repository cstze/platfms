package com.jk.mapper;

import com.jk.model.Material;
import org.apache.ibatis.annotations.Mapper;

import java.util.HashMap;
import java.util.List;

@Mapper
public interface MaMapper {


    int couponselectcount(HashMap<String, Object> hashMap);

    List<Material> couponselectList(HashMap<String, Object> hashMap);

    List<Material> malterlist();

    void insert(Material material);

    void updatinserttype(Material material);
}
