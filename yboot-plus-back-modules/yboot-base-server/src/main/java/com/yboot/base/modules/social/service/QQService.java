package com.yboot.base.modules.social.service;

import com.yboot.base.modules.social.dao.QQDao;
import com.yboot.common.base.YbootBaseService;
import com.yboot.common.common.vo.SearchVo;
import com.yboot.base.modules.social.entity.QQ;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 * qq登录接口
 * @author 田培融
 */
public interface QQService extends YbootBaseService<QQDao,QQ, String> {

    /**
     * 通过openId获取
     * @param openId
     * @return
     */
    QQ findByOpenId(String openId);

    /**
     * 通过username获取
     * @param username
     * @return
     */
    QQ findByRelateUsername(String username);

    /**
     * 分页多条件获取
     * @param username
     * @param relateUsername
     * @param searchVo
     * @param pageable
     * @return
     */
    Page<QQ> findByCondition(String username, String relateUsername, SearchVo searchVo, Pageable pageable);

    /**
     * 通过username删除
     * @param username
     */
    void deleteByUsername(String username);
}