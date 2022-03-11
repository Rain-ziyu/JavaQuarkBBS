package com.quark.common.mapper;

import com.quark.common.entity.Collect;
import com.quark.common.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CollectMapper {
    List<Collect> getCollectListByUserId(User user);
    void deleteByUserIdAndPostId (@Param("postId") Integer postId,@Param("user") User user);
    List<Collect> selectByUserIdAndPostId (@Param("postId")Integer postsId,@Param("userId")Integer userId);
}
