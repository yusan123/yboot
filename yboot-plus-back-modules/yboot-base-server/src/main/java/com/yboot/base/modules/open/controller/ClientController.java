package com.yboot.base.modules.open.controller;

import com.yboot.common.base.YbootBaseController;
import com.yboot.common.common.utils.PageUtil;
import com.yboot.common.common.utils.ResultUtil;
import com.yboot.common.common.vo.PageVo;
import com.yboot.common.common.vo.Result;
import com.yboot.common.common.vo.SearchVo;
import com.yboot.base.modules.open.entity.Client;
import com.yboot.base.modules.open.service.ClientService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.UUID;

/**
 * @author 田培融
 */
@Slf4j
@RestController
@Api(description = "客户端管理接口")
@RequestMapping("/base/client")
@Transactional
public class ClientController extends YbootBaseController<Client, String> {

    @Autowired
    private ClientService clientService;

    @Override
    public ClientService getService() {
        return clientService;
    }

    @RequestMapping(value = "/getName/{clientId}", method = RequestMethod.GET)
    @ApiOperation(value = "获取网站基本信息")
    public Result<String> getName(@PathVariable String clientId){

        Client client = clientService.get(clientId);
        return new ResultUtil<String>().setData(client.getName());
    }


    @RequestMapping(value = "/getByCondition", method = RequestMethod.GET)
    @ApiOperation(value = "多条件分页获取")
    public Result<Page<Client>> getByCondition(Client client,
                                               SearchVo searchVo,
                                               PageVo pageVo){

        Page<Client> page = clientService.findByCondition(client, searchVo, PageUtil.initPage(pageVo));
        return new ResultUtil<Page<Client>>().setData(page);
    }

    @RequestMapping(value = "/getSecretKey", method = RequestMethod.GET)
    @ApiOperation(value = "生成随机secretKey")
    public Result<String> getSecretKey(){

        String secretKey = UUID.randomUUID().toString().replaceAll("-", "");
        return new ResultUtil<String>().setData(secretKey);
    }
}
