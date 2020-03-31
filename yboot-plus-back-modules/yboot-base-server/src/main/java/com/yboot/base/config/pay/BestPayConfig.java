package com.yboot.base.config.pay;

import com.lly835.bestpay.config.AliPayConfig;
import com.lly835.bestpay.config.WxPayConfig;
import com.lly835.bestpay.service.BestPayService;
import com.lly835.bestpay.service.impl.BestPayServiceImpl;
import com.yboot.base.config.properties.PayProperties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

/**
 * @author 田培融
 * @Date 2020/3/29 16:03
 * @EMail canghaihongxin@163.com
 **/
@Component
public class BestPayConfig {

    @Autowired
    private PayProperties payProperties;
    @Bean
    public BestPayService bestPayService(WxPayConfig wxPayConfig){
        AliPayConfig aliPayConfig = new AliPayConfig();
        aliPayConfig.setAppId("");
        aliPayConfig.setPrivateKey("");
        aliPayConfig.setAliPayPublicKey("");
        aliPayConfig.setNotifyUrl("");
        aliPayConfig.setReturnUrl("");
        BestPayServiceImpl bestPayService = new BestPayServiceImpl();
        bestPayService.setWxPayConfig(wxPayConfig);
        bestPayService.setAliPayConfig(aliPayConfig);
        return bestPayService;
    }

    @Bean
    public WxPayConfig wxPayConfig(){
        WxPayConfig wxPayConfig = new WxPayConfig();
        wxPayConfig.setAppId(payProperties.getAppId());
        wxPayConfig.setMchId(payProperties.getMchId());
        wxPayConfig.setMchKey(payProperties.getMchKey());
        wxPayConfig.setNotifyUrl(payProperties.getReturnUrl());
        return wxPayConfig;
    }
}
