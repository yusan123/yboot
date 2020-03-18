package com.yboot.base.modules.social.dao;

import com.yboot.common.base.YbootBaseDao;
import com.yboot.base.modules.social.entity.Github;

/**
 * Github登录数据处理层
 * @author 田培融
 */
public interface GithubDao extends YbootBaseDao<Github, String> {

    /**
     * 通过openId获取
     * @param openId
     * @return
     */
    Github findByOpenId(String openId);

    /**
     * 通过username获取
     * @param username
     * @return
     */
    Github findByRelateUsername(String username);

    /**
     * 通过username删除
     * @param username
     */
    void deleteByUsername(String username);
}