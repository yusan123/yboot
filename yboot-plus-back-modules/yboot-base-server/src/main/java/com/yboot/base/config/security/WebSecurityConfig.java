package com.yboot.base.config.security;

import com.yboot.base.common.utils.SecurityUtil;
import com.yboot.base.config.properties.IgnoredUrlsProperties;
import com.yboot.base.config.properties.YbootTokenProperties;
import com.yboot.base.config.security.jwt.AuthenticationFailHandler;
import com.yboot.base.config.security.jwt.AuthenticationSuccessHandler;
import com.yboot.base.config.security.jwt.RestAccessDeniedHandler;
import com.yboot.base.config.security.permission.MyFilterSecurityInterceptor;
import com.yboot.base.config.security.validate.EmailValidateFilter;
import com.yboot.base.config.security.validate.ImageValidateFilter;
import com.yboot.base.config.security.validate.SmsValidateFilter;
import com.yboot.base.config.security.validate.VaptchaValidateFilter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 * Security 核心配置类
 * 开启注解控制权限至Controller
 * @author 田培融
 */
@Slf4j
@Configuration
@EnableGlobalMethodSecurity(prePostEnabled=true)
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Autowired
    private YbootTokenProperties tokenProperties;

    @Autowired
    private IgnoredUrlsProperties ignoredUrlsProperties;

    @Autowired
    private UserDetailsServiceImpl userDetailsService;

    @Autowired
    private AuthenticationSuccessHandler successHandler;

    @Autowired
    private AuthenticationFailHandler failHandler;

    @Autowired
    private RestAccessDeniedHandler accessDeniedHandler;

    @Autowired
    private MyFilterSecurityInterceptor myFilterSecurityInterceptor;

    @Autowired
    private ImageValidateFilter imageValidateFilter;

    @Autowired
    private SmsValidateFilter smsValidateFilter;

    @Autowired
    private VaptchaValidateFilter vaptchaValidateFilter;

    @Autowired
    private EmailValidateFilter emailValidateFilter;

    @Autowired
    private StringRedisTemplate redisTemplate;

    @Autowired
    private SecurityUtil securityUtil;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(new BCryptPasswordEncoder());
    }
    /**
     * 生成账号信息比较器
     * @throws Exception
     */
    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }


//    @Override
//    protected void configure(HttpSecurity http) throws Exception {
//
//        ExpressionUrlAuthorizationConfigurer<HttpSecurity>.ExpressionInterceptUrlRegistry registry = http
//                .authorizeRequests();
//
//        // 除配置文件忽略路径其它所有请求都需经过认证和授权
//        for(String url : ignoredUrlsProperties.getUrls()){
//            registry.antMatchers(url).permitAll();
//        }
//
//        registry.and()
//                // 表单登录方式
//                .formLogin()
////                .loginPage("/base/common/needLogin")
//                // 登录请求url
////                .loginProcessingUrl("/base/login")
//                .permitAll()
//                // 成功处理类
//                .successHandler(successHandler)
//                // 失败
//                .failureHandler(failHandler)
//                .and()
//                // 允许网页iframe
//                .headers().frameOptions().disable()
//                .and()
//                .logout()
//                .permitAll()
//                .and()
//                .authorizeRequests()
//                // 任何请求
//                .anyRequest()
//                // 需要身份认证
//                .authenticated()
//                .and()
//                // 允许跨域
//                .cors().and()
//                // 关闭跨站请求防护
//                .csrf().disable()
//                // 前后端分离采用JWT 不需要session
//                .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS)
//                .and()
//                // 自定义权限拒绝处理类
//                .exceptionHandling().accessDeniedHandler(accessDeniedHandler)
//                .and()
//                // 图形验证码过滤器
//                .addFilterBefore(imageValidateFilter, UsernamePasswordAuthenticationFilter.class)
//                // 短信验证码过滤器
//                .addFilterBefore(smsValidateFilter, UsernamePasswordAuthenticationFilter.class)
//                // vaptcha验证码过滤器
//                .addFilterBefore(vaptchaValidateFilter, UsernamePasswordAuthenticationFilter.class)
//                // email验证码过滤器
//                .addFilterBefore(emailValidateFilter, UsernamePasswordAuthenticationFilter.class)
//                // 添加自定义权限过滤器
//                .addFilterBefore(myFilterSecurityInterceptor, FilterSecurityInterceptor.class)
//                // 添加JWT认证过滤器
//                .addFilter(new JWTAuthenticationFilter(authenticationManager(), tokenProperties, redisTemplate, securityUtil));
//    }
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf()
                .disable()
                .authorizeRequests()
                .antMatchers("/oauth/**", "/login/**", "logout/**")
                .permitAll()
                .anyRequest()
                .authenticated()
                .and()
                .formLogin()
                .permitAll();
    }
}
