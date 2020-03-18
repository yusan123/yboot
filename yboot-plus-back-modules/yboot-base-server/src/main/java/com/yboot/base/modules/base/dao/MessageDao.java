package com.yboot.base.modules.base.dao;

import com.yboot.common.base.YbootBaseDao;
import com.yboot.base.modules.base.entity.Message;

import java.util.List;

/**
 * 消息内容数据处理层
 * @author 田培融
 */
public interface MessageDao extends YbootBaseDao<Message, String> {

    /**
     * 通过创建发送标识获取
     * @param createSend
     * @return
     */
    List<Message> findByCreateSend(Boolean createSend);
}