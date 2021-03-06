package com.yboot.base.config.security;

import com.yboot.base.config.properties.IgnoredUrlsProperties;
import com.yboot.base.config.security.jwt.RestAccessDeniedHandler;
import com.yboot.base.config.security.permission.MyFilterSecurityInterceptor;
import com.yboot.base.config.security.validate.ImageValidateFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configurers.ExpressionUrlAuthorizationConfigurer;
import org.springframework.security.oauth2.config.annotation.web.configuration.EnableResourceServer;
import org.springframework.security.oauth2.config.annotation.web.configuration.ResourceServerConfigurerAdapter;
import org.springframework.security.oauth2.config.annotation.web.configurers.ResourceServerSecurityConfigurer;
import org.springframework.security.web.access.intercept.FilterSecurityInterceptor;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

/**
 * @author 田培融
 * @Date 2020/2/28 16:42
 * @EMail canghaihongxin@163.com
 **/
@Configuration
@EnableResourceServer
public class ResourceSecurityConfig extends ResourceServerConfigurerAdapter {
    @Override
    public void configure(ResourceServerSecurityConfigurer resources) throws Exception {

        resources.resourceId("base-server");
    }

    @Autowired
    private IgnoredUrlsProperties ignoredUrlsProperties;

    @Autowired
    private ImageValidateFilter imageValidateFilter;
    @Autowired
    private RestAccessDeniedHandler accessDeniedHandler;

    @Autowired
    private MyFilterSecurityInterceptor myFilterSecurityInterceptor;

    @Override
    public void configure(HttpSecurity http) throws Exception {
        ExpressionUrlAuthorizationConfigurer<HttpSecurity>.ExpressionInterceptUrlRegistry registry = http.authorizeRequests();
        // 除配置文件忽略路径其它所有请求都需经过认证和授权
        for (String url : ignoredUrlsProperties.getUrls()) {
            registry.antMatchers(url).permitAll();
        }
        registry
                .and()
//                // 允许网页iframe
                .headers().frameOptions().disable()
                .and()
                .authorizeRequests().anyRequest().authenticated()
                .and()
                // 自定义权限拒绝处理类
                .exceptionHandling().accessDeniedHandler(accessDeniedHandler);
        registry.and().
                addFilterBefore(imageValidateFilter, UsernamePasswordAuthenticationFilter.class)
                // 添加自定义权限过滤器
                .addFilterBefore(myFilterSecurityInterceptor, FilterSecurityInterceptor.class)

        ;
    }
}
