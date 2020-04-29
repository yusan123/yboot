package com.yboot.base.modules.base.controller.manage;

import com.yboot.base.modules.base.dao.MessageSendDao;
import com.yboot.common.base.YbootBaseController;
import com.yboot.common.common.utils.PageUtil;
import com.yboot.common.common.utils.ResultUtil;
import com.yboot.common.common.vo.PageVo;
import com.yboot.common.common.vo.Result;
import com.yboot.base.modules.base.entity.Message;
import com.yboot.base.modules.base.entity.MessageSend;
import com.yboot.base.modules.base.entity.User;
import com.yboot.base.modules.base.service.MessageSendService;
import com.yboot.base.modules.base.service.MessageService;
import com.yboot.base.modules.base.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


/**
 * @author 田培融
 */
@Slf4j
@RestController
@Api(description = "消息发送管理接口")
@RequestMapping("/base/messageSend")
@Transactional
public class MessageSendController extends YbootBaseController<MessageSendDao,MessageSend, String> {

    @Autowired
    private UserService userService;

    @Autowired
    private MessageService messageService;

    @Autowired
    private MessageSendService messageSendService;

    @Override
    public MessageSendService getService() {
        return messageSendService;
    }

    @RequestMapping(value = "/getByCondition", method = RequestMethod.GET)
    @ApiOperation(value = "多条件分页获取")
    public Result<Page<MessageSend>> getByCondition(MessageSend ms,
                                                    PageVo pv){
        Page<MessageSend> page = messageSendService.findByCondition(ms, PageUtil.initPage(pv));
        // lambda
        page.getContent().forEach(item->{
            User u = userService.get(item.getUserId());
            if(u!=null){
                item.setUsername(u.getUsername());
            }
            Message m = messageService.get(item.getMessageId());
            if (m !=null){
                item.setTitle(m.getTitle());
                item.setContent(m.getContent());
                item.setType(m.getType());
            }
        });
        return new ResultUtil<Page<MessageSend>>().setData(page);
    }
}
