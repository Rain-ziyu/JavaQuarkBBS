package com.quark.common.mapper;

import com.quark.common.entity.Collect;
import com.quark.common.entity.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CollectMapper {
    List<Collect> getCollectListByUserId(User user);
    void deleteByUserIdAndPostId (String postId,User user);
}
