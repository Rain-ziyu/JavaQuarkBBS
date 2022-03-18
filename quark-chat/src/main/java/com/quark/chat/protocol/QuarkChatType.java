package com.quark.chat.protocol;

import com.quark.chat.message.*;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author : ChinaLHR
 * @Date : Create in 16:37 2017/10/23
 * @Email : 13435500980@163.com
 *
 * 消息类型的定义
 */
public class QuarkChatType {

    public static final byte PING_CODE = 0x01;//Ping消息(client)
    public static final byte PONG_CODE = 0x02;//Pong消息(server)
    public static final byte AUTH_REQUEST_CODE = 0x03;//认证消息(client)
    public static final byte AUTH_RESPONSE_CODE = 0x04;//认证消息(server)
    public static final byte MESSAGE_REQUEST_CODE = 0x05;//消息(client)
    public static final byte MESSAGE_RESPONSE_CODE = 0x06;//消息(server)
    public static final byte SYS_USERSINFO_CODE = 0x07;//在线人数消息
    public static final byte SYS_MESSAGE_CODE = 0x08;//系统消息
    public static final byte SYS_ERRORMESSAGE_CODE = 0x09;//系统错误消息
    public static final byte User_MESSAGE_REQUEST_CODE = 0x10;//用户私聊消息(server)
    public static final byte User_MESSAGE_RESPONSE_CODE = 0x11;//用户私聊消息(client)
    private static final Map<Byte, Class<?>> messageClasses = new HashMap<>();
    static {
        messageClasses.put(User_MESSAGE_REQUEST_CODE, ChatRequestMessage.class);
    }

    public static Class<?> getMessageClass(int messageType) {
        return messageClasses.getOrDefault(messageType,String.class);
    }
    }
