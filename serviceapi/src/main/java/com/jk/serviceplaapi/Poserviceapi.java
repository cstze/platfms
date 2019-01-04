package com.jk.serviceplaapi;


import com.jk.model.Img;
import com.jk.model.Materialszl;
import com.jk.model.Polling;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;


@RequestMapping("Poserviceapi")
public interface Poserviceapi {
    ///查询 图片
    @GetMapping("getimg")
    List<Img> getimg();
    @PostMapping("querylist")
    HashMap<String, Object> querylist(@RequestParam("page") Integer page, @RequestParam("rows") Integer rows, Polling polling);
    @GetMapping("getCL")
    List<Materialszl> getCL();
    @PostMapping("delCL")
    int delCL(@RequestParam("id")String id);
    @PostMapping("insertMaterialszl")
    int insertMaterialszl(Materialszl materialszl);
    @GetMapping("queryPollingId")
    Polling queryPollingId(@RequestParam("id")Integer id);
}
