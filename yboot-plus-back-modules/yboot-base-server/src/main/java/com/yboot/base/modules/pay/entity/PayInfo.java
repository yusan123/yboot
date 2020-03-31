package com.yboot.base.modules.pay.entity;

import com.yboot.common.base.YbootBaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModelProperty;
import io.swagger.annotations.ApiModel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.Table;
import java.math.BigDecimal;

/**
 * @author 田培融
 */
@Data
@Entity
@Table(name = "t_pay_info")
@TableName("t_pay_info")
@ApiModel(value = "测试")
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class PayInfo extends YbootBaseEntity {

    private static final long serialVersionUID = 1L;

    private String userId;

    @ApiModelProperty("业务订单ID")
    private String orderId;

    private Integer payPlatform;

    private String platformNumber;

    private String  platformStatus;

    private BigDecimal platformAmount;

    @ApiModelProperty("支付订单ID ")
    private String payOrderId;



}