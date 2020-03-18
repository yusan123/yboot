package com.yboot.common.modules.base.api;

import com.yboot.common.common.vo.Result;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * 基础服务测试api
 * @author 田培融
 * @Date 2020/3/8 17:45
 * @EMail canghaihongxin@163.com
 **/
public interface TestControllerApi {

    @GetMapping("/base/test/lockAndLimit")
    Result<Object> test1();

    @GetMapping("/base/test/txAccount")
    Result<Object> txAccount();
}
