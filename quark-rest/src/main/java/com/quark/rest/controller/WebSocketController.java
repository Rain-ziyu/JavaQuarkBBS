package com.quark.rest.controller;

import com.quark.common.dto.SocketMessage;
import com.quark.rest.param.ReturnParam;
import com.quark.rest.service.RedisService;
import com.quark.rest.service.impl.WordReplaceServiceImpl;
import com.quark.rest.utils.GenerateUniqueID;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.annotation.SendToUser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;

/**
 * @Author LHR
 * Create By 2017/9/6
 */
@CrossOrigin
@Api(value = "WebSocket接口", description = "用于服务器端对客户都进行消息推送")
@Controller
@Slf4j
public class WebSocketController {

    public SimpMessagingTemplate template;
@Autowired
private WordReplaceServiceImpl wordReplaceService;
    @Autowired
    private RedisService redisService;

    @Autowired
    public WebSocketController(SimpMessagingTemplate template) {
        this.template = template;
    }

    @ApiOperation("WebSocket广播接口：客户端可以在/topic/all监听并接受服务端发回的消息")
    @MessageMapping("/topic/all")
    @SendTo("/topic/all")
    public SocketMessage sendToAll(SocketMessage message) {
        log.info(message.toString());
        return message;
    }

    @ApiOperation("处理客户端回传")
    @MessageMapping("/client/return")
    public void clientReturn(ReturnParam message) {
        log.info(message.toString());
        redisService.cacheString("AlreadyChat:"+message.getMessageId(), message.getAlreadyCount());
    }

    @ApiOperation("WebSocket单播：客户端接收一对一消息的主题应该是“/user/” + 用户Id + “/message” ")
    @MessageMapping("/user")
    public void sendToUser(SocketMessage message) {
        Integer fromUserKey = message.getFrom().getId();
        Integer toUserKey = message.getTo();
        String generateID = GenerateUniqueID.GenerateID(fromUserKey, toUserKey);
        Long listLength = redisService.getListLength(generateID);
        message.setAlreadyCount(listLength + 1);
        message.setMessageId(generateID);
        message.setMessage(wordReplaceService.illegalWordsReplace(message.getMessage()));
        template.convertAndSendToUser(message.getTo() + "", "/message", message);
//        设置缓存，以缓存用户聊天
        redisService.setListValue(generateID, message);
        redisService.cacheString("AlreadyChat:"+GenerateUniqueID.GenerateIDNo(message.getFrom().getId(), message.getTo()), message.getAlreadyCount());
        redisService.setListTime(generateID, 60 * 24 * 7);
    }


}
