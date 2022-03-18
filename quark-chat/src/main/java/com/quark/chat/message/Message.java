package com.quark.chat.message;

import lombok.Data;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

@Data
public abstract class Message implements Serializable {

    public static Class<?> getMessageClass(int messageType) {
        return messageClasses.get(messageType);
    }

    private int sequenceId;

    private int messageType;

    public abstract int getMessageType();

    public static final int LoginRequestMessage = 0;
    public static final int LoginResponseMessage = 1;
    public static final int ChatRequestMessage = 2;
    public static final int ChatResponseMessage = 3;
    public static final int GroupCreateRequestMessage = 4;
    public static final int GroupCreateResponseMessage = 5;
    public static final int GroupJoinRequestMessage = 6;
    public static final int GroupJoinResponseMessage = 7;
    public static final int GroupQuitRequestMessage = 8;
    public static final int GroupQuitResponseMessage = 9;
    public static final int GroupChatRequestMessage = 10;
    public static final int GroupChatResponseMessage = 11;
    public static final int GroupMembersRequestMessage = 12;
    public static final int GroupMembersResponseMessage = 13;
    //Ping消息(client)
    public static final int PING_CODE = 0x01;
    //Pong消息(server)
    public static final int PONG_CODE = 0x02;
    //认证消息(client)
    public static final int AUTH_REQUEST_CODE = 0x03;
    //认证消息(server)
    public static final int AUTH_RESPONSE_CODE = 0x04;
    //消息(client)
    public static final int MESSAGE_REQUEST_CODE = 0x05;
    //消息(server)
    public static final int MESSAGE_RESPONSE_CODE = 0x06;
    //在线人数消息
    public static final int SYS_USERSINFO_CODE = 0x07;
    //系统消息
    public static final int SYS_MESSAGE_CODE = 0x08;
    //系统错误消息
    public static final int SYS_ERRORMESSAGE_CODE = 0x09;
    public static final int RPC_MESSAGE_TYPE_REQUEST = 101;
    public static final int RPC_MESSAGE_TYPE_RESPONSE = 102;
    public static final int PingMessage = 103;
    private static final Map<Integer, Class<?>> messageClasses = new HashMap<>();

    static {
        messageClasses.put(ChatRequestMessage, ChatRequestMessage.class);
        messageClasses.put(ChatResponseMessage, ChatResponseMessage.class);
    }
}
