package com.yboot.base.modules.social.controller;

import cn.hutool.core.util.StrUtil;
import com.yboot.base.common.utils.SecurityUtil;
import com.yboot.base.modules.base.entity.User;
import com.yboot.base.modules.base.service.UserService;
import com.yboot.base.modules.social.entity.Github;
import com.yboot.base.modules.social.entity.QQ;
import com.yboot.base.modules.social.entity.Wechat;
import com.yboot.base.modules.social.entity.Weibo;
import com.yboot.base.modules.social.service.GithubService;
import com.yboot.base.modules.social.service.QQService;
import com.yboot.base.modules.social.service.WechatService;
import com.yboot.base.modules.social.service.WeiboService;
import com.yboot.common.common.constant.CommonConstant;
import com.yboot.common.common.utils.ResultUtil;
import com.yboot.common.common.vo.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.UUID;
import java.util.concurrent.TimeUnit;

/**
 * @author 田培融
 */
@Slf4j
@Api(description = "绑定第三方账号接口")
@RequestMapping("/base/social")
@RestController
@Transactional
public class RelateController {

    @Autowired
    private UserService userService;

    @Autowired
    private GithubService githubService;

    @Autowired
    private QQService qqService;

    @Autowired
    private WeiboService weiboService;

    @Autowired
    private WechatService wechatService;

    @Autowired
    private SecurityUtil securityUtil;

    @Autowired
    private StringRedisTemplate redisTemplate;

    @RequestMapping(value = "/relate", method = RequestMethod.POST)
    @ApiOperation(value = "绑定账号")
    public Result<Object> relate(@RequestParam Boolean isLogin,
                                 @RequestParam(required = false) String username,
                                 @RequestParam(required = false) String password,
                                 @RequestParam Integer socialType,
                                 @RequestParam String id){

        if(isLogin){
            // 用户已登录
            User user = securityUtil.getCurrUser();
            username = user.getUsername();
        }else{
            // 用户未登录
            if(StrUtil.isBlank(username)|| StrUtil.isBlank(password)){
                return ResultUtil.error("用户名或密码不能为空");
            }
            User user = userService.findByUsername(username);
            if(user==null){
                return ResultUtil.error("账号不存在");
            }
            if(!new BCryptPasswordEncoder().matches(password, user.getPassword())){
                return ResultUtil.error("密码不正确");
            }
        }

        // 从redis中获取表id
        String ID = redisTemplate.opsForValue().get(id);
        if(StrUtil.isBlank(ID)){
            return ResultUtil.error("无效的id");
        }
        // 绑定github
        if(CommonConstant.SOCIAL_TYPE_GITHUB.equals(socialType)){
            Github g = githubService.findByRelateUsername(username);
            if(g!=null){
                return ResultUtil.error("该账户已绑定有Github账号，请先进行解绑操作");
            }
            Github github = githubService.get(ID);
            if(github==null){
                return ResultUtil.error("绑定失败，请先进行第三方授权认证");
            }
            if(github.getIsRelated()&& StrUtil.isNotBlank(github.getRelateUsername())){
                return ResultUtil.error("该Github账号已绑定有用户，请先进行解绑操作");
            }
            github.setIsRelated(true);
            github.setRelateUsername(username);
            githubService.update(github);
        }else if(CommonConstant.SOCIAL_TYPE_QQ.equals(socialType)){
            QQ q = qqService.findByRelateUsername(username);
            if(q!=null){
                return ResultUtil.error("该账户已绑定有QQ账号，请先进行解绑操作");
            }
            QQ qq = qqService.get(ID);
            if(qq==null){
                return ResultUtil.error("绑定失败，请先进行第三方授权认证");
            }
            if(qq.getIsRelated()&& StrUtil.isNotBlank(qq.getRelateUsername())){
                return ResultUtil.error("该QQ账号已绑定有用户，请先进行解绑操作");
            }
            qq.setIsRelated(true);
            qq.setRelateUsername(username);
            qqService.update(qq);
        }else if(CommonConstant.SOCIAL_TYPE_WEIBO.equals(socialType)){
            Weibo w = weiboService.findByRelateUsername(username);
            if(w!=null){
                return ResultUtil.error("该账户已绑定有微博账号，请先进行解绑操作");
            }
            Weibo weibo = weiboService.get(ID);
            if(weibo==null){
                return ResultUtil.error("绑定失败，请先进行第三方授权认证");
            }
            if(weibo.getIsRelated()&& StrUtil.isNotBlank(weibo.getRelateUsername())){
                return ResultUtil.error("该微博账号已绑定有用户，请先进行解绑操作");
            }
            weibo.setIsRelated(true);
            weibo.setRelateUsername(username);
            weiboService.update(weibo);
        }else if(CommonConstant.SOCIAL_TYPE_WECHAT.equals(socialType)){
            Wechat w = wechatService.findByRelateUsername(username);
            if(w!=null){
                return ResultUtil.error("该账户已绑定有微信账号，请先进行解绑操作");
            }
            Wechat wechat = wechatService.get(ID);
            if(wechat==null){
                return ResultUtil.error("绑定失败，请先进行第三方授权认证");
            }
            if(wechat.getIsRelated()&& StrUtil.isNotBlank(wechat.getRelateUsername())){
                return ResultUtil.error("该微信账号已绑定有用户，请先进行解绑操作");
            }
            wechat.setIsRelated(true);
            wechat.setRelateUsername(username);
            wechatService.update(wechat);
        }
        // 绑定成功删除缓存
        redisTemplate.delete("relate::relatedInfo:" + username);
        if(!isLogin){
            String JWT = securityUtil.getToken(username, true);
            // 存入redis
            String JWTKey = UUID.randomUUID().toString().replace("-","");
            redisTemplate.opsForValue().set(JWTKey, JWT, 2L, TimeUnit.MINUTES);
            return ResultUtil.data(JWTKey);
        } else {
            return ResultUtil.data("绑定成功");
        }
    }

    @RequestMapping(value = "/getJWT", method = RequestMethod.GET)
    @ApiOperation(value = "获取JWT")
    public Result<Object> getJWT(@RequestParam String JWTKey){

        String JWT = redisTemplate.opsForValue().get(JWTKey);
        if(StrUtil.isBlank(JWT)){
            return ResultUtil.error("获取JWT失败");
        }
        return ResultUtil.data(JWT);
    }
}
