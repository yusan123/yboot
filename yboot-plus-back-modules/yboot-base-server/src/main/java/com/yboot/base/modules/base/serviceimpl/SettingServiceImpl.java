package com.yboot.base.modules.base.serviceimpl;

import com.yboot.base.modules.base.dao.SettingDao;
import com.yboot.base.modules.base.entity.Setting;
import com.yboot.base.modules.base.service.SettingService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 配置接口实现
 * @author 田培融
 */
@Slf4j
@Service
@Transactional
public class SettingServiceImpl implements SettingService {

    @Autowired
    private SettingDao settingDao;

    @Override
    public Setting get(String id) {

        return settingDao.findById(id).orElse(new Setting(id));
    }

    @Override
    public Setting saveOrUpdate(Setting setting) {

        return settingDao.saveAndFlush(setting);
    }
}