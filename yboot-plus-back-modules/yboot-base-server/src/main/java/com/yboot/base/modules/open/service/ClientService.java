package com.yboot.base.modules.open.service;

import com.yboot.base.modules.open.dao.ClientDao;
import com.yboot.common.base.YbootBaseService;
import com.yboot.common.common.vo.SearchVo;
import com.yboot.base.modules.open.entity.Client;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

/**
 * 客户端接口
 * @author 田培融
 */
public interface ClientService extends YbootBaseService<ClientDao,Client, String> {

    /**
    * 多条件分页获取
    * @param client
    * @param searchVo
    * @param pageable
    * @return
    */
    Page<Client> findByCondition(Client client, SearchVo searchVo, Pageable pageable);

}