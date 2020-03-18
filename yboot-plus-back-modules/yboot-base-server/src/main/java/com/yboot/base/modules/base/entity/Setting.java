package com.yboot.base.modules.base.entity;

import com.yboot.common.base.YbootBaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author 田培融
 */
@Data
@Entity
@Table(name = "t_setting")
@TableName("t_setting")
@ApiModel(value = "配置")
@NoArgsConstructor
public class Setting extends YbootBaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "配置值value")
    private String value;

    public Setting(String id){

        super.setId(id);
    }
}