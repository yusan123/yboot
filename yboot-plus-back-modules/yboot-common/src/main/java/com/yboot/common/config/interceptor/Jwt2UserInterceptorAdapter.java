package com.yboot.common.config.interceptor;

import cn.hutool.core.util.StrUtil;
import com.yboot.common.common.jwt.JwtOperator;
import io.jsonwebtoken.Claims;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 将jwt转换为USER
 * @author 田培融
 * @Date 2020/3/3 10:25
 * @EMail canghaihongxin@163.com
 **/
@Slf4j
@Component
public class Jwt2UserInterceptorAdapter extends HandlerInterceptorAdapter {
    public static ThreadLocal<Claims> context = new InheritableThreadLocal<>();

    @Autowired
    private JwtOperator jwtOperator;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        String access_token = request.getHeader("accessToken");
        if (StrUtil.isNotBlank(access_token)){
            Claims claimsFromToken = jwtOperator.getClaimsFromToken(access_token);
            context.set(claimsFromToken);
        }

        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        context.remove();
        super.postHandle(request, response, handler, modelAndView);

    }

    public static Claims getClaims(){
        return context.get();
    }

    public static void setClaims(Claims claims){
        context.set(claims);
    }
}
