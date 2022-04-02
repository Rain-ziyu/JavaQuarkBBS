package com.quark.rest.service.impl;

import com.quark.common.entity.Rank;
import com.quark.common.entity.UserRank;
import com.quark.common.mapper.RankMapper;
import com.quark.common.mapper.UserRankMapper;
import com.quark.rest.service.UserRankService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserRankServiceImpl implements UserRankService {
@Autowired
private UserRankMapper userRankMapper;

    @Override
    public void updateUserRank(Integer userId) {
        List<UserRank> ranks = userRankMapper.selectRankByUserId(userId);
        for (UserRank userRank : ranks) {
            userRankMapper.saveUserRank(userRank);
        }
    }

    @Override
    public List<UserRank> getNowUserRankByUserId(Integer userId) {
        return userRankMapper.selectNowUserRankByUserId(userId);
    }

    @Override
    public void insertSpecialUserRank(UserRank userRank) {
       userRankMapper.saveUserRank(userRank);
    }
}
