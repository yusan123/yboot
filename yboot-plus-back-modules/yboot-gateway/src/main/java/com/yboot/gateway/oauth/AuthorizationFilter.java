package com.yboot.gateway.oauth;

import com.alibaba.fastjson.JSON;
import com.yboot.gateway.properties.IgnoredUrlsProperties;
import io.jsonwebtoken.Claims;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.core.io.buffer.DataBuffer;
import org.springframework.http.HttpStatus;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.Map;

/**
 * 授权过滤器
 * @author 田培融
 * @Date 2020/2/25 9:04
 * @EMail canghaihongxin@163.com
 **/
@Slf4j
@Component
public class AuthorizationFilter implements GlobalFilter, Ordered {

    @Autowired
    private IgnoredUrlsProperties ignoredUrlsProperties;

    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        ServerHttpRequest request = exchange.getRequest();
        // 判断是否需要授权
        if (isNeedAuth(request)){
            Claims tokenInfo= (Claims) exchange.getAttributes().get("tokenInfo");
            // 判断申请令牌是否 成功
            if (null == tokenInfo) {
                return handleError(401, exchange);
            }
            // 判断是否有权限
            if (!hasPermission(tokenInfo,exchange)){
                return   handleError(403,exchange);
            }

            // 修改请求头信息
//            ServerHttpRequest newRequest = new ServerHttpRequestDecorator(request) {
//                @Override
//                public HttpHeaders getHeaders() {
//                    HttpHeaders httpHeaders = new HttpHeaders();
//                    httpHeaders.putAll(super.getHeaders());
//                    httpHeaders.set("username", tokenInfo.getUser_name());
//                    return httpHeaders;
//                }
//
//            };
//            return chain.filter(exchange.mutate().request(newRequest).build());

        }

        return chain.filter(exchange);
    }


    /**
     * 当没有权限的时候需要处理的逻辑
     * @param status 状态码
     * @param exchange 请求体
     */
    private Mono<Void> handleError(int status, ServerWebExchange exchange) {
        ServerHttpResponse response = exchange.getResponse();
        response.setStatusCode(HttpStatus.UNAUTHORIZED);
        response.getHeaders().add("Content-Type", "application/json;charset=UTF-8");
        Map<String,Object> map = new HashMap<>();
        map.put("status",status);
        byte[] datas = JSON.toJSONString(map).getBytes(StandardCharsets.UTF_8);
        DataBuffer buffer = response.bufferFactory().wrap(datas);
        return response.writeWith(Mono.just(buffer));
    }

    /**
     * 业务实现 判断用户是否有权限
     * @param tokenInfo 用户信息
     * @param exchange 请求体
     * @return  Boolean
     */
    private boolean hasPermission(Claims tokenInfo, ServerWebExchange exchange) {
        return true;
    }

    /**
     * 自行实现逻辑，调用数据库等操作判断是否需要授权
     * @param request
     * @return
     */
    private boolean isNeedAuth(ServerHttpRequest request) {

        AntPathMatcher antPathMatcher =new AntPathMatcher();
        for (String url : ignoredUrlsProperties.getUrls()) {
//            if (url.contains("**")){
//                String ignored= StrUtil.subBefore(url, "**", true);
//                // 放行认证服务器的请求
//                if (StringUtils.startsWith(request.getURI().getPath(),ignored)){
//                    return false;
//                }
//            }else {
//                // 放行认证服务器的请求
//                if (StringUtils.startsWith(request.getURI().getPath(),url)){
//                    return false;
//                }
//            }
            if (antPathMatcher.match(url,request.getURI().getPath())){
                return false;
            }
        }
        return true;
    }


    @Override
    public int getOrder() {
        return 1;
    }
}
