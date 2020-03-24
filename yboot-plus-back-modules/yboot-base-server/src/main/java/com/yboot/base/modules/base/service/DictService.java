package com.yboot.base.modules.base.service;

import com.yboot.base.modules.base.dao.DictDao;
import com.yboot.common.base.YbootBaseService;
import com.yboot.base.modules.base.entity.Dict;

import java.util.List;

/**
 * 字典接口
 * @author 田培融
 */
public interface DictService extends YbootBaseService<DictDao,Dict, String> {

    /**
     * 排序获取全部
     * @return
     */
    List<Dict> findAllOrderBySortOrder();

    /**
     * 通过type获取
     * @param type
     * @return
     */
    Dict findByType(String type);

    /**
     * 模糊搜索
     * @param key
     * @return
     */
    List<Dict> findByTitleOrTypeLike(String key);
}