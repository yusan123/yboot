package com.yboot.base.modules.activiti.service.mybatis;

/**
 * @author 田培融
 */
public interface IActService {

    /**
     * 删除关联业务表
     * @param table
     * @param id
     * @return
     */
    Integer deleteBusiness(String table, String id);
}
