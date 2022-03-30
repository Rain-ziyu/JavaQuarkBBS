package com.quark.rest.service.impl;

import com.quark.common.entity.Chat;
import com.quark.common.mapper.ChatMapper;
import com.quark.rest.service.ChatService;
import com.quark.rest.utils.GenerateUniqueID;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ChatServiceImpl implements ChatService {
@Autowired
private ChatMapper chatMapper;
    @Override
    public List<Chat> selectChatList(Integer userId) {

        return chatMapper.selectChat(userId);
    }

    @Override
    public void creatChat(Chat chat) {
        String chatId = GenerateUniqueID.GenerateID(chat.getFirstUserId(), chat.getSecondUserId());
        chat.setChatId(chatId);
        chatMapper.creatChat(chat);
    }
}
