package com.jk.service;

import com.jk.model.Material;
import com.jk.serviceplaapi.MeServiceApi;
import org.springframework.cloud.openfeign.FeignClient;

import java.util.List;
@FeignClient(value="cloudprovider")
public interface MaService extends MeServiceApi {

}
