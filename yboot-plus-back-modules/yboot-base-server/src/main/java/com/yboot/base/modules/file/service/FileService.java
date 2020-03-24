package com.yboot.base.modules.file.service;

import com.yboot.base.modules.file.dao.FileDao;
import com.yboot.common.base.YbootBaseService;
import com.yboot.common.common.vo.SearchVo;
import com.yboot.base.modules.file.entity.File;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 * 文件管理接口
 * @author 田培融
 */
public interface FileService extends YbootBaseService<FileDao,File, String> {

    /**
     * 多条件获取列表
     * @param file
     * @param searchVo
     * @param pageable
     * @return
     */
    Page<File> findByCondition(File file, SearchVo searchVo, Pageable pageable);
}