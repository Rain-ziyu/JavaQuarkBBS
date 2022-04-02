package com.quark.rest.service;

import com.quark.common.entity.UserLevel;

import java.util.List;

/**
 * @author User
 */
public interface UserLevelService {
     public void updateUserLevel(UserLevel userLevel);
     public void insertUserLevel(Integer userId);
     public UserLevel getUserLevelByUserId(Integer userId);
     public List<UserLevel> getAllUserLevel();
     public void updateUserLoginTime(Integer userid);
     void userSendPosts(Integer id);
}
