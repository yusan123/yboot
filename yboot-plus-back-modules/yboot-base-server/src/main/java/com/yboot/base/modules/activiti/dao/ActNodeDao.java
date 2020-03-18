package com.yboot.base.modules.activiti.dao;

import com.yboot.common.base.YbootBaseDao;
import com.yboot.base.modules.activiti.entity.ActNode;

import java.util.List;

/**
 * 流程节点用户数据处理层
 * @author 田培融
 */
public interface ActNodeDao extends YbootBaseDao<ActNode, String> {

    /**
     * 通过nodeId获取
     * @param nodeId
     * @param type
     * @return
     */
    List<ActNode> findByNodeIdAndType(String nodeId, Integer type);

    /**
     * 通过nodeId删除
     * @param nodeId
     */
    void deleteByNodeId(String nodeId);

    /**
     * 通过relateId删除
     * @param relateId
     */
    void deleteByRelateId(String relateId);
}