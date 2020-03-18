package com.yboot.base.modules.base.dao;

import com.yboot.common.base.YbootBaseDao;
import com.yboot.base.modules.base.entity.User;

import java.util.List;

/**
 * 用户数据处理层
 * @author 田培融
 */
public interface UserDao extends YbootBaseDao<User, String> {

    /**
     * 通过用户名获取用户
     * @param username
     * @return
     */
    User findByUsername(String username);

    /**
     * 通过手机获取用户
     * @param mobile
     * @return
     */
    User findByMobile(String mobile);

    /**
     * 通过邮件获取用户
     * @param email
     * @return
     */
    User findByEmail(String email);

    /**
     * 通过部门id获取
     * @param departmentId
     * @return
     */
    List<User> findByDepartmentId(String departmentId);

    /**
     * 通过用户名模糊搜索
     * @param username
     * @param status
     * @return
     */
    List<User> findByUsernameLikeAndStatus(String username, Integer status);
}
