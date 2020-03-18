package com.yboot.common.modules.base.utils;

import cn.hutool.core.bean.BeanUtil;
import com.yboot.common.modules.base.entity.Permission;
import com.yboot.common.modules.base.vo.MenuVo;

/**
 * @author 田培融
 */
public class VoUtil {

    public static MenuVo permissionToMenuVo(Permission p){

        MenuVo menuVo = new MenuVo();
        BeanUtil.copyProperties(p, menuVo);
        return menuVo;
    }
}
