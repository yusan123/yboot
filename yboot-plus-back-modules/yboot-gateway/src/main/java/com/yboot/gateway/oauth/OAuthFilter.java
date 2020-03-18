package com.yboot.gateway.oauth;

import com.yboot.common.common.jwt.JwtOperator;
import io.jsonwebtoken.Claims;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.http.HttpHeaders;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import java.util.List;

/**
 * 认证过滤器
 * @author 田培融
 * @Date 2020/2/24 17:34
 * @EMail canghaihongxin@163.com
 **/
@Component
@Slf4j
public class OAuthFilter implements GlobalFilter, Ordered {

    private final String Authorization = "Authorization";
    private final String AccessToken = "accessToken";

    @Autowired
    private JwtOperator jwtOperator;

    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        ServerHttpRequest request = exchange.getRequest();
        HttpHeaders headers = request.getHeaders();
        // 放行认证服务器的请求
        if (StringUtils.startsWith(request.getURI().getPath(),"/base/oauth")){
            return chain.filter(exchange);
        }

        List<String> authorizationListByAuth = headers.get(Authorization);
        List<String> authorizationListByAcc = headers.get(AccessToken);
        if (authorizationListByAuth == null &&authorizationListByAcc==null){
            return chain.filter(exchange);
        }

        String jwt = "";
        if (authorizationListByAuth != null && !authorizationListByAuth.isEmpty()){
            if (!StringUtils.startsWithIgnoreCase(authorizationListByAuth.get(0),"bearer ")){
                return chain.filter(exchange);
            }
            jwt = StringUtils.substringAfter(authorizationListByAuth.get(0),"bearer ");
        }

        if (authorizationListByAcc != null && !authorizationListByAcc.isEmpty()){
            jwt = authorizationListByAcc.get(0);
        }


        try {
            Claims info = getTokenInfoByJwt(jwt);
            exchange.getAttributes().put("tokenInfo",info);
        }catch (Exception e){
            log.error(" get tokenInfo fail ",e);
        }


        return chain.filter(exchange);
    }

    /**
     *  验证jwt是否合法并转换为用户信息
     * @param jwt jwt
     * @return 用户信息
     */
    private Claims getTokenInfoByJwt(String jwt) throws Exception {
        Boolean validateToken = jwtOperator.validateToken(jwt);
        if (validateToken){
            Claims claims = jwtOperator.getClaimsFromToken(jwt);
            return claims;
        }
        return null;
    }


    @Override
    public int getOrder() {
        return 0;
    }
}
