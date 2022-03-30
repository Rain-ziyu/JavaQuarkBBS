package com.quark.common.entity;

import lombok.Data;

@Data
public class Chat {
    private Integer firstUserId;
    private Integer secondUserId;
    private String chatId;
    public Integer getAnother(Integer userId){
        if(userId.equals(firstUserId)){
            return secondUserId;
        }
        return firstUserId;
    }
}
