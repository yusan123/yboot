package com.yboot.base.modules.base.service;


import com.yboot.common.base.YbootBaseService;
import com.yboot.base.modules.base.entity.Role;

import java.util.List;

/**
 * 角色接口
 * @author 田培融
 */
public interface RoleService extends YbootBaseService<Role, String> {

    /**
     * 获取默认角色
     * @param defaultRole
     * @return
     */
    List<Role> findByDefaultRole(Boolean defaultRole);
}
