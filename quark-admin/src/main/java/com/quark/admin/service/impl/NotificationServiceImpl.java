package com.quark.admin.service.impl;

import com.quark.admin.service.NotificationService;
import com.quark.common.base.BaseServiceImpl;
import com.quark.common.dao.NotificationDao;
import com.quark.common.entity.Notification;
import com.quark.common.entity.Posts;
import com.quark.common.entity.Reply;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class NotificationServiceImpl extends BaseServiceImpl<NotificationDao, Notification> implements NotificationService {
    /**
     * 方法<code></code>作用为：
     * 将ReplyId转化为关联表Notify的postid并删除
     * @author User
     * @throws
     * @return
     */
    @Override
    public void deleteByReply(Posts[] posts) {
        for (Posts post : posts) {
          repository.deleteByPosts(post);
        }

    }
}
