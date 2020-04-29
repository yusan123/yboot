package com.yboot.base.modules.activiti.utils;

import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson.JSONObject;
import com.aliyuncs.exceptions.ClientException;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.yboot.base.common.utils.EmailUtil;
import com.yboot.base.common.utils.SmsUtil;
import com.yboot.base.modules.activiti.vo.EmailMessage;
import com.yboot.base.modules.base.entity.MessageSend;
import com.yboot.base.modules.base.entity.Setting;
import com.yboot.base.modules.base.entity.User;
import com.yboot.base.modules.base.service.MessageSendService;
import com.yboot.base.modules.base.service.UserService;
import com.yboot.base.modules.base.vo.OtherSetting;
import com.yboot.common.common.constant.ActivitiConstant;
import com.yboot.common.common.constant.SettingConstant;
import com.yboot.common.common.exception.YbootException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author 田培融
 */
@Transactional
@Component
@Slf4j
public class MessageUtil {

    @Autowired
    private SmsUtil smsUtil;

    @Autowired
    private EmailUtil emailUtil;

    @Autowired
    private UserService userService;

    @Autowired
    private MessageSendService messageSendService;

    @Autowired
    private StringRedisTemplate redisTemplate;

    public OtherSetting getOtherSetting(){

        String v = redisTemplate.opsForValue().get("setting::"+SettingConstant.OTHER_SETTING);
        if(StrUtil.isBlank(v)){
            throw new YbootException("系统未配置访问域名");
        }

        String v1 = StrUtil.removePrefix(v, "[");
        String v2 = StrUtil.removeSuffix(v1, "]");
        String v3 = StrUtil.removePrefix(v2, "\"com.yboot.base.modules.base.entity.Setting\",");
        JSONObject jsonObject = JSONObject.parseObject(v3);
        Object value = jsonObject.get("value");
        OtherSetting otherSetting = JSONObject.parseObject(value.toString(), OtherSetting.class);
        return otherSetting;
    }

    /**
     * 发送工作流消息
     * @param userId 发送用户
     * @param content 消息内容
     * @param sendMessage 是否发站内信息
     * @param sendSms 是否发短信
     * @param sendEmail 是否发邮件
     */
    @Async
    public void sendActMessage(String userId, String content, Boolean sendMessage, Boolean sendSms, Boolean sendEmail){

        User user = userService.get(userId);
        if(user==null){
            return;
        }
        MessageSend messageSend = new MessageSend();
        messageSend.setUserId(user.getId());
        if(sendMessage&& ActivitiConstant.MESSAGE_TODO_CONTENT.equals(content)){
            // 待办
            messageSend.setMessageId(ActivitiConstant.MESSAGE_TODO_ID);
            messageSendService.send(messageSend);
        }else if(sendMessage&&ActivitiConstant.MESSAGE_PASS_CONTENT.equals(content)){
            // 通过
            messageSend.setMessageId(ActivitiConstant.MESSAGE_PASS_ID);
            messageSendService.send(messageSend);
        }else if(sendMessage&&ActivitiConstant.MESSAGE_BACK_CONTENT.equals(content)){
            // 驳回
            messageSend.setMessageId(ActivitiConstant.MESSAGE_BACK_ID);
            messageSendService.send(messageSend);
        }else if(sendMessage&&ActivitiConstant.MESSAGE_DELEGATE_CONTENT.equals(content)){
            // 委托
            messageSend.setMessageId(ActivitiConstant.MESSAGE_DELEGATE_ID);
            messageSendService.send(messageSend);
        }
        if(StrUtil.isNotBlank(user.getMobile())&&sendSms){
            try {
                smsUtil.sendActMessage(user.getMobile(), content);
            } catch (ClientException e) {
                log.error(e.toString());
            }
        }
        if(StrUtil.isNotBlank(user.getEmail())&&sendEmail){
            EmailMessage e = new EmailMessage();
            e.setUsername(user.getUsername());
            e.setContent(content);
            e.setFullUrl(getOtherSetting().getDomain());
            emailUtil.sendTemplateEmail(user.getEmail(), "【YBoot】工作流通知提醒", "act-message-email", e);
        }
    }

    public static void main(String[] args) {
        String v = "[\n" +
                "  \"com.yboot.base.modules.base.entity.Setting\",\n" +
                "  {\n" +
                "    \"id\": \"OTHER_SETTING\",\n" +
                "    \"createBy\": \"682265633886208\",\n" +
                "    \"createTime\": [\n" +
                "      \"java.sql.Timestamp\",\n" +
                "      \"2020-03-31 20:16:55\"\n" +
                "    ],\n" +
                "    \"updateBy\": \"682265633886208\",\n" +
                "    \"updateTime\": [\n" +
                "      \"java.sql.Timestamp\",\n" +
                "      \"2020-04-20 17:10:58\"\n" +
                "    ],\n" +
                "    \"delFlag\": 0,\n" +
                "    \"value\": \"{\\\"domain\\\":\\\"http://127.0.0.1:9200\\\",\\\"ssoDomain\\\":\\\"budongfeng.com\\\",\\\"blacklist\\\":\\\"\\\"}\"\n" +
                "  }\n" +
                "]";

        String v1 = StrUtil.removePrefix(v, "[");
        String v2 = StrUtil.removeSuffix(v1, "]");
        String v3 = StrUtil.removePrefix(v2, "\n" +
                "  \""+Setting.class.toString()+"\",");
        JSONObject jsonObject = JSONObject.parseObject(v3);
        Object value = jsonObject.get("value");
        OtherSetting otherSetting = JSONObject.parseObject(value.toString(), OtherSetting.class);

        System.out.println(otherSetting);

    }
}
