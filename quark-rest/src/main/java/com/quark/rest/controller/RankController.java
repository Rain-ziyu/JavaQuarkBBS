package com.quark.rest.controller;

import com.quark.common.base.BaseController;
import com.quark.common.dto.QuarkResult;
import com.quark.rest.service.RankService;
import com.quark.rest.service.RedisService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.concurrent.locks.ReentrantLock;

/**
 * @Author LHR
 * Create By 2017/8/31
 */
@CrossOrigin
@Api(value = "排行榜接口", description = "七天内热帖排行榜,七天内新注册用户排行榜")
@RestController
@RequestMapping("/rank")
public class RankController extends BaseController {
    private ReentrantLock reentrantLock = new ReentrantLock();
    @Autowired
    private RankService rankService;

    @Autowired
    private RedisService<List<Object>> redisService;

    @Value("${REDIS_RANK_POSTS}")
    private String REDIS_RANK_POSTS;

    @Value("${REDIS_RANK_USERS}")
    private String REDIS_RANK_USERS;

    @ApiOperation("获取一个月内热帖排行榜")
    @GetMapping("/topPosts")
    public QuarkResult getTotPosts() {
        QuarkResult result = restProcessor(() -> {
            List<Object> hot = redisService.getString(REDIS_RANK_POSTS);
            if (hot != null) {
                return QuarkResult.ok(hot);
            }
            //            此处使用reentrantLock来进行防止缓存击穿
            if(reentrantLock.tryLock()) {
                hot = rankService.findPostsRank();
                redisService.cacheString(REDIS_RANK_POSTS, hot, 1);
                reentrantLock.unlock();
            }else {
                Thread.sleep(100L);
                return  getTotPosts();
            }
            return QuarkResult.ok(hot);
        });
        return result;
    }

    @ApiOperation("获取一个月内新活跃的用户")
    @GetMapping("/newUsers")
    public QuarkResult getNewUser() {
        QuarkResult result = restProcessor(() -> {
            List<Object> users = redisService.getString(REDIS_RANK_USERS);
            if (users != null) return QuarkResult.ok(users);
//            此处使用reentrantLock来进行防止缓存击穿
            if(reentrantLock.tryLock()) {
                users = rankService.findUserRank();
                redisService.cacheString(REDIS_RANK_USERS, users, 1);
                reentrantLock.unlock();
            }else {
                Thread.sleep(100L);
                return  getNewUser();
            }
            return QuarkResult.ok(users);
        });
        return result;
    }

}
