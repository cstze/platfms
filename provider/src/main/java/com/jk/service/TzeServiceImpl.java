package com.jk.service;

import com.jk.mapper.TzeMapper;
import com.jk.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

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

    @Override
    public void saveFigure(Figure figures) {
        tzeMapper.saveFigure(figures);
    }

    @Override
    public void savetpf( TitleBean titleBeans, ProductBean productBeans, Figure figures) {
        String ids = productBeans.getProductId();
        titleBeans.settId(ids);
        tzeMapper.saveTitleBean(titleBeans);
        tzeMapper.saveProductBean(productBeans);
        figures.setFigureid(ids);
        tzeMapper.saveFigures(figures);
    }


    @Override
    public void savetfEnquiry(TitleBean title, ProductBean product, Enquiry enquiry) {
        String id = enquiry.getEnquiryId();
        tzeMapper.saveEnquiry(enquiry);
        title.settId(id);
        tzeMapper.saveTitle(title);
        product.setProductId(id);
        tzeMapper.saveProduct(product);
    }

    @Override
    public List<Nav> findNva() {
        String id="0";
        List<Nav> nodes = getNodes(id);
        return nodes;
    }
    private List<Nav> getNodes(String id) {
        List<Nav> trees=tzeMapper.getNodes(id);
        for (Nav tree : trees) {
            List<Nav> nodes = getNodes(tree.getId());
            if(nodes!=null && nodes.size()>0) {
                tree.setLeaf(false);
                tree.setSelectable(false);
                tree.setNodes(nodes);
            }else {
                tree.setLeaf(true);
                tree.setSelectable(true);
            }
        }
        return trees;
    }
//递归树

}
