package com.quark.rest.service.impl;

import com.quark.common.entity.Rank;
import com.quark.common.entity.UserLevel;
import com.quark.common.entity.UserRank;
import com.quark.common.mapper.UserLevelMapper;
import com.quark.rest.service.UserLevelService;
import com.quark.rest.service.UserRankService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

import static com.quark.rest.utils.DateUtils.JudgeSameDay;

@Service
public class UserLevelServiceImpl implements UserLevelService {
    @Autowired
    private UserLevelMapper userLevelMapper;
    @Autowired
    private UserRankService userRankService;
    @Override
    public void updateUserLevel(UserLevel userLevel) {
        userLevelMapper.updateUserLevelByUserId(userLevel);
    }

    @Override
    public void insertUserLevel(Integer userId) {
        UserLevel userLevel = new UserLevel();
        userLevel.setUserId(userId);
        Rank rank = Rank.getDefaultRank();
//        设置默认头衔
        userLevel.setUserLevel(0);
        userLevel.setUserExp(0);
        userLevel.setUseingRank(rank);
        UserRank userRank = new UserRank();
        userRank.setUserRank(rank);
        userRank.setUserId(userId);
//        这里使用特殊头衔赋予的方法来赋予默认头衔
        userRankService.insertSpecialUserRank(userRank);
        userLevelMapper.insertUserLevel(userLevel);
    }

    @Override
    public UserLevel getUserLevelByUserId(Integer userId) {
        return userLevelMapper.selectUserLevelByUserId(userId);
    }

    @Override
    public List<UserLevel> getAllUserLevel() {
        return userLevelMapper.selectAllUserLevel();
    }

    @Override
    public void updateUserLoginTime(Integer userid) {
        UserLevel userLevelByUserId = getUserLevelByUserId(userid);
        Date date = new Date();
//        这样判断的话每次统计的其实是上一天该用户的最早登陆时间  userLevelByUserId.getLastLoginTime()等于null时可能是刚注册的账户
        if(userLevelByUserId.getLastLoginTime()==null||!JudgeSameDay(userLevelByUserId.getLastLoginTime(),date)){
        UserLevel userLevel = new UserLevel();
        userLevel.setLastLoginTime(date);
        userLevel.setUserId(userid);
//        每天获得5经验
        userLevel.setUserExp(userLevelByUserId.getUserExp()+5);
//        更新用户等级、登陆时间信息 注意先更新用户等级，在更新用户头衔
        userLevelMapper.updateUserLevelByUserId(userLevel);
//        更新用户头衔信息
        userRankService.updateUserRank(userid);

        }

    }

    @Override
    public void userSendPosts(Integer userId) {
        UserLevel userLevelByUserId = getUserLevelByUserId(userId);
        UserLevel userLevel = new UserLevel();
        userLevel.setUserId(userId);
//        每次获得6经验
        userLevel.setUserExp(userLevelByUserId.getUserExp()+6);
        userLevelMapper.updateUserLevelByUserId(userLevel);
        userRankService.updateUserRank(userId);
    }
}
