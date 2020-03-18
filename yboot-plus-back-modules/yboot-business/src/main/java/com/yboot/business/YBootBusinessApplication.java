package com.yboot.business;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.cloud.stream.annotation.EnableBinding;
import org.springframework.cloud.stream.messaging.Source;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;

/**
 * @author 田培融
 * @Date 2020/3/6 11:19
 * @EMail canghaihongxin@163.com
 **/
@SpringBootApplication
@EnableDiscoveryClient
@EnableResourceServer
@ComponentScan({"com.yboot.business","com.yboot.common",})
@EnableFeignClients
@EnableBinding({Source.class})
public class YBootBusinessApplication {

    public static void main(String[] args) {
        SpringApplication.run(YBootBusinessApplication.class, args);
    }
}
