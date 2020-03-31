package com.yboot.base.modules.pay.service;

import com.lly835.bestpay.enums.BestPayTypeEnum;
import com.lly835.bestpay.model.PayResponse;

import java.math.BigDecimal;

/**
 * @author 田培融
 * @Date 2020/3/29 9:47
 * @EMail canghaihongxin@163.com
 **/
public interface IPayService {

    /**
     * 创建/发起支付
     */
    PayResponse create(String orderId, BigDecimal amount, BestPayTypeEnum bestPayTypeEnum);

    /**
     * 异步通知处理
     * @param notifyData 微信官方支付 返回的消息
     */
    String asyncNotify(String notifyData);
}
