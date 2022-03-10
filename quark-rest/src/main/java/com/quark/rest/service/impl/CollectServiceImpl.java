package com.quark.rest.service.impl;

import com.quark.common.base.BaseServiceImpl;
import com.quark.common.dao.CollectDao;
import com.quark.common.dao.PostsDao;
import com.quark.common.entity.Collect;
import com.quark.common.entity.Posts;
import com.quark.common.entity.User;
import com.quark.common.exception.ServiceProcessException;
import com.quark.common.mapper.CollectMapper;
import com.quark.rest.service.CollectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

/**
 * @author wwl
 */
@Service
public class CollectServiceImpl extends BaseServiceImpl<CollectDao, Collect> implements CollectService {
    @Autowired
    CollectDao collectDao;
    @Autowired
    PostsDao postsDao;
    @Autowired
    CollectMapper collectMapper;
    @Override
    public void saveCollect(User user, Posts posts) {
        Optional<Posts> optional = postsDao.findById(posts.getId());

        if (optional.isPresent()) {
            posts = optional.get();
            Collect collect = new Collect();
            collect.setPosts(posts);
            collect.setUser(user);
            collect.setInitTime(new Date());
            collectDao.save(collect);
        } else {
            throw new ServiceProcessException("该帖子不存在，或已被删除");
        }

    }

    @Override
    public List<Collect> findByUser(User user) {
        List<Collect> collectListByUserId = collectMapper.getCollectListByUserId(user);
        return collectListByUserId;
    }

    @Override
    public void deleteByUserIdAndPostId(String postId ,User user) {
        collectMapper.deleteByUserIdAndPostId(postId,user);
    }
}
