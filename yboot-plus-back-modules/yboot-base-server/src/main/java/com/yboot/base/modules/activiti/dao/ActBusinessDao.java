package com.yboot.base.modules.activiti.dao;

import com.yboot.common.base.YbootBaseDao;
import com.yboot.base.modules.activiti.entity.ActBusiness;

import java.util.List;

/**
 * 申请业务数据处理层
 * @author 田培融
 */
public interface ActBusinessDao extends YbootBaseDao<ActBusiness, String> {

    /**
     * 通过流程定义id获取
     * @param procDefId
     * @return
     */
    List<ActBusiness> findByProcDefId(String procDefId);
}