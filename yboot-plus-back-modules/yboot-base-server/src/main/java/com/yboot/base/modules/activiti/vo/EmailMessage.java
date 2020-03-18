package com.yboot.base.modules.activiti.vo;

import lombok.Data;

import java.io.Serializable;

/**
 * @author 田培融
 */
@Data
public class EmailMessage implements Serializable {

    private String username;

    private String content;

    private String fullUrl;
}
