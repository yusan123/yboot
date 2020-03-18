package com.yboot.base.modules.your;

import com.yboot.base.common.lock.Callback;
import com.yboot.base.common.lock.RedisLockTemplate;
import com.yboot.base.modules.base.dao.TxAccountDao;
import com.yboot.base.modules.base.dao.mapper.TxAccountMapper;
import com.yboot.base.modules.base.entity.TxAccount;
import com.yboot.common.common.annotation.RateLimiter;
import com.yboot.common.common.utils.ResultUtil;
import com.yboot.common.common.vo.Result;
import com.yboot.common.modules.base.api.TestControllerApi;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.RandomUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.concurrent.TimeUnit;

/**
 * @author 田培融
 */
@Slf4j
@Api(description = "测试接口")
@Transactional
@RequestMapping(value = "/base/test")
@RestController
public class TestController implements TestControllerApi {

    @Autowired
    private RedisLockTemplate redisLockTemplate;

    @RequestMapping(value = "/lockAndLimit", method = RequestMethod.GET)
    @RateLimiter(limit = 1, timeout = 5000)
    @ApiOperation(value = "同步锁限流测试")
    @ResponseBody
    @Override
    public Result<Object> test1() {

        redisLockTemplate.execute("订单流水号", 3, TimeUnit.SECONDS, new Callback() {
            @Override
            public Object onGetLock() throws InterruptedException {
                // TODO 获得锁后要做的事
                log.info("生成订单流水号");
                return null;
            }

            @Override
            public Object onTimeout() throws InterruptedException {
                // TODO 未获取到锁（获取锁超时）后要做的事
                log.info("oops 没拿到锁");
                return null;
            }
        });
        return ResultUtil.data("1111");
    }

    @Autowired
    private TxAccountDao txAccountDao;
    @Autowired
    private TxAccountMapper mapper;

    @GetMapping("/txAccount")
    @Transactional
    public Result<Object> txAccount(){
        if (RandomUtils.nextInt()%2 ==0){
                    try {
            TimeUnit.SECONDS.sleep(10);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
        }
        TxAccount build = TxAccount.builder().money(1d).build();
        mapper.insert(build);
        return ResultUtil.data(build);
    }
}

