package com.quark.rest.controller;

import com.quark.common.base.BaseController;
import com.quark.common.dto.QuarkResult;
import com.quark.common.entity.Chat;
import com.quark.common.entity.User;
import com.quark.rest.param.ChatReturnParam;
import com.quark.rest.param.CollectParam;
import com.quark.rest.service.ChatService;
import com.quark.rest.service.RedisService;
import com.quark.rest.service.UserService;
import com.quark.rest.utils.GenerateUniqueID;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

/**
 * @author User
 * 用于获取用户历史消息
 */
@CrossOrigin
@Api(value = "获取历史消息")
@RestController
@RequestMapping("/chat")
public class ChatController extends BaseController {
    @Autowired
    private RedisService redisService;
    @Autowired
    private UserService userService;
    @Autowired
    private ChatService chatService;
    @ApiOperation("根据fromId和userId获取历史消息")
    @GetMapping
    public QuarkResult getChatHistoryById(String fromToken,Integer toUserId,Integer begin,Integer end){
        QuarkResult result = restProcessor(() -> {
            User user = userService.getUserByToken(fromToken);
            String generateID = GenerateUniqueID.GenerateID(user.getId(), toUserId);
            List listValue = redisService.getListValue(generateID, begin, end);
            Collections.reverse(listValue);
            return QuarkResult.ok(listValue);
        });
        return result;
    }
    @ApiOperation("为两个用户创建会话")
    @PostMapping
    public QuarkResult creatChat(@RequestBody Chat chat){
        QuarkResult result = restProcessor(() -> {
            chatService.creatChat(chat);
            return QuarkResult.ok();
        });
        return result;
    }
    @ApiOperation("查询会话列表")
    @GetMapping("/list")
    public QuarkResult getChatList(String fromToken){
        QuarkResult result = restProcessor(() -> {
            User user = userService.getUserByToken(fromToken);
            List<Chat> chats = chatService.selectChatList(user.getId());
            List<ChatReturnParam> charUser = new ArrayList<>();
            for (Chat chat : chats) {
                 Integer another = chat.getAnother(user.getId());
                 String allKey = GenerateUniqueID.GenerateID(another,user.getId());
                 String key = GenerateUniqueID.GenerateIDNo(user.getId(),another);
                Integer count = (Integer) redisService.getString("AlreadyChat:"+key);
                Long listLength = redisService.getListLength(allKey);
                if(listLength==null){
                    listLength = Long.valueOf(0);
                }
                if(count==null){
                    count = 0;
                }
                ChatReturnParam chatReturnParam = new ChatReturnParam();
                chatReturnParam.setUser(userService.findOne(another));
                chatReturnParam.setCount((int) (listLength-count));
                charUser.add(chatReturnParam);
            }
            return QuarkResult.ok(charUser);
        });
        return result;
    }
}
