package com.yboot.base.modules.activiti.dao;

import com.yboot.common.base.YbootBaseDao;
import com.yboot.base.modules.activiti.entity.ActCategory;

import java.util.List;

/**
 * 流程分类数据处理层
 * @author 田培融
 */
public interface ActCategoryDao extends YbootBaseDao<ActCategory, String> {

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