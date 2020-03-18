package com.yboot.base.modules.activiti.listener;

import com.yboot.common.common.utils.SpringContextUtil;
import com.yboot.base.modules.activiti.entity.business.Leave;
import com.yboot.base.modules.activiti.service.business.LeaveService;
import lombok.extern.slf4j.Slf4j;
import org.activiti.engine.delegate.DelegateExecution;
import org.activiti.engine.delegate.ExecutionListener;

/**
 * @author 田培融
 */
@Slf4j
public class MyExecutionListener implements ExecutionListener {

    @Override
    public void notify(DelegateExecution delegateExecution) throws Exception {

        // 获取关联业务表ID变量(启动流程代码里已存入tableId，此处直接获取即可)
        String tableId = (String) delegateExecution.getVariable("tableId");
        log.info(tableId);
        LeaveService leaveService = SpringContextUtil.getBean(LeaveService.class);
        Leave leave = leaveService.get(tableId);

        // 监听器中设置流程变量示例
        // delegateTask.setVariable("yboot", "yboot");
    }
}
