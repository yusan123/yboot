package com.yboot.business.dao;

import com.yboot.common.base.YbootBaseDao;
import com.yboot.business.entity.message.RocketmqTransactionLog;

/**
 * @author 田培融
 * @Date 2020/3/14 15:47
 * @EMail canghaihongxin@163.com
 **/
public interface RocketmqTransactionLogDao extends YbootBaseDao<RocketmqTransactionLog,Integer> {
    RocketmqTransactionLog findByTransactionId(String transactionId);
}
