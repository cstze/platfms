package com.jk.serviceplaapi;


import com.jk.model.Material;
import com.jk.utils.PageResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RequestMapping("MeServiceApi")
public interface MeServiceApi {
    @PostMapping("metlist")
    PageResult metlist(Material material, @RequestParam("page") Integer page, @RequestParam("rows") Integer rows);
     @GetMapping("malterlist")
    List<Material> malterlist();


 }
