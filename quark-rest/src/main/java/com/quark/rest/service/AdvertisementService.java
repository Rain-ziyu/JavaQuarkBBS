package com.quark.rest.service;

import com.quark.common.entity.Advertisement;

import java.util.List;

/**
 * @author User
 */
public interface AdvertisementService {
    public List<Advertisement> getAdvByLabel(String label);

    public void updateByAdv(Advertisement advertisement);
    public List<Advertisement> getAdvAll();
    public void saveAdv(Advertisement advertisement);
}
