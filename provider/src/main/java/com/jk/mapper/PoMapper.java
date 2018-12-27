package com.jk.mapper;



import com.jk.model.Img;
import com.jk.model.Materialszl;
import com.jk.model.Polling;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PoMapper {

    List<Img> getimg();

    //当前数据
    List<Polling> querylist(@Param("page") Integer page, @Param("rows") Integer rows, @Param("p") Polling polling);
    //总条数
    int getcount(@Param("p") Polling polling);

    List<Materialszl> getCL();

    int delCL(@Param("id") String id);

    int insertMaterialszl(Materialszl materialszl);

    Polling queryPollingId(@Param("id") Integer id);
}
