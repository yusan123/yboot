package com.yboot.common.config.mybatis;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.yboot.common.common.jwt.JwtOperator;
import io.jsonwebtoken.Claims;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * 字段填充审计
 * @author 田培融
 */
@Slf4j
@Component
public class MyMetaObjectHandler implements MetaObjectHandler {

    @Autowired
    private JwtOperator jwtOperator;

    @Autowired
    private HttpServletRequest httpServletRequest;

    @Override
    public void insertFill(MetaObject metaObject) {

        String accessToken = getAccessToken();

        try {
            Claims claims = jwtOperator.getClaimsFromToken(accessToken);
            String userId = claims.get("user_id", String.class);
            this.setFieldValByName("createBy", userId, metaObject);
        }catch (Exception e){
            log.error(" mybatis add createBy error = {}",e.getMessage());
        }
        this.setFieldValByName("createTime", new Date(), metaObject);
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        String accessToken = getAccessToken();

        try {
            Claims claims = jwtOperator.getClaimsFromToken(accessToken);
            String userId = claims.get("user_id", String.class);
            this.setFieldValByName("updateBy", userId, metaObject);
        }catch (Exception e){
            log.error(" mybatis add createBy error = {}",e.getMessage());
        }

        this.setFieldValByName("updateTime", new Date(), metaObject);
    }

    private String getAccessToken() {
        String accessToken = httpServletRequest.getHeader("accessToken");
        if (StrUtil.isBlank(accessToken)) {
            accessToken = httpServletRequest.getHeader("Authorization");
            accessToken = StrUtil.subAfter(accessToken, "bearer ", false);
        }
        return accessToken;
    }
}

