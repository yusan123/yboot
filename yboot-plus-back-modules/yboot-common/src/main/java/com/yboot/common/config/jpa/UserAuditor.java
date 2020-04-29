package com.yboot.common.config.jpa;

import cn.hutool.core.util.PageUtil;
import cn.hutool.core.util.StrUtil;
import com.yboot.common.common.jwt.JwtOperator;
import com.yboot.common.config.interceptor.Jwt2UserInterceptorAdapter;
import io.jsonwebtoken.Claims;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.domain.AuditorAware;

import javax.servlet.http.HttpServletRequest;
import java.util.Optional;

/**
 * 审计记录创建或修改用户
 * @author 田培融
 */
@Configuration
@Slf4j
public class UserAuditor implements AuditorAware<String> {


    @Autowired
    private JwtOperator jwtOperator;

    @Autowired
    private HttpServletRequest httpServletRequest;

    @Override
    public Optional<String> getCurrentAuditor() {

        if (null!=Jwt2UserInterceptorAdapter.getClaims()){
            String userId = Jwt2UserInterceptorAdapter.getClaims().get("user_id", String.class);
            return Optional.ofNullable(userId);
        }

        String accessToken = httpServletRequest.getHeader("accessToken");
        if (StrUtil.isBlank(accessToken)){
            accessToken = httpServletRequest.getHeader("Authorization");
            accessToken= StrUtil.subAfter(accessToken,"bearer ",false);
        }
        try {
            Claims claims = jwtOperator.getClaimsFromToken(accessToken);
            String userId = claims.get("user_id", String.class);
            Jwt2UserInterceptorAdapter.setClaims(claims);
            return Optional.ofNullable(userId);
        }catch (Exception e){
            return Optional.empty();
        }
    }

}
