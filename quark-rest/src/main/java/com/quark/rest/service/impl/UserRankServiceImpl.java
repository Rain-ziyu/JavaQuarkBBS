package com.quark.rest.service.impl;

import com.quark.common.entity.UserRank;
import com.quark.common.mapper.UserRankMapper;
import com.quark.rest.service.UserRankService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserRankServiceImpl implements UserRankService {
@Autowired
private UserRankMapper userRankMapper;

    @Override
    public void updateUserRank(Integer userId) {
     UserRank ranks = userRankMapper.selectRankByUserId(userId);

     userRankMapper.saveUserRank(ranks);

    }

    @Override
    public UserRank getNowUserRankByUserId(Integer userId) {
        return userRankMapper.selectNowUserRankByUserId(userId);
    }

    @Override
    public void insertSpecialUserRank(UserRank userRank) {
       userRankMapper.saveUserRank(userRank);
    }
}
