package com.yboot.base.modules.activiti.service.mybatis;

import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 田培融
 */
public interface IRunIdentityService {

    /**
     * 多条件查询
     * @param taskId
     * @param type
     * @return
     */
    List<String> selectByConditions(@Param("taskId") String taskId, @Param("type") String type);
}
