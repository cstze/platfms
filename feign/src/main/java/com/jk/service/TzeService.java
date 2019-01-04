package com.jk.service;

import com.jk.model.Figure;
import com.jk.model.Nav;
import com.jk.model.ProductBean;
import com.jk.model.TitleBean;
import com.jk.serviceplaapi.TzeServiceapi;
import org.springframework.cloud.openfeign.FeignClient;

import java.util.List;
import java.util.Map;

@FeignClient(value = "cloudprovider")
public interface TzeService extends TzeServiceapi {

}
