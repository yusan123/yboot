package com.yboot.base.modules.base.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.yboot.common.base.YbootBaseEntity;
import io.swagger.annotations.ApiModel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author 田培融
 * @Date 2020/3/13 20:15
 * @EMail canghaihongxin@163.com
 **/
@Data
@Entity
@Table(name = "tx_tpr_acc")
@TableName("tx_tpr_acc")
@ApiModel(value = "部门")
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class TxAccount extends YbootBaseEntity {

    private Double money;

}
