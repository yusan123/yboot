package com.yboot.base.modules.open.entity;

import com.yboot.common.base.YbootBaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author 田培融
 */
@Data
@Entity
@Table(name = "t_client")
@TableName("t_client")
@ApiModel(value = "第三方网站client信息")
public class Client extends YbootBaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "网站名称")
    private String name;

    @ApiModelProperty(value = "秘钥")
    private String clientSecret;

    @ApiModelProperty(value = "网站主页")
    private String homeUri;

    @ApiModelProperty(value = "成功授权后的回调地址")
    private String redirectUri;
}