package com.quark.admin.service;

import com.quark.common.base.BaseService;
import com.quark.common.entity.Notification;
import com.quark.common.entity.Posts;
import com.quark.common.entity.Reply;


public interface NotificationService extends BaseService<Notification> {

    void deleteByReply(Posts[] replies);
}
