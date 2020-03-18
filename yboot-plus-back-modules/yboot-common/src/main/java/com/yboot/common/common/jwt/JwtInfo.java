package com.yboot.common.common.jwt;

import lombok.Data;

/**
 * @author 田培融
 * @Date 2020/2/26 9:26
 * @EMail canghaihongxin@163.com
 **/
@Data
public class JwtInfo {

    /**
     * 加密算法
     */
    private String alg;

    /**
     * 密钥
     */
    private String value;
}
