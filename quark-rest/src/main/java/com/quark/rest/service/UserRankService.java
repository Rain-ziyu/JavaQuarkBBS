package com.quark.rest.service;

import com.quark.common.entity.UserRank;

public interface UserRankService {
    public void updateUserRank(Integer userId);
    public UserRank getNowUserRankByUserId(Integer userId);
    public void insertSpecialUserRank(UserRank userRank);
}
