package com.yboot.common.cache.test;

import com.yboot.common.cache.TprCache;
import com.yboot.common.cache.computable.ExpensiveFunction;

import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * @description:
 * @author: 田培融
 * @date: 2020-05-12 14:28
 */
public class Test1 {

    static  final  TprCache cache = new TprCache(new ExpensiveFunction());

    public static void main(String[] args) {
        long startTime = System.currentTimeMillis();
        ExecutorService executorService = Executors.newFixedThreadPool(100);
        for (int i = 0; i < 100; i++) {
            executorService.submit(new Runnable() {
                @Override
                public void run() {
                    try {
                        cache.compute("10");
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    } catch (ExecutionException e) {
                        e.printStackTrace();
                    }
                }
            });
        }
        executorService.shutdown();
        while (!executorService.isTerminated()){}
        System.out.println("用时 = "+ (System.currentTimeMillis()-startTime));

    }
}
