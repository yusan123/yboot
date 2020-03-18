package com.yboot.base.modules.social.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * @author 田培融
 */
@Data
@Entity
@Table(name = "t_weibo")
@TableName("t_weibo")
@ApiModel(value = "微博用户")
public class Weibo extends BaseSocialEntity {

    private static final long serialVersionUID = 1L;

}