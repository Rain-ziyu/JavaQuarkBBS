package com.quark.rest.service.impl;

import com.quark.common.entity.Advertisement;
import com.quark.common.mapper.AdvertisementMapper;
import com.quark.rest.service.AdvertisementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdvertisementServiceImpl implements AdvertisementService {
@Autowired
    AdvertisementMapper advertisementMapper;
    @Override
    public List<Advertisement> getAdvByLabel(String label) {
        return advertisementMapper.getAdvListByLabel(label);
    }
    @Override
    public void updateByAdv(Advertisement advertisement) {
        advertisementMapper.updateAdv(advertisement);
    }

    @Override
    public List<Advertisement> getAdvAll() {
        return advertisementMapper.getAdvList();
    }

    @Override
    public void saveAdv(Advertisement advertisement) {
        advertisementMapper.saveAdv(advertisement);
    }
}
