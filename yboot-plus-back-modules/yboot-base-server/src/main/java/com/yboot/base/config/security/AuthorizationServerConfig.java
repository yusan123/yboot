package com.yboot.base.config.security;

import com.yboot.base.config.properties.YbootTokenProperties;
import com.yboot.base.config.security.jwt.CustomTokenEnhancer;
import com.yboot.common.common.exception.MyWebResponseExceptionTranslator;
import com.yboot.common.common.jwt.JwtOperator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.config.annotation.configurers.ClientDetailsServiceConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configuration.AuthorizationServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableAuthorizationServer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerEndpointsConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configurers.AuthorizationServerSecurityConfigurer;
import org.springframework.security.oauth2.provider.token.TokenEnhancer;
import org.springframework.security.oauth2.provider.token.TokenEnhancerChain;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.security.oauth2.provider.token.store.JwtAccessTokenConverter;
import org.springframework.security.oauth2.provider.token.store.JwtTokenStore;

import javax.annotation.Resource;
import javax.sql.DataSource;
import java.util.Arrays;

/**
 * 配置授权服务器
 * 1. 授权服务器配置中指定令牌的存储策略为Redis
 */
@Configuration
@EnableAuthorizationServer
public class AuthorizationServerConfig extends AuthorizationServerConfigurerAdapter {

    @Resource
    private DataSource dataSource;

    @Autowired
    private AuthenticationManager authenticationManager;

    @Autowired
    private UserDetailsServiceImpl userDetailsService;

    @Autowired
    private MyWebResponseExceptionTranslator myWebResponseExceptionTranslator;

    @Autowired
    public JwtOperator jwtOperator;

    @Bean
    public TokenEnhancer customTokenEnhancer(){
        return new CustomTokenEnhancer();
    }
    @Bean
    public TokenStore tokenStore(){
        return new JwtTokenStore(jwtTokenEnHancer());
    }


    @Bean
    public JwtAccessTokenConverter jwtTokenEnHancer() {
        JwtAccessTokenConverter converter = new JwtAccessTokenConverter();
        converter.setSigningKey(jwtOperator.getSecret());
        return converter;
    }

    /**
     * 配置用户相关的信息
     * 使用密码模式需要配置
     * @param endpoints
     * @throws Exception
     */
    @Override
    public void configure(AuthorizationServerEndpointsConfigurer endpoints) throws Exception {

        TokenEnhancerChain enhancerChain = new TokenEnhancerChain();
        enhancerChain.setTokenEnhancers(Arrays.asList(customTokenEnhancer(), jwtTokenEnHancer()));

        endpoints.userDetailsService(userDetailsService)
                .authenticationManager(authenticationManager)
                .tokenEnhancer(enhancerChain)
                .tokenStore(tokenStore())
                .exceptionTranslator(myWebResponseExceptionTranslator);
    }

    /**
     * 客户端应用的配置信息， 主要作用是在认证服务中配置有哪些客户端会请求认证服务获取token
     * 此处使用的是在内存中配置客户端信息，在完整的项目多变的项目中是可以在数据库中配置信息的采用jdbc的方式
     * 1. 添加jdbc依赖
     * 2. 配置数据库相关信息
     * 3. 引入datasource对象
     * 4. 调用clients.jdbc()
     * @param clients 调用的客户端，如:前端商场，后端 CMS等应用
     * @throws Exception
     */
    @Override
    public void configure(ClientDetailsServiceConfigurer clients) throws Exception {
        // 将信息添加到内存， 此处也可以配置到数据库中
        clients.jdbc(dataSource);

    }

    /**
     * 配置哪些资源服务可以访问授权服务进行验证token
     * @param security 需要验证token的资源服务
     * @throws Exception 异常
     */
    @Override
    public void configure(AuthorizationServerSecurityConfigurer security) throws Exception {

        security
                // 通过认证的服务可以拿到  converter.setSigningKey("yboot");
                .tokenKeyAccess("isAuthenticated()")
                // 资源服务必须携带期client_id 和Client_secret才可以进入token验证
                .checkTokenAccess("isAuthenticated()");
    }

    public static void main(String[] args) {
        BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
        String encode = bCryptPasswordEncoder.encode("123456");
        System.out.println(encode);
    }

}
