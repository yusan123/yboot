package com.yboot.base.modules.activiti.controller.business;

import com.yboot.base.common.utils.SecurityUtil;
import com.yboot.base.modules.activiti.entity.ActBusiness;
import com.yboot.base.modules.activiti.entity.business.Leave;
import com.yboot.base.modules.activiti.service.ActBusinessService;
import com.yboot.base.modules.activiti.service.business.LeaveService;
import com.yboot.common.base.YbootBaseController;
import com.yboot.common.common.utils.ResultUtil;
import com.yboot.common.common.vo.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author 田培融
 */
@Slf4j
@RestController
@Api(description = "请假申请接口")
@Transactional
@RequestMapping(value = "/base/leave")
public class LeaveController extends YbootBaseController<Leave, String> {

    @Autowired
    private LeaveService leaveService;

    @Autowired
    private ActBusinessService actBusinessService;

    @Autowired
    private SecurityUtil securityUtil;

    @Override
    public LeaveService getService() {
        return leaveService;
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ApiOperation(value = "添加申请草稿状态")
    public Result<Object> add(Leave leave,
                              @RequestParam String procDefId){

        Leave le = leaveService.save(leave);
        // 保存至我的申请业务
        String userId = securityUtil.getCurrUser().getId();
        ActBusiness actBusiness = new ActBusiness();
        actBusiness.setUserId(userId);
        actBusiness.setTableId(le.getId());
        actBusiness.setProcDefId(procDefId);
        actBusiness.setTitle(leave.getTitle());
        actBusinessService.save(actBusiness);
        return ResultUtil.data(null);
    }
}
