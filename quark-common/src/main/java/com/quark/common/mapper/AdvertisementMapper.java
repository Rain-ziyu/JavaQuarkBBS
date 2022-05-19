package com.quark.common.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Constants;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.quark.common.entity.Advertisement;
import com.quark.common.entity.MyReply;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

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


    IPage<Advertisement> findBypage(@Param("id") Integer id,
                                    @Param("name") String name,
                                    @Param("status") Integer status,
                                    @Param("telephone") String telephone,
                                    Page<Advertisement> page);

    void delbyId(String id);

    Advertisement findByid(String id);

    void changeEnable(@Param("id") String s,
                      @Param("status") Integer status);
}
