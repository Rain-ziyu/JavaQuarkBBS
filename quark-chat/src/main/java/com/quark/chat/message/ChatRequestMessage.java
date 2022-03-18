package com.quark.chat.message;

import com.quark.common.entity.User;
import lombok.Data;
import lombok.ToString;

@Data
@ToString(callSuper = true)
public class ChatRequestMessage extends Message {
    private String content;
    private User to;
    private User from;

    public ChatRequestMessage() {
    }

    public ChatRequestMessage(User from, User to, String content) {
        this.from = from;
        this.to = to;
        this.content = content;
    }

    @Override
    public int getMessageType() {
        return ChatRequestMessage;
    }
}
