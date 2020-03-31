package com.yboot.base.modules.pay.service.impl;

import cn.hutool.core.util.IdUtil;
import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.lly835.bestpay.config.WxPayConfig;
import com.lly835.bestpay.enums.BestPayPlatformEnum;
import com.lly835.bestpay.enums.BestPayTypeEnum;
import com.lly835.bestpay.enums.OrderStatusEnum;
import com.lly835.bestpay.model.PayRequest;
import com.lly835.bestpay.model.PayResponse;
import com.lly835.bestpay.service.BestPayService;
import com.lly835.bestpay.service.impl.BestPayServiceImpl;
import com.yboot.base.common.utils.SecurityUtil;
import com.yboot.base.modules.base.entity.User;
import com.yboot.base.modules.pay.entity.PayInfo;
import com.yboot.base.modules.pay.enums.PayPlatformEnum;
import com.yboot.base.modules.pay.mapper.PayInfoMapper;
import com.yboot.base.modules.pay.service.IPayService;
import com.yboot.common.common.constant.CommonConstant;
import com.yboot.common.common.exception.YbootException;
import lombok.extern.slf4j.Slf4j;
import net.bytebuddy.asm.Advice;
import net.bytebuddy.implementation.bytecode.Throw;
import org.hibernate.procedure.spi.ParameterRegistrationImplementor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import java.math.BigDecimal;

/**
 * @author 田培融
 * @Date 2020/3/29 9:50
 * @EMail canghaihongxin@163.com
 **/
@Service
@Slf4j
public class PayServiceImpl implements IPayService {

    @Autowired
    private BestPayService bestPayService;

    @Autowired
    private SecurityUtil securityUtil;

    @Autowired
    private PayInfoMapper payInfoMapper;

    @Override
    public PayResponse create(String orderId, BigDecimal amount,BestPayTypeEnum payTypeEnum) {


        if (payTypeEnum != BestPayTypeEnum.WXPAY_NATIVE
            && payTypeEnum != BestPayTypeEnum.ALIPAY_PC){
            throw new YbootException("暂不支付的支付类型");
        }
        // 当业务订单重复时，删除原有订单
        QueryWrapper<PayInfo> queryWrapper= new QueryWrapper<>();
        queryWrapper.eq("order_id",orderId);
        queryWrapper.eq("del_flag", CommonConstant.STATUS_NORMAL);
        PayInfo payInfo1 = payInfoMapper.selectOne(queryWrapper);
        if (ObjectUtil.isNotEmpty(payInfo1)){
            if (payInfo1.getPlatformStatus().equals(OrderStatusEnum.SUCCESS.name())){
                throw new YbootException("订单已经支付，订单号为 = "+ payInfo1.getOrderId());
            }
            payInfo1.setDelFlag(CommonConstant.DEL_FLAG);
            payInfoMapper.updateById(payInfo1);
        }


        // 写入数据库
        User currUser = securityUtil.getCurrUser();
        String payOrderId = IdUtil.simpleUUID();
        PayInfo payInfo = PayInfo.builder().userId(currUser.getId()).orderId(orderId).payOrderId(payOrderId)
                .payPlatform(PayPlatformEnum.getByBestPayTypeEnum(payTypeEnum).getCode())
                .platformStatus(OrderStatusEnum.NOTPAY.name())
                .platformAmount(amount).build();
        payInfoMapper.insert(payInfo);

        PayRequest request = new PayRequest();
        request.setOrderName("测试支付");
        request.setOrderId(payOrderId);
        request.setOrderAmount(amount.doubleValue());
        request.setPayTypeEnum(payTypeEnum);
        PayResponse pay = bestPayService.pay(request);

        log.info("response = {}",pay);
        return pay;
    }

    /**
     * 异步通知处理
     * @param notifyData 微信官方支付 返回的消息
     */
    @Override
    public String asyncNotify(String notifyData) {
        // 签名校验
        PayResponse payResponse = bestPayService.asyncNotify(notifyData);
        log.info("payResponse =  {}" ,payResponse);

        // 在数据库中取数据，校验金额
        QueryWrapper<PayInfo> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("pay_order_id",payResponse.getOrderId());
        queryWrapper.eq("del_flag", CommonConstant.STATUS_NORMAL);
        PayInfo payInfo = payInfoMapper.selectOne(queryWrapper);

        if (payInfo == null) {
            //告警
            throw new RuntimeException("通过orderNo查询到的结果是null");
        }

        //如果订单支付状态不是"已支付"         // 修改订单支付状态
        if (!payInfo.getPlatformStatus().equals(OrderStatusEnum.SUCCESS.name())) {
            //Double类型比较大小，精度。1.00  1.0
            if (payInfo.getPlatformAmount().compareTo(BigDecimal.valueOf(payResponse.getOrderAmount())) != 0) {
                //告警
                throw new YbootException("异步通知中的金额和数据库里的不一致，orderNo=" + payResponse.getOrderId());
            }

            //3. 修改订单支付状态
            payInfo.setPlatformStatus(OrderStatusEnum.SUCCESS.name());
            payInfo.setPlatformNumber(payResponse.getOutTradeNo());
            payInfoMapper.updateById(payInfo);
        }

        //给业务系统发送消息，可以为MQ
        // 给微信返回收到通知
        if (payResponse.getPayPlatformEnum() == BestPayPlatformEnum.WX){
            return "<xml>\n" +
                    "  <return_code><![CDATA[SUCCESS]]></return_code>\n" +
                    "  <return_msg><![CDATA[OK]]></return_msg>\n" +
                    "</xml>";
        }else if (payResponse.getPayPlatformEnum() == BestPayPlatformEnum.ALIPAY){
            return "success";
        }

        throw  new YbootException("错误的支付平台异步回调");
    }


}
