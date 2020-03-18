package com.yboot.business.controller;

import com.yboot.business.client.BaseTestClient;
import com.yboot.business.entity.content.TxOrder;
import com.yboot.business.service.TxOrderService;
import com.yboot.common.common.utils.ResultUtil;
import com.yboot.common.common.vo.Result;
import org.apache.rocketmq.spring.support.RocketMQHeaders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.stream.messaging.Source;
import org.springframework.messaging.support.MessageBuilder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.UUID;

/**
 * @author 田培融
 * @Date 2020/3/6 15:41
 * @EMail canghaihongxin@163.com
 **/
@RestController
@RequestMapping("/business/test")
public class TestController {

    @Autowired
    private  Source source;

    @Autowired
    private BaseTestClient baseTestClient;

    @Autowired
    private TxOrderService txOrderService;

    @GetMapping("/hello")
    public Result<Object> hello(){
        return ResultUtil.data(baseTestClient.test1());
    }

    @GetMapping("/rocketMQTransaction")
    public Result<Object> rocketMQTransaction(){
        String transactionId = UUID.randomUUID().toString();
        this.source.output().send(
                MessageBuilder.withPayload(
                        TxOrder.builder().status("1").build()
                )
                .setHeader(RocketMQHeaders.TRANSACTION_ID, transactionId)
                .build()
        );
        return ResultUtil.data(transactionId);
    }
    @GetMapping("/seataHello")
    public Result<Object> seataHello(){
        TxOrder  txOrder =  txOrderService.saveOrderForTCC();
        return ResultUtil.data(txOrder);
    }

}
