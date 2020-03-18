package com.yboot.business.fallback;

import com.yboot.business.client.BaseTestClient;
import com.yboot.common.common.utils.ResultUtil;
import com.yboot.common.common.vo.Result;
import feign.hystrix.FallbackFactory;
import org.springframework.stereotype.Component;

/**
 *
 * @author 田培融
 * @Date 2020/3/11 9:21
 * @EMail canghaihongxin@163.com
 **/
@Component
public class BaseTestClientFallback implements FallbackFactory<BaseTestClient> {

    @Override
    public BaseTestClient create(Throwable throwable) {
        return new BaseTestClient() {
            @Override
            public Result<Object> test1() {
                return ResultUtil.error("流控/降级返回的用户");
            }

            @Override
            public Result<Object> txAccount() {
                return ResultUtil.error("流控/降级返回的用户txAccount");
            }
        };
    }
}
