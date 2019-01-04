package com.jk.serviceplaapi;

import com.jk.model.*;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RequestMapping("TzeServiceapi")
public interface TzeServiceapi{

    @GetMapping("findList")
    List<Order> findList();

    // 递归树
    @GetMapping("findNva")
    List<Nav> findNva();

   @PostMapping("saveFigure")
    void saveFigure(@RequestBody  Figure figures);

//   @PostMapping("savetpf")
//    void savetpf(@RequestParam("titleBeans") TitleBean titleBeans,@RequestParam("productBeans") ProductBean productBeans,@RequestParam("figures") Figure figures);
//  @PostMapping("savetpf")
//   void savetpf(Map<String, Object> map);
}
