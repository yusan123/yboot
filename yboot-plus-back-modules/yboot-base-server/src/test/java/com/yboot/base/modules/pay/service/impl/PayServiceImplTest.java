package com.yboot.base.modules.pay.service.impl;

import com.lly835.bestpay.enums.BestPayTypeEnum;
import com.yboot.base.YBootBaseApplicationTest;
import com.yboot.base.modules.pay.service.IPayService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.math.BigDecimal;

/**
 * @author 田培融
 * @Date 2020/3/29 11:16
 * @EMail canghaihongxin@163.com
 **/
public class PayServiceImplTest extends YBootBaseApplicationTest {

    @Autowired
    private IPayService payService;

    @Test
    public void create() {
        payService.create("12345678987", BigDecimal.valueOf(0.01), BestPayTypeEnum.WXPAY_NATIVE);

    }
}