package com.yboot.common.cache;

import cn.hutool.core.util.RandomUtil;
import com.yboot.common.cache.computable.Computable;
import com.yboot.common.cache.computable.ExpensiveFunction;

import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.*;

/**
 * @description:
 * @author: 田培融
 * @date: 2020-05-12 11:03
 */
public class TprCache<A, V> implements Computable<A, V> {
    private final Map<A, Future<V>> cache = new ConcurrentHashMap<A, Future<V>>();

    private final Computable<A, V> c;

    public TprCache(Computable<A, V> c) {
        this.c = c;
    }


    @Override
    public V compute(A arg) throws InterruptedException,ExecutionException {
        while (true) {
            Future<V> f = cache.get(arg);
            if (f == null) {
                Callable<V> callable = new Callable<V>() {
                    @Override
                    public V call() throws Exception {
                        return c.compute(arg);
                    }
                };
                FutureTask<V> ft = new FutureTask<>(callable);
                f = cache.putIfAbsent(arg, ft);
                if (f == null) {
                    f = ft;
                    ft.run();
                }
            }
            try {
                return f.get();
            } catch (CancellationException e) {
                cache.remove(arg);
                throw e;
            } catch (InterruptedException e) {
                cache.remove(arg);
                throw e;
            } catch (ExecutionException e) {
                cache.remove(arg);
            }
        }
    }

    public final static ScheduledExecutorService executor = Executors.newScheduledThreadPool(5);

    public V computeRandomExpire(A arg) throws ExecutionException, InterruptedException {
        long randdomExpire = (long) (Math.random()*10000);
        return compute(arg,randdomExpire);
    }

    public V compute(A arg, long expire) throws InterruptedException,ExecutionException {
        if (expire> 0){
            executor.schedule(new Runnable() {
                @Override
                public void run() {
                    expire(arg);
                }
            },expire, TimeUnit.MILLISECONDS);
        }
        return compute(arg);
    }

    public synchronized void expire(A arg){
        Future<V> vFuture = cache.get(arg);
        if (vFuture != null){
            if (vFuture.isDone()){
                vFuture.cancel(true);
            }
            cache.remove(arg);
        }
    }

    public static void main(String[] args) throws Exception {
        TprCache<String, Integer> cache = new TprCache<>(new ExpensiveFunction());

        new Thread(() -> {
            try {
                System.out.println(cache.compute("15",5000l));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }).start();
        TimeUnit.SECONDS.sleep(6);
        new Thread(() -> {
            try {
                System.out.println(cache.compute("16"));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }).start();

        new Thread(() -> {
            try {
                System.out.println(cache.compute("15"));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }).start();

    }
}
