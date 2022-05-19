package com.quark.admin.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.quark.common.entity.Advertisement;


public interface AdvService {
    IPage<Advertisement> findBypage(Advertisement adv,Page<Advertisement> page);

    void delbyId(String[] id);

    void changeEnable(String[] id);
}
