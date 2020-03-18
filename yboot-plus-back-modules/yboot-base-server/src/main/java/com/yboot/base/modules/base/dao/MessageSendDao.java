package com.yboot.base.modules.base.dao;

import com.yboot.common.base.YbootBaseDao;
import com.yboot.base.modules.base.entity.MessageSend;

/**
 * 消息发送数据处理层
 * @author 田培融
 */
public interface MessageSendDao extends YbootBaseDao<MessageSend, String> {

    /**
     * 通过消息id删除
     * @param messageId
     */
    void deleteByMessageId(String messageId);
}