package com.yboot.base.modules.base.service;


import com.yboot.common.base.YbootBaseService;
import com.yboot.base.modules.base.entity.User;
import com.yboot.base.modules.base.entity.UserRole;

import java.util.List;

/**
 * 用户角色接口
 * @author 田培融
 */
public interface UserRoleService extends YbootBaseService<UserRole, String> {

    /**
     * 通过roleId查找
     * @param roleId
     * @return
     */
    List<UserRole> findByRoleId(String roleId);

    /**
     * 通过roleId查找用户
     * @param roleId
     * @return
     */
    List<User> findUserByRoleId(String roleId);

    /**
     * 删除用户角色
     * @param userId
     */
    void deleteByUserId(String userId);
}
