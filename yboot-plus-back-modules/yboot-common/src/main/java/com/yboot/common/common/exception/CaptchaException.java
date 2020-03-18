package com.yboot.common.common.exception;

import lombok.Data;

/**
 * @author 田培融
 */
@Data
public class CaptchaException extends RuntimeException {

    private String msg;

    public CaptchaException(String msg){
        super(msg);
        this.msg = msg;
    }
}
