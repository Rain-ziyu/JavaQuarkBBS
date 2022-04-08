package com.quark.common;

import com.quark.common.dao.LabelDao;
import com.quark.common.dao.NotificationDao;
import com.quark.common.dao.PostsDao;
import com.quark.common.dao.UserDao;

import com.quark.common.entity.Collect;
import com.quark.common.entity.User;
import com.quark.common.entity.UserRank;
import com.quark.common.mapper.CollectMapper;
import com.quark.common.mapper.UserLevelMapper;
import com.quark.common.mapper.UserRankMapper;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.test.context.junit4.SpringRunner;

import javax.sql.DataSource;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

/**
 * Created by lhr on 17-7-30.
 */

@EnableCaching//缓存支持
@SpringBootTest
@Slf4j
public class CommonApplicationTest {

    @Autowired
    private DataSource dataSource;

    @Autowired
    private UserDao UserDao;
@Autowired
private CollectMapper collectMapper;
    @Autowired
    private PostsDao postsDao;

    @Autowired
    private LabelDao labelDao;

    @Autowired
    private NotificationDao notificationDao;
@Autowired
private UserRankMapper userRankMapper;
    @Test
    public void TestDataSource(){
//        long count = notificationDao.getNotificationCount(72);
//        System.out.println(count);
//        List<Notification> list = notificationDao.getByTouser(UserDao.findOne(2));
//        System.out.println(list);
//        list.forEach(t->{
//            System.out.println(t.getPosts().getTitle());
//        });
       UserRank userRanks = userRankMapper.selectNowUserRankByUserId(1);
        log.info(String.valueOf(userRanks));
    }
}
