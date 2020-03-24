package com.yboot.base.modules.base.service;

import com.yboot.base.modules.base.dao.RoleDepartmentDao;
import com.yboot.common.base.YbootBaseService;
import com.yboot.base.modules.base.entity.RoleDepartment;

import java.util.List;

/**
 * 角色部门接口
 * @author 田培融
 */
public interface RoleDepartmentService extends YbootBaseService<RoleDepartmentDao,RoleDepartment, String> {

    /**
     * 通过roleId获取
     * @param roleId
     * @return
     */
    List<RoleDepartment> findByRoleId(String roleId);

    /**
     * 通过角色id删除
     * @param roleId
     */
    void deleteByRoleId(String roleId);

    /**
     * 通过角色id删除
     * @param departmentId
     */
    void deleteByDepartmentId(String departmentId);
}