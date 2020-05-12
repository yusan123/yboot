package com.yboot.common.cache.computable;

import cn.hutool.core.util.RandomUtil;

import java.io.IOException;
import java.util.Random;
import java.util.concurrent.TimeUnit;

/**
 * @description:
 * @author: 田培融
 * @date: 2020-05-12 11:34
 */
public class ExpensiveFunction implements Computable<String,Integer> {
    @Override
    public Integer compute(String arg) throws Exception {
        TimeUnit.SECONDS.sleep(5);
        return Integer.valueOf(arg);
    }
}
