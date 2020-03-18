package com.yboot.base.modules.social.serviceimpl;

import com.yboot.common.common.vo.SearchVo;
import com.yboot.base.modules.social.dao.WechatDao;
import com.yboot.base.modules.social.entity.Wechat;
import com.yboot.base.modules.social.service.WechatService;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Github登录接口实现
 * @author 田培融
 */
@Slf4j
@Service
@Transactional
public class WechatServiceImpl implements WechatService {

    @Autowired
    private WechatDao wechatDao;

    @Override
    public WechatDao getRepository() {
        return wechatDao;
    }

    @Override
    public Wechat findByOpenId(String openId) {

        return wechatDao.findByOpenId(openId);
    }

    @Override
    public Wechat findByRelateUsername(String username) {

        return wechatDao.findByRelateUsername(username);
    }

    @Override
    public Page<Wechat> findByCondition(String username, String relateUsername, SearchVo searchVo, Pageable pageable) {

        return wechatDao.findAll(new Specification<Wechat>() {
            @Nullable
            @Override
            public Predicate toPredicate(Root<Wechat> root, CriteriaQuery<?> cq, CriteriaBuilder cb) {

                Path<String> usernameField = root.get("username");
                Path<String> relateUsernameField = root.get("relateUsername");
                Path<Date> createTimeField=root.get("createTime");

                List<Predicate> list = new ArrayList<Predicate>();

                if(StrUtil.isNotBlank(username)){
                    list.add(cb.like(usernameField,'%'+ username + '%'));
                }
                if(StrUtil.isNotBlank(relateUsername)){
                    list.add(cb.like(relateUsernameField,'%'+ relateUsername + '%'));
                }
                //创建时间
                if(StrUtil.isNotBlank(searchVo.getStartDate())&& StrUtil.isNotBlank(searchVo.getEndDate())){
                    Date start = DateUtil.parse(searchVo.getStartDate());
                    Date end = DateUtil.parse(searchVo.getEndDate());
                    list.add(cb.between(createTimeField, start, DateUtil.endOfDay(end)));
                }

                Predicate[] arr = new Predicate[list.size()];
                cq.where(list.toArray(arr));
                return null;
            }
        }, pageable);
    }

    @Override
    public void deleteByUsername(String username) {

        wechatDao.deleteByUsername(username);
    }
}