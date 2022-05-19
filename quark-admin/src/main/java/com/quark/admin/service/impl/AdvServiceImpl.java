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
    @Override
    @Transactional
    public void delbyId(String[] id) {
        for (String s : id) {
            advertisementMapper.delbyId(s);
        }
    }

    @Override
    public void changeEnable(String[] id) {
        for (String s : id) {
           Advertisement adv=  advertisementMapper.findByid(s);
           Integer status = adv.getStatus();
           if (status==1){
               status=0;
               advertisementMapper.changeEnable(s,status);
           }else{
               status=1;
               advertisementMapper.changeEnable(s,status);
           }
        }
    }
}
