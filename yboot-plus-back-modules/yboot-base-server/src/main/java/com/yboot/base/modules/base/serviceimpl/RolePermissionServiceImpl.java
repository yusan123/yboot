package com.yboot.base.modules.base.serviceimpl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yboot.base.modules.base.dao.RolePermissionDao;
import com.yboot.base.modules.base.dao.mapper.RolePermissionMapper;
import com.yboot.base.modules.base.entity.RolePermission;
import com.yboot.base.modules.base.service.RolePermissionService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 角色权限接口实现
 * @author 田培融
 */
@Slf4j
@Service
@Transactional
public class RolePermissionServiceImpl implements RolePermissionService  {

    @Autowired
    private RolePermissionDao rolePermissionDao;

    @Autowired
    private RolePermissionMapper rolePermissionMapper;

    @Override
    public RolePermissionDao getRepository() {
        return rolePermissionDao;
    }

    @Override
    public List<RolePermission> findByPermissionId(String permissionId) {

        return rolePermissionDao.findByPermissionId(permissionId);
    }

    @Override
    public List<RolePermission> findByRoleId(String roleId) {

        return rolePermissionDao.findByRoleId(roleId);
    }

    @Override
    public void deleteByRoleId(String roleId) {

        rolePermissionDao.deleteByRoleId(roleId);
    }

    @Override
    public void insertBatch(List<RolePermission> list) {

        rolePermissionMapper.insertBatch(list);
    }


}