package com.yboot.common.cache.computable;

/**
 * @description:
 * @author: 田培融
 * @date: 2020-05-12 11:33
 */
public interface Computable<A,V> {

    V compute(A arg) throws Exception;
}
