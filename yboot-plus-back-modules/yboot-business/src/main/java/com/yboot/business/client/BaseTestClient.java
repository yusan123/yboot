package com.yboot.business.client;

import com.yboot.business.fallback.BaseTestClientFallback;
import com.yboot.common.common.vo.Result;
import com.yboot.common.modules.base.api.TestControllerApi;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author 田培融
 * @Date 2020/3/8 21:01
 * @EMail canghaihongxin@163.com
 **/
@FeignClient(name = "yboot-base-server"
        , fallbackFactory = BaseTestClientFallback.class
)
public interface BaseTestClient extends TestControllerApi {
    @Override
    @GetMapping("/base/test/lockAndLimit")
    Result<Object> test1();

    @GetMapping("/base/test/txAccount")
    @Override
    Result<Object> txAccount();
}
