package com.quark.common.mapper;

import com.quark.common.entity.Advertisement;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author User
 */
@Mapper
public interface AdvertisementMapper {
    public List<Advertisement> getAdvList();
    public void saveAdv(Advertisement advertisement);
    public void updateAdv(Advertisement advertisement);
    public List<Advertisement> getAdvListByLabel(String label);

    List<Advertisement> getAdvListByUserId(Integer id);
}
