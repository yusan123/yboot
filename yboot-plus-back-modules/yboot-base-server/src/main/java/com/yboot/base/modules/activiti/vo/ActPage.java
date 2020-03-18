package com.yboot.base.modules.activiti.vo;

import lombok.Data;

import java.util.List;

/**
 * @author 田培融
 */
@Data
public class ActPage<T> {

    List<T> content;

    Long totalElements;
}
