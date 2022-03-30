package com.quark.common.dto;

import com.quark.common.entity.User;
import lombok.Data;
import lombok.ToString;

import java.io.Serializable;
import java.util.Date;

/**
 * WebSocket通知消息类
 * Create By 2017/9/6
 */
@ToString
@Data
public class SocketMessage implements Serializable{
    private String messageId;
    private Long alreadyCount;
    private Integer notice;
    private User from;
    private Integer to;
    private String time;
    public User getFrom() {
        return from;
    }

    public void setFrom(User from) {
        this.from = from;
    }

    private String message;

    public Integer getNotice() {
        return notice;
    }

    public void setNotice(Integer notice) {
        this.notice = notice;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public SocketMessage() {
    }

    public SocketMessage(Integer notice, String message) {
        this.notice = notice;
        this.message = message;
    }

    public SocketMessage(Integer notice) {
        this.notice = notice;
    }

    public static SocketMessage build(Integer notice){
        return new SocketMessage(notice);
    }

    public static SocketMessage build(Integer notice,String message){
        return new SocketMessage(notice,message);
    }
}
