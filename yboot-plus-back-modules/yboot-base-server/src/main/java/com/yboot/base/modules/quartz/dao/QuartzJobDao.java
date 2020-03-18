package com.yboot.base.modules.quartz.dao;

import com.yboot.common.base.YbootBaseDao;
import com.yboot.base.modules.quartz.entity.QuartzJob;

import java.util.List;

/**
 * 定时任务数据处理层
 * @author 田培融
 */
public interface QuartzJobDao extends YbootBaseDao<QuartzJob, String> {

    /**
     * 通过类名获取
     * @param jobClassName
     * @return
     */
    List<QuartzJob> findByJobClassName(String jobClassName);
}