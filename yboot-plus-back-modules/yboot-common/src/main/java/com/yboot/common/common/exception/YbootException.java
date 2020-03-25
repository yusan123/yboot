package com.yboot.common.common.exception;

import lombok.Data;

/**
 * @author 田培融
 */
@Data
public class YbootException extends RuntimeException {

    private String msg;

    public YbootException(String msg){
        super(msg);
        this.msg = msg;
    }
}
