package com.quark.chat;

import com.quark.chat.handler.UserAuthHandler;
import com.quark.chat.service.ChannelManager;
import com.quark.chat.service.ChatService;
import com.quark.common.dao.UserDao;
import com.quark.common.entity.User;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;

/**
 * @Author : ChinaLHR
 * @Date : Create in 10:01 2017/10/22
 * @Email : 13435500980@163.com
 */

@TestPropertySource(locations = {"classpath:chat.properties"})
@SpringBootTest
public class ChatApplicationTest {

    @Autowired
    private UserDao userDao;

    @Autowired
    private ChatService chatService;

    @Autowired
    private ChannelManager manager;

    @Autowired
    private UserAuthHandler handler;
    @Test
    public void testUserDao() {
        User user = userDao.getOne(2);
        System.out.println(user);
    }

    @Test
    public void testNumber() {
        byte a = 0x10;
       System.out.println(a);
    }

    @Test
    public void testService(){
//       handler.test();
    }

}
