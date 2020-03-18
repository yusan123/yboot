package com.yboot.base.modules.activiti.dao.mapper;

import org.apache.ibatis.annotations.Param;

/**
 * @author 田培融
 */
public interface ActMapper {

    /**
     * 删除关联业务表
     * @param table
     * @param id
     * @return
     */
    Integer deleteBusiness(@Param("table") String table, @Param("id") String id);
}
