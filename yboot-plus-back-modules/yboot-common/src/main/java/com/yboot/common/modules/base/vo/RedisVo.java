package com.yboot.common.modules.base.vo;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * @author 田培融
 */
@Data
@AllArgsConstructor
public class RedisVo {

    private String key;

    private String value;

    private Long expireTime;
}
