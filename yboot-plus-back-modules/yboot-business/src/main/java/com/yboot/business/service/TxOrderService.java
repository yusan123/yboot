package com.yboot.business.service;

import com.yboot.business.client.BaseTestClient;
import com.yboot.business.dao.RocketmqTransactionLogDao;
import com.yboot.business.dao.TxOrderDao;
import com.yboot.business.entity.content.TxOrder;
import com.yboot.business.entity.message.RocketmqTransactionLog;
import com.yboot.common.common.vo.Result;
import io.seata.spring.annotation.GlobalTransactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author 田培融
 * @Date 2020/3/14 15:57
 * @EMail canghaihongxin@163.com
 **/
@Slf4j
@Service
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class TxOrderService {

    private final BaseTestClient baseTestClient;
    private final TxOrderDao txOrderDao;
    private final RocketmqTransactionLogDao rocketmqTransactionLogDao;

    @Transactional(rollbackFor = Exception.class)
    public void saveOrderAndLog(String transactionId){
        saveOrder(TxOrder.builder().status("1").build());
        this.rocketmqTransactionLogDao.save(
                RocketmqTransactionLog.builder()
                        .transactionId(transactionId)
                        .log("添加订单").build()
        );
    }

    @Transactional(rollbackFor = Exception.class)
    public TxOrder saveOrder(TxOrder txOrder){
        return txOrderDao.save(txOrder);
    }

    @GlobalTransactional
    @Transactional
    public TxOrder saveOrderForTCC() {
        TxOrder txOrder = saveOrder(TxOrder.builder().status("0").build());
        Result<Object> objectResult = baseTestClient.txAccount();
        if (objectResult.isSuccess()){
            txOrder.setStatus("1");
        }
        return saveOrder(txOrder);
    }
}
