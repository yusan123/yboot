package com.yboot.base.modules.activiti.service;

import com.yboot.base.modules.activiti.dao.ActModelDao;
import com.yboot.common.base.YbootBaseService;
import com.yboot.base.modules.activiti.entity.ActModel;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 * 模型管理接口
 * @author 田培融
 */
public interface ActModelService extends YbootBaseService<ActModelDao,ActModel, String> {

    /**
     * 多条件分页获取
     * @param actModel
     * @param pageable
     * @return
     */
    Page<ActModel> findByCondition(ActModel actModel, Pageable pageable);
}