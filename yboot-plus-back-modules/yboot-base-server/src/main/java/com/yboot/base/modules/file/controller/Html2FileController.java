package com.yboot.base.modules.file.controller;

import cn.hutool.core.io.FileUtil;
import cn.hutool.core.util.StrUtil;
import com.google.gson.Gson;
import com.yboot.base.modules.base.entity.Setting;
import com.yboot.base.modules.base.service.SettingService;
import com.yboot.base.modules.base.vo.OssSetting;
import com.yboot.base.modules.file.manage.FileManageFactory;
import com.yboot.base.modules.file.service.FileService;
import com.yboot.base.modules.file.serviceimpl.Html2WordService;
import com.yboot.base.modules.file.utils.PathUtils;
import com.yboot.base.modules.file.utils.TypeUtil;
import com.yboot.common.common.constant.SettingConstant;
import com.yboot.common.common.utils.CommonUtil;
import com.yboot.common.common.utils.ResultUtil;
import com.yboot.common.common.vo.Result;
import lombok.extern.slf4j.Slf4j;
import org.apache.http.entity.ContentType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import springfox.documentation.annotations.ApiIgnore;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.InputStream;

/**
 * @description: 将html 转换为文件
 * @author: 田培融
 * @date: 2020-05-27 9:10
 */
@Controller
@RequestMapping("/base")
@Slf4j
public class Html2FileController {

    @Autowired
    private SettingService settingService;

    @Autowired
    private Html2WordService html2WordService;
    @Autowired
    private FileManageFactory fileManageFactory;

    @Autowired
    private FileService fileService;


    /**
     * html页面转word
     *
     * @param pageUrl
     * @return
     */
    @RequestMapping("/html2word")
    @ResponseBody
    public Result<String> html2word(@RequestParam(name = "pageUrl") String pageUrl,@RequestParam(name = "fileName",required = false) String fileName) {

        Setting setting = settingService.get(SettingConstant.OSS_USED);
        if(setting==null|| StrUtil.isBlank(setting.getValue())){
            return ResultUtil.error(501, "您还未配置OSS存储服务");
        }
        try {
            String fileRelativePath = html2WordService.excute(pageUrl);
            String result = "";
            com.yboot.base.modules.file.entity.File f = new com.yboot.base.modules.file.entity.File();
            String fKey = CommonUtil.renamePic(".doc");
            File file = FileUtil.file(PathUtils.getClassRootPath(fileRelativePath));
            try {
                BufferedInputStream inputStream = FileUtil.getInputStream(file);
                MultipartFile multipartFile = new MockMultipartFile(file.getName(), file.getName(),
                        ContentType.APPLICATION_OCTET_STREAM.toString(), inputStream);

                // 上传至第三方云服务或服务器
                result = fileManageFactory.getFileManage(null).inputStreamUpload(inputStream, fKey, multipartFile);
                f.setLocation(TypeUtil.getType(setting.getValue()));
                // 保存数据信息至数据库
                f.setName(StrUtil.isBlank(fileName) ? file.getName() : fileName);
                f.setSize(FileUtil.size(file));
                f.setType(FileUtil.getType(file));
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
            FileUtil.del(file);
            //将文件上传至本地或者第三方服务中去
            return ResultUtil.data(result);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultUtil.error(501, e.getMessage());

        }
    }

    @RequestMapping("/hello")
    @ResponseBody
    public String hello(){
        return "hello";
    }

}
