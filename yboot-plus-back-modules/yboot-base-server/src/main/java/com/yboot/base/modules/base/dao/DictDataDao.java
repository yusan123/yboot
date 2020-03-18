package com.yboot.base.modules.base.dao;

import com.yboot.common.base.YbootBaseDao;
import com.yboot.base.modules.base.entity.DictData;

import java.util.List;

/**
 * 字典数据数据处理层
 * @author 田培融
 */
public interface DictDataDao extends YbootBaseDao<DictData, String> {


    /**
     * 通过dictId和状态获取
     * @param dictId
     * @param status
     * @return
     */
    List<DictData> findByDictIdAndStatusOrderBySortOrder(String dictId, Integer status);

    /**
     * 通过dictId删除
     * @param dictId
     */
    void deleteByDictId(String dictId);
}