package com.jk.service;

import com.jk.serviceplaapi.TzeServiceapi;
import org.springframework.cloud.openfeign.FeignClient;

@FeignClient(value = "cloudprovider")
public interface TzeService extends TzeServiceapi {

}
