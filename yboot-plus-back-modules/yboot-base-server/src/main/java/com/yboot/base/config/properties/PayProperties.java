package com.yboot.base.config.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * @author 田培融
 * @Date 2020/3/31 8:38
 * @EMail canghaihongxin@163.com
 **/
@ConfigurationProperties("wx")
@Component
@Data
public class PayProperties {

    private String appId;
    private String mchId;
    private String mchKey;
    private String returnUrl;
}
