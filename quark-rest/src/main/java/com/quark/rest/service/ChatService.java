package com.quark.rest.service;

import com.quark.common.base.BaseService;
import com.quark.common.entity.Chat;

import java.util.List;

public interface ChatService  {
    public List<Chat> selectChatList (Integer userId);
    public void creatChat(Chat chat);
}
