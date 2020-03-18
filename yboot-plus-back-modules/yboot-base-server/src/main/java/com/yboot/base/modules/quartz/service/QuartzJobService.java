package com.yboot.base.modules.quartz.service;

import com.yboot.common.base.YbootBaseService;
import com.yboot.base.modules.quartz.entity.QuartzJob;

import java.util.List;

/**
 * 定时任务接口
 * @author 田培融
 */
public interface QuartzJobService extends YbootBaseService<QuartzJob, String> {

    /**
     * 通过类名获取
     * @param jobClassName
     * @return
     */
    List<QuartzJob> findByJobClassName(String jobClassName);
}