package com.yboot.base.modules.base.utils;

import com.yboot.base.modules.base.entity.Permission;
import com.yboot.base.modules.base.vo.MenuVo;
import cn.hutool.core.bean.BeanUtil;

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
