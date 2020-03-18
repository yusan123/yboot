package com.yboot.base.modules.activiti.serviceimpl.mybatis;

import com.yboot.common.common.exception.XbootException;
import com.yboot.base.modules.activiti.dao.mapper.ActMapper;
import com.yboot.base.modules.activiti.service.mybatis.IActService;
import cn.hutool.core.util.StrUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author 田培融
 */
@Service
public class IActServiceImpl implements IActService {

    @Autowired
    private ActMapper actMapper;

    @Override
    public Integer deleteBusiness(String table, String id) {

        if(StrUtil.isBlank(table)|| StrUtil.isBlank(id)){
            throw new XbootException("关联业务表名或id为空");
        }
        return actMapper.deleteBusiness(table, id);
    }
}
