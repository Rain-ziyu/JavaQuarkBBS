package com.quark.rest.service;

import com.quark.common.entity.UserRank;

import java.util.List;

public interface UserRankService {
    public void updateUserRank(Integer userId);
    public List<UserRank> getNowUserRankByUserId(Integer userId);
    public void insertSpecialUserRank(UserRank userRank);
}
