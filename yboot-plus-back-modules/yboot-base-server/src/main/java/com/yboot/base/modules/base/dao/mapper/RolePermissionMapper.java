package com.yboot.base.modules.base.dao.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yboot.base.modules.base.entity.RolePermission;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author 田培融
 * @Date 2020/3/26 9:44
 * @EMail canghaihongxin@163.com
 **/
@Mapper
public interface RolePermissionMapper extends BaseMapper<RolePermission> {

    void insertBatch(List<RolePermission> list);
}
