package com.yboot.base.modules.activiti.service;

import com.yboot.base.modules.activiti.dao.ActBusinessDao;
import com.yboot.common.base.YbootBaseService;
import com.yboot.common.common.vo.SearchVo;
import com.yboot.base.modules.activiti.entity.ActBusiness;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * 业务申请接口
 * @author 田培融
 */
public interface ActBusinessService extends YbootBaseService<ActBusinessDao,ActBusiness, String> {

    /**
     * 多条件分页获取申请列表
     * @param actBusiness
     * @param searchVo
     * @param pageable
     * @return
     */
    Page<ActBusiness> findByCondition(ActBusiness actBusiness, SearchVo searchVo, Pageable pageable);

    /**
     * 通过流程定义id获取
     * @param procDefId
     * @return
     */
    List<ActBusiness> findByProcDefId(String procDefId);
}