package com.yboot.gateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.context.annotation.ComponentScan;

@EnableDiscoveryClient
@SpringBootApplication(exclude = DataSourceAutoConfiguration.class)
@ComponentScan({"com.yboot.gateway","com.yboot.common.common.jwt",})
public class YBootGatewayApplication {

    public static void main(String[] args) {
        SpringApplication.run(YBootGatewayApplication.class, args);
    }
}
