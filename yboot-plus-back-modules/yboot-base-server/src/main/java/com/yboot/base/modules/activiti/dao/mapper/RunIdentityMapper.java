package com.yboot.base.modules.activiti.dao.mapper;

import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 田培融
 */
public interface RunIdentityMapper {

    /**
     * 多条件查询
     * @param taskId
     * @param type
     * @return
     */
    List<String> selectByConditions(@Param("taskId") String taskId, @Param("type") String type);
}
