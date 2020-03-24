package com.yboot.base.modules.base.service;

import com.yboot.base.modules.base.dao.MessageSendDao;
import com.yboot.common.base.YbootBaseService;
import com.yboot.base.modules.base.entity.MessageSend;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 * 消息发送接口
 * @author 田培融
 */
public interface MessageSendService extends YbootBaseService<MessageSendDao,MessageSend, String> {

    /**
     * 发送消息 带websock推送
     * @param messageSend
     * @return
     */
    MessageSend send(MessageSend messageSend);

    /**
     * 通过消息id删除
     * @param messageId
     */
    void deleteByMessageId(String messageId);

    /**
     * 多条件分页获取
     * @param messageSend
     * @param pageable
     * @return
     */
    Page<MessageSend> findByCondition(MessageSend messageSend, Pageable pageable);
}