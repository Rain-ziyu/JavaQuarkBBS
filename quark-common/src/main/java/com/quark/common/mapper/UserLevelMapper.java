package com.quark.common.mapper;

import com.quark.common.entity.UserLevel;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author User
 */
@Mapper
public interface UserLevelMapper {
    public void updateUserLevelByUserId(UserLevel userLevel);
    public UserLevel selectUserLevelByUserId(Integer userId);
    public List<UserLevel> selectAllUserLevel();
    public void insertUserLevel(UserLevel userLevel);
}
