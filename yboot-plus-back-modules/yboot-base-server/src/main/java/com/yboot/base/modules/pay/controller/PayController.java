package com.yboot.base.modules.pay.controller;

import cn.hutool.core.util.RandomUtil;
import com.lly835.bestpay.enums.BestPayTypeEnum;
import com.lly835.bestpay.model.PayResponse;
import com.yboot.base.modules.pay.service.IPayService;
import com.yboot.common.common.utils.ResultUtil;
import com.yboot.common.common.vo.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

/**
 * @author 田培融
 * @Date 2020/3/29 11:51
 * @EMail canghaihongxin@163.com
 **/
@RestController
@RequestMapping("/base/pay")
@Slf4j
public class PayController {

    @Autowired
    private IPayService payService;

    @GetMapping("/create")
    public Result<Map> create(@RequestParam("payType") BestPayTypeEnum bestPayTypeEnum){
        PayResponse payResponse = payService.create(RandomUtil.randomString(10), BigDecimal.valueOf(0.01),bestPayTypeEnum);

        Map<String,String > map = new HashMap();
        if (bestPayTypeEnum == BestPayTypeEnum.WXPAY_NATIVE){
            map.put("codeUrl",payResponse.getCodeUrl());
        }else if (bestPayTypeEnum == BestPayTypeEnum.ALIPAY_PC){
            map.put("body",payResponse.getBody());
        }
        return ResultUtil.data(map);
    }

    @PostMapping("/notify")
    public String  asyncNotify(@RequestBody String notifyData){
       return payService.asyncNotify(notifyData);
    }
}
