package com.yboot.base.modules.social.entity;

import com.yboot.common.base.YbootBaseEntity;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.MappedSuperclass;

/**
 * @author 田培融
 */
@Data
@MappedSuperclass
public class BaseSocialEntity extends YbootBaseEntity {

    @ApiModelProperty(value = "唯一id")
    private String openId;

    @ApiModelProperty(value = "用户名")
    private String username;

    @ApiModelProperty(value = "头像")
    private String avatar;

    @ApiModelProperty(value = "是否绑定账号 默认false")
    private Boolean isRelated = false;

    @ApiModelProperty(value = "绑定用户账号")
    private String relateUsername;
}
