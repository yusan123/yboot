package com.yboot.common.common.constant;

/**
 * @author 田培融
 */
public interface SecurityConstant {

    /**
     * token分割
     */
    String TOKEN_SPLIT = "Bearer ";

    /**
     * JWT签名加密key
     */
    String JWT_SIGN_KEY = "Yboot";

    /**
     * token参数头
     */
    String HEADER = "accessToken";

    /**
     * 权限参数头
     */
    String AUTHORITIES = "authorities";

    /**
     * 用户选择JWT保存时间参数头
     */
    String SAVE_LOGIN = "saveLogin";

    /**
     * github保存state前缀key
     */
    String GITHUB_STATE = "YBoot_GITHUB:";

    /**
     * qq保存state前缀key
     */
    String QQ_STATE = "YBoot_QQ:";

    /**
     * qq保存state前缀key
     */
    String WEIBO_STATE = "YBoot_WEIBO:";

    /**
     * 交互token前缀key
     */
    String TOKEN_PRE = "YBoot_TOKEN_PRE:";

    /**
     * 用户token前缀key 单点登录使用
     */
    String USER_TOKEN = "YBoot_USER_TOKEN:";
}
