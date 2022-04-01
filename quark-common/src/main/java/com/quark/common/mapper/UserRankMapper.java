package com.quark.common.mapper;

import com.quark.common.entity.UserRank;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface UserRankMapper {
    public void saveUserRank(UserRank userRank);
    public List<UserRank> selectUserRankByUserId(Integer userId);
}
