package com.jk.service;

import com.jk.serviceplaapi.OrderServiceApi;
import org.springframework.cloud.openfeign.FeignClient;

@FeignClient(value="cloudprovider")
public interface OrderService extends OrderServiceApi {
}
