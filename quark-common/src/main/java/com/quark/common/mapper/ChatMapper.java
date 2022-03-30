package com.quark.common.mapper;

import com.quark.common.entity.Chat;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ChatMapper {
    public List<Chat> selectChat (Integer userId);
    public void creatChat(Chat chat);
}
