package com.yboot.base.modules.base.dao;

import com.yboot.common.base.YbootBaseDao;
import com.yboot.base.modules.base.entity.RolePermission;

import java.util.List;

/**
 * 角色权限数据处理层
 * @author 田培融
 */
public interface RolePermissionDao extends YbootBaseDao<RolePermission, String> {

    /**
     * 通过permissionId获取
     * @param permissionId
     * @return
     */
    List<RolePermission> findByPermissionId(String permissionId);

    /**
     * 通过roleId获取
     * @param roleId
     */
    List<RolePermission> findByRoleId(String roleId);

    /**
     * 通过roleId删除
     * @param roleId
     */
    void deleteByRoleId(String roleId);
}