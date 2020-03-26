package com.yboot.base.modules.base.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.yboot.base.modules.base.dao.RolePermissionDao;
import com.yboot.common.base.YbootBaseService;
import com.yboot.base.modules.base.entity.RolePermission;

import java.util.List;

/**
 * 角色权限接口
 * @author 田培融
 */
public interface RolePermissionService extends YbootBaseService<RolePermissionDao,RolePermission, String>{

    /**
     * 通过permissionId获取
     * @param permissionId
     * @return
     */
    List<RolePermission> findByPermissionId(String permissionId);

    /**
     * 通过roleId获取
     * @param roleId
     * @return
     */
    List<RolePermission> findByRoleId(String roleId);

    /**
     * 通过roleId删除
     * @param roleId
     */
    void deleteByRoleId(String roleId);

    void insertBatch(List<RolePermission> list);

}