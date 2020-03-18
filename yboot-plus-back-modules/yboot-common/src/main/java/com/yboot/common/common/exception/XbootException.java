package com.yboot.common.common.exception;

import lombok.Data;

/**
 * @author 田培融
 */
@Data
public class XbootException extends RuntimeException {

    private String msg;

    public XbootException(String msg){
        super(msg);
        this.msg = msg;
    }
}
