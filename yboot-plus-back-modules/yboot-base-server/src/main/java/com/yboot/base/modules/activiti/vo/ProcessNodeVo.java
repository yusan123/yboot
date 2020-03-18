package com.yboot.base.modules.activiti.vo;

import com.yboot.base.modules.base.entity.Department;
import com.yboot.base.modules.base.entity.Role;
import com.yboot.base.modules.base.entity.User;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;

/**
 * @author 田培融
 */
@Data
public class ProcessNodeVo {

    @ApiModelProperty(value = "节点id")
    private String id;

    @ApiModelProperty(value = "节点名")
    private String title;

    @ApiModelProperty(value = "节点类型 0开始 1用户任务 2结束 3排他网关")
    private Integer type;

    @ApiModelProperty(value = "关联角色")
    private List<Role> roles;

    @ApiModelProperty(value = "关联用户")
    private List<User> users;

    @ApiModelProperty(value = "关联部门")
    private List<Department> departments;

    @ApiModelProperty(value = "选操作人的部门负责人")
    private Boolean chooseDepHeader = false;

    @ApiModelProperty(value = "节点展开 前端所需")
    private Boolean expand = true;
}
