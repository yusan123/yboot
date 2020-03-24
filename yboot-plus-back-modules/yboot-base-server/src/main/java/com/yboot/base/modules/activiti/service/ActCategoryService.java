package com.yboot.base.modules.activiti.service;

import com.yboot.base.modules.activiti.dao.ActCategoryDao;
import com.yboot.common.base.YbootBaseService;
import com.yboot.base.modules.activiti.entity.ActCategory;
import org.checkerframework.checker.units.qual.A;

import java.util.List;

/**
 * 流程分类接口
 * @author 田培融
 */
public interface ActCategoryService extends YbootBaseService<ActCategoryDao,ActCategory, String> {

    /**
     * 通过父id获取
     * @param parentId
     * @return
     */
    List<ActCategory> findByParentIdOrderBySortOrder(String parentId);

    /**
     * 通过名称模糊搜索
     * @param title
     * @return
     */
    List<ActCategory> findByTitleLikeOrderBySortOrder(String title);
}