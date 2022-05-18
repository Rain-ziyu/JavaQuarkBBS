package com.quark.admin.service.impl;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.quark.admin.service.AdvService;
import com.quark.common.entity.Advertisement;
import com.quark.common.mapper.AdvertisementMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AdvServiceImpl implements AdvService {
    @Autowired
    AdvertisementMapper advertisementMapper;

    @Override
    public IPage<Advertisement> findBypage(Advertisement adv, Page<Advertisement> page) {
        Integer id =adv.getId();
        String name = adv.getName();
        Integer status = adv.getStatus();
        String telephone = adv.getTelephone();
        IPage<Advertisement> advpage = advertisementMapper.findBypage(id,name,status,telephone,page);
        return advpage;
    }
}
