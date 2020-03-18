package com.yboot.base.modules.social.controller;

import com.yboot.common.common.constant.CommonConstant;
import com.yboot.common.common.utils.PageUtil;
import com.yboot.common.common.utils.ResultUtil;
import com.yboot.common.common.vo.PageVo;
import com.yboot.common.common.vo.Result;
import com.yboot.common.common.vo.SearchVo;
import com.yboot.base.modules.social.entity.Github;
import com.yboot.base.modules.social.entity.QQ;
import com.yboot.base.modules.social.entity.Wechat;
import com.yboot.base.modules.social.entity.Weibo;
import com.yboot.base.modules.social.service.GithubService;
import com.yboot.base.modules.social.service.QQService;
import com.yboot.base.modules.social.service.WechatService;
import com.yboot.base.modules.social.service.WeiboService;
import com.yboot.base.modules.social.vo.RelateUserInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Page;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

/**
 * @author 田培融
 */
@Slf4j
@RestController
@Api(description = "社交账号接口")
@RequestMapping("/base/relate")
@CacheConfig(cacheNames = "relate")
@Transactional
public class SocialController {

    @Autowired
    private GithubService githubService;

    @Autowired
    private QQService qqService;

    @Autowired
    private WeiboService weiboService;

    @Autowired
    private WechatService wechatService;

    @Autowired
    private StringRedisTemplate redisTemplate;

    @RequestMapping(value = "/getRelatedInfo/{username}", method = RequestMethod.GET)
    @ApiOperation(value = "获取绑定账号信息")
    @Cacheable(key = "'relatedInfo:'+#username")
    public Result<RelateUserInfo> getRelateUserInfo(@PathVariable String username){

        RelateUserInfo r = new RelateUserInfo();
        Github g = githubService.findByRelateUsername(username);
        if(g!=null){
            r.setGithubId(g.getId());
            r.setGithub(g.getIsRelated());
            r.setGithubUsername(g.getUsername());
        }
        QQ q = qqService.findByRelateUsername(username);
        if(q!=null){
            r.setQqId(q.getId());
            r.setQq(q.getIsRelated());
            r.setQqUsername(q.getUsername());
        }
        Weibo w = weiboService.findByRelateUsername(username);
        if(w!=null){
            r.setWeiboId(w.getId());
            r.setWeibo(w.getIsRelated());
            r.setWeiboUsername(w.getUsername());
        }
        Wechat wechat = wechatService.findByRelateUsername(username);
        if(wechat!=null){
            r.setWechatId(wechat.getId());
            r.setWechat(wechat.getIsRelated());
            r.setWechatUsername(wechat.getUsername());
        }
        return new ResultUtil<RelateUserInfo>().setData(r);
    }

    @RequestMapping(value = "/delByIds", method = RequestMethod.POST)
    @ApiOperation(value = "解绑")
    public Result<Object> delByIds(@RequestParam String[] ids,
                                   @RequestParam String[] usernames,
                                   @RequestParam Integer socialType){

        for(String id : ids){
            if(CommonConstant.SOCIAL_TYPE_GITHUB.equals(socialType)){
                githubService.delete(id);
            }else if(CommonConstant.SOCIAL_TYPE_QQ.equals(socialType)){
                qqService.delete(id);
            }else if(CommonConstant.SOCIAL_TYPE_WEIBO.equals(socialType)){
                weiboService.delete(id);
            } else if(CommonConstant.SOCIAL_TYPE_WECHAT.equals(socialType)){
                wechatService.delete(id);
            }
        }
        // 删除缓存
        for(String username : usernames){
            redisTemplate.delete("relate::relatedInfo:" + username);
        }
        return ResultUtil.success("解绑成功");
    }

    @RequestMapping(value = "/findByCondition", method = RequestMethod.GET)
    @ApiOperation(value = "多条件分页获取")
    public Result<Object> delByIds(@RequestParam(required = false) String username,
                                   @RequestParam(required = false) String relateUsername,
                                   @RequestParam Integer socialType,
                                   SearchVo searchVo,
                                   PageVo pv){

        if(CommonConstant.SOCIAL_TYPE_GITHUB.equals(socialType)){
            Page<Github> githubPage = githubService.findByCondition(username, relateUsername, searchVo, PageUtil.initPage(pv));
            return ResultUtil.data(githubPage);
        }else if(CommonConstant.SOCIAL_TYPE_QQ.equals(socialType)){
            Page<QQ> qqPage = qqService.findByCondition(username, relateUsername, searchVo, PageUtil.initPage(pv));
            return ResultUtil.data(qqPage);
        }else if(CommonConstant.SOCIAL_TYPE_WEIBO.equals(socialType)){
            Page<Weibo> weiboPage = weiboService.findByCondition(username, relateUsername, searchVo, PageUtil.initPage(pv));
            return ResultUtil.data(weiboPage);
        }else if(CommonConstant.SOCIAL_TYPE_WECHAT.equals(socialType)){
            Page<Wechat> wechatPage = wechatService.findByCondition(username, relateUsername, searchVo, PageUtil.initPage(pv));
            return ResultUtil.data(wechatPage);
        }
        return ResultUtil.error("获取第三方绑定账号信息失败");
    }
}
