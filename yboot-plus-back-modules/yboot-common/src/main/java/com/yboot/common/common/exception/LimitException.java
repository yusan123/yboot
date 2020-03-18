package com.yboot.common.common.exception;

import lombok.Data;

/**
 * @author 田培融
 */
@Data
public class LimitException extends RuntimeException {

    private String msg;

    public LimitException(String msg){
        super(msg);
        this.msg = msg;
    }
}
