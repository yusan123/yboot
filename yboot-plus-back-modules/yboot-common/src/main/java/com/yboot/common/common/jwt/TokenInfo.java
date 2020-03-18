package com.yboot.common.common.jwt;

import lombok.Data;

import java.util.Date;

/**
 * @author 田培融
 * @Date 2020/2/24 20:54
 * @EMail canghaihongxin@163.com
 **/
@Data
public class TokenInfo {

    /**
     * 令牌是否可用
     */
    private Boolean active;

    /**
     * 哪一个客户端申请的令牌
     */
    private String client_id;

    /**
     * 令牌对应的范围 代表此客户端申请的令牌使用的范围
     */
    private String[] scope;

    /**
     * 令牌对应的用户名称
     */
    private String user_name;

    /**
     * 此令牌可以访问资源服务器的ID
     */
    private String[] aud;

    /**
     * 令牌过期时间
     */
    private Date exp;


    /**
     * 当前令牌代表用户所对应的权限，此处和SCOPE是不一样的。这里对应的是用户
     */
    private String[] authorities;


}
