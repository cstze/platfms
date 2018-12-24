package com.jk.service;

import com.jk.model.Material;
import com.jk.utils.PageResult;

import java.util.List;

public interface MaService {

    void insert(Material material);

    PageResult metlist(Material material, Integer page, Integer rows);

    List<Material> malterlist();
}
