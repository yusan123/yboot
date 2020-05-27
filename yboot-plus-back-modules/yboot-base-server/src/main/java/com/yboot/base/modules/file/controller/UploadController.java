package com.yboot.base.modules.file.controller;

import cn.hutool.core.util.StrUtil;
import com.google.gson.Gson;
import com.yboot.base.common.utils.IpInfoUtil;
import com.yboot.base.modules.base.entity.Setting;
import com.yboot.base.modules.base.service.SettingService;
import com.yboot.base.modules.base.vo.OssSetting;
import com.yboot.base.modules.file.entity.File;
import com.yboot.base.modules.file.manage.FileManageFactory;
import com.yboot.base.modules.file.service.FileService;
import com.yboot.base.modules.file.utils.TypeUtil;
import com.yboot.common.common.constant.CommonConstant;
import com.yboot.common.common.constant.SettingConstant;
import com.yboot.common.common.exception.LimitException;
import com.yboot.common.common.limit.RedisRaterLimiter;
import com.yboot.common.common.utils.Base64DecodeMultipartFile;
import com.yboot.common.common.utils.CommonUtil;
import com.yboot.common.common.utils.ResultUtil;
import com.yboot.common.common.vo.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.InputStream;

/**
 * @author 田培融
 */
@Slf4j
@RestController
@Api(description = "文件上传接口")
@RequestMapping("/base/upload")
@Transactional
public class UploadController {

    @Autowired
    private RedisRaterLimiter redisRaterLimiter;

    @Autowired
    private IpInfoUtil ipInfoUtil;

    @Autowired
    private FileManageFactory fileManageFactory;

    @Autowired
    private SettingService settingService;

    @Autowired
    private FileService fileService;

    @RequestMapping(value = "/file", method = RequestMethod.POST)
    @ApiOperation(value = "文件上传")
    public Result<Object> upload(@RequestParam(required = false) MultipartFile file,
                                 @RequestParam(required = false) String base64,
                                 HttpServletRequest request) {

        Setting setting = settingService.get(SettingConstant.OSS_USED);
        if(setting==null|| StrUtil.isBlank(setting.getValue())){
            return ResultUtil.error(501, "您还未配置OSS存储服务");
        }

        // IP限流 在线Demo所需 5分钟限1个请求
        String token = redisRaterLimiter.acquireToken("upload:"+ipInfoUtil.getIpAddr(request), 1, 300000);
        if (StrUtil.isBlank(token)) {
            throw new LimitException("上传那么多干嘛，等等再传吧");
        }

        if(StrUtil.isNotBlank(base64)){
            // base64上传
            file = Base64DecodeMultipartFile.base64Convert(base64);
        }
        String result = "";
        String fKey = CommonUtil.renamePic(file.getOriginalFilename());
        File f = new File();
        try {
            InputStream inputStream = file.getInputStream();
            // 上传至第三方云服务或服务器
            result = fileManageFactory.getFileManage(null).inputStreamUpload(inputStream, fKey, file);
            f.setLocation(TypeUtil.getType(setting.getValue()));
            // 保存数据信息至数据库
            f.setName(file.getOriginalFilename());
            f.setSize(file.getSize());
            f.setType(file.getContentType());
            f.setFKey(fKey);
            f.setUrl(result);
            fileService.save(f);
        } catch (Exception e) {
            log.error(e.toString());
            return ResultUtil.error(e.toString());
        }
        if(setting.getValue().equals(SettingConstant.LOCAL_OSS)){
            OssSetting os = new Gson().fromJson(settingService.get(SettingConstant.LOCAL_OSS).getValue(), OssSetting.class);
            result = os.getHttp() + os.getEndpoint() + "/" + f.getId();
        }
        return ResultUtil.data(result);
    }


}
