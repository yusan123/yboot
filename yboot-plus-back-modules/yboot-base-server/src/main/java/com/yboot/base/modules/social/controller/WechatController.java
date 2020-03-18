package com.yboot.base.modules.social.controller;

import cn.hutool.core.util.StrUtil;
import cn.hutool.http.HttpUtil;
import com.google.gson.Gson;
import com.yboot.base.common.utils.SecurityUtil;
import com.yboot.base.modules.social.entity.Wechat;
import com.yboot.base.modules.social.service.WechatService;
import com.yboot.base.modules.social.vo.AccessToken;
import com.yboot.base.modules.social.vo.WechatUserInfo;
import com.yboot.common.common.constant.CommonConstant;
import com.yboot.common.common.constant.SecurityConstant;
import com.yboot.common.common.utils.ResultUtil;
import com.yboot.common.common.vo.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

/**
 * https://developers.weixin.qq.com/doc/oplatform/Website_App/WeChat_Login/Wechat_Login.html
 * @author 田培融
 */
@Slf4j
@Api(description = "微信登录接口")
@RequestMapping("/base/social/wechat")
@Controller
public class WechatController {

    @Value("${base.social.wechat.appId}")
    private String appId;

    @Value("${base.social.wechat.appSecret}")
    private String appSecret;

    @Value("${base.social.wechat.callbackUrl}")
    private String callbackUrl;

    @Value("${base.social.callbackFeUrl}")
    private String callbackFeUrl;

    @Value("${base.social.callbackFeRelateUrl}")
    private String callbackFeRelateUrl;

    @Autowired
    private WechatService wechatService;

    @Autowired
    private SecurityUtil securityUtil;

    @Autowired
    private StringRedisTemplate redisTemplate;

    /**
     * 微信认证服务器地址
     */
    private static final String AUTHORIZE_URL = "https://open.weixin.qq.com/connect/qrconnect";

    /**
     * 申请令牌地址
     */
    private static final String ACCESS_TOKEN_URL = "https://api.weixin.qq.com/sns/oauth2/access_token";

    /**
     * 获取用户信息地址
     */
    private static final String GET_USERINFO_URL = "https://api.weixin.qq.com/sns/userinfo";

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    @ApiOperation(value = "获取wechat认证链接")
    @ResponseBody
    public Result<Object> login() throws UnsupportedEncodingException {

        // 生成并保存state 忽略该参数有可能导致CSRF攻击
        String state = String.valueOf(System.currentTimeMillis());
        redisTemplate.opsForValue().set(SecurityConstant.GITHUB_STATE + state, "VALID", 3L, TimeUnit.MINUTES);

        // 传递参数response_type、client_id、state、redirect_uri
        String url = AUTHORIZE_URL + "?appid=" + appId + "&redirect_uri=" + URLEncoder.encode(callbackUrl, "utf-8") + "&response_type=code" +
                "&scope=snsapi_login&state=" + state;

        return ResultUtil.data(url);
    }

    @RequestMapping(value = "/callback", method = RequestMethod.GET)
    @ApiOperation(value = "获取accessToken")
    public String getAccessToken(@RequestParam(required = false) String code,
                                 @RequestParam(required = false) String state) throws UnsupportedEncodingException {

        if(StrUtil.isBlank(code)){
            return "redirect:" + callbackFeUrl + "?error=" + URLEncoder.encode("您未同意授权","utf-8");
        }
        // 验证state
        String v = redisTemplate.opsForValue().get(SecurityConstant.GITHUB_STATE + state);
        redisTemplate.delete(SecurityConstant.GITHUB_STATE + state);
        if(StrUtil.isBlank(v)) {
            return "redirect:" + callbackFeUrl + "?error=" + URLEncoder.encode("授权超时或state不正确","utf-8");
        }

        // 传递参数grant_type、code、redirect_uri、appid、appsecret
        String accessTokenUrl = ACCESS_TOKEN_URL + "?appid=" + appId + "&secret=" + appSecret + "&code=" + code +
                "&grant_type=authorization_code";

        // 申请令牌
        String result = HttpUtil.get(accessTokenUrl);
        if(!result.contains("access_token")){
            return "redirect:" + callbackFeUrl + "?error=" + URLEncoder.encode("获取access_token失败","utf-8");
        }

        String accessToken = new Gson().fromJson(result, AccessToken.class).getAccess_token();
        String openId = new Gson().fromJson(result, AccessToken.class).getOpenid();
        // 获取用户信息
        String userInfo = HttpUtil.get(GET_USERINFO_URL + "?access_token=" + accessToken + "&openid=" + openId);
        WechatUserInfo wu = new Gson().fromJson(userInfo, WechatUserInfo.class);
        // 存入数据库
        Wechat wechat = wechatService.findByOpenId(wu.getOpenid());
        if(wechat==null){
            Wechat w = new Wechat();
            w.setOpenId(wu.getOpenid());
            w.setUsername(wu.getNickname());
            w.setAvatar(wu.getHeadimgurl());
            wechat = wechatService.save(w);
        }

        String url = "";
        // 判断是否绑定账号
        if(wechat.getIsRelated()&& StrUtil.isNotBlank(wechat.getRelateUsername())){
            // 已绑定 直接登录
            String JWT = securityUtil.getToken(wechat.getRelateUsername(), true);
            // 存入redis
            String JWTKey = UUID.randomUUID().toString().replace("-","");
            redisTemplate.opsForValue().set(JWTKey, JWT, 2L, TimeUnit.MINUTES);
            url = callbackFeUrl + "?related=1&JWTKey=" + JWTKey;
        }else{
            // 未绑定 Redis存入id
            String idToken = UUID.randomUUID().toString().replace("-","");
            redisTemplate.opsForValue().set(idToken, wechat.getId(), 5L, TimeUnit.MINUTES);
            url = callbackFeRelateUrl + "?socialType="+ CommonConstant.SOCIAL_TYPE_WECHAT +"&id=" + idToken;
        }
        return "redirect:" + url;
    }
}
