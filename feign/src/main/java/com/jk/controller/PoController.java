package com.jk.controller;


        import com.jk.model.Img;
        import com.jk.model.Materialszl;
        import com.jk.model.Polling;
        import com.jk.service.PoillServices;

        import org.springframework.beans.factory.annotation.Autowired;
        import org.springframework.stereotype.Controller;
        import org.springframework.web.bind.annotation.RequestMapping;
        import org.springframework.web.bind.annotation.ResponseBody;
        import org.springframework.web.multipart.MultipartFile;

        import javax.servlet.http.HttpServletRequest;
        import java.util.HashMap;
        import java.util.List;

@Controller
public class PoController {

    @Autowired
    private PoillServices poillServices;

    //查询  服务询图  ///分页
    @RequestMapping("querylist")
    @ResponseBody
    public HashMap<String,Object> querylist(Integer page, Integer rows, Polling polling ){
        return poillServices.querylist(page,rows,polling);
    }
     ///根据 id  查询 服务询图
    @RequestMapping("queryPollingId")
    @ResponseBody
    public  Polling queryPollingId(Polling polling){
        return poillServices.queryPollingId(polling.getId());
    }
    ///查询   图片
    @RequestMapping("getimg")
    @ResponseBody
    public List<Img> getimg(){
        return poillServices.getimg();
    }

    //上传图片
/*         ///插件  图片
         @RequestMapping("uploads")
         @ResponseBody
         public HashMap<String, String> upload(MultipartFile img, HttpServletRequest request) {
             HashMap<String, String> hashMap = new HashMap<>();
             String fileUpload = FileUtil.FileUpload(img, request);
             hashMap.put("img", fileUpload);
             System.out.println(hashMap);
             return hashMap;

         }*/
    ////查询  材料  类目
    @RequestMapping("getCL")
    @ResponseBody
    public List<Materialszl> getCL(){

        List<Materialszl>  list= poillServices.getCL();
        return list;
    }
  ///删除 材料  类目
    @RequestMapping("delCL")
    @ResponseBody
    public  int delCL(Materialszl materialszl){

    return  poillServices.delCL(materialszl.getId());
    }
    ///新增  材料
    @RequestMapping("insertMaterialszl")
    @ResponseBody
    public int insertMaterialszl(Materialszl materialszl){

       return  poillServices.insertMaterialszl(materialszl);
    }
}



