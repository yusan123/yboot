package com.yboot.base.modules.file.utils;

import com.yboot.common.common.constant.CommonConstant;
import com.yboot.common.common.constant.SettingConstant;

/**
 * @description:
 * @author: 田培融
 * @date: 2020-05-27 10:28
 */
public class TypeUtil {
    public static Integer getType(String type){
        switch (type){
            case SettingConstant.QINIU_OSS:
                return CommonConstant.OSS_QINIU;
            case SettingConstant.ALI_OSS:
                return CommonConstant.OSS_ALI;
            case SettingConstant.TENCENT_OSS:
                return CommonConstant.OSS_TENCENT;
            case SettingConstant.MINIO_OSS:
                return CommonConstant.OSS_MINIO;
            case SettingConstant.LOCAL_OSS:
                return CommonConstant.OSS_LOCAL;
            default:
                return -1;
        }
    }
}
