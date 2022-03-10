package com.quark.rest.service;

import com.quark.common.base.BaseService;
import com.quark.common.entity.Collect;
import com.quark.common.entity.Posts;
import com.quark.common.entity.User;

import java.util.List;

public interface CollectService extends BaseService<Collect> {
    /**
     * 保存用户的收藏
     * @param user
     * @param posts
     */
    void saveCollect( User user, Posts posts);

    List<Collect> findByUser(User user);

    void deleteByUserIdAndPostId(String postId,User user);
}
