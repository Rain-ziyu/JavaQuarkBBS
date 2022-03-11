package com.quark.rest.controller;

import com.quark.common.base.BaseController;
import com.quark.common.dto.QuarkResult;
import com.quark.common.entity.Collect;
import com.quark.common.entity.Label;
import com.quark.common.entity.Posts;
import com.quark.common.entity.User;
import com.quark.rest.param.CollectParam;
import com.quark.rest.service.CollectService;
import com.quark.rest.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@CrossOrigin
@Api(value = "收藏接口",description = "获取收藏")
@RestController
@RequestMapping("/collect")
public class CollectController extends BaseController {
    @Autowired
    CollectService collectService;
    @Autowired
    UserService userService;
    @ApiOperation("添加收藏")
    @PutMapping
    public QuarkResult addCollect(@RequestBody  CollectParam collectParam){
        QuarkResult result = restProcessor(() -> {
            User user = userService.getUserByToken(collectParam.getToken());
            collectService.saveCollect(user,collectParam.getPosts());
            return QuarkResult.ok();
        });
        return result;
    }
    @ApiOperation("获取用户的帖子收藏")
    @GetMapping
    public QuarkResult getCollect(String token){
        QuarkResult result = restProcessor(() -> {
            User user = userService.getUserByToken(token);
            List<Collect> collects = collectService.findByUser(user);
            return QuarkResult.ok(collects);
        });
        return result;
    }
    @ApiOperation("取消收藏")
    @DeleteMapping
    public QuarkResult delCollect(@RequestBody  CollectParam collectParam){
        QuarkResult result = restProcessor(() -> {
            User user = userService.getUserByToken(collectParam.getToken());
            collectService.deleteByUserIdAndPostId(collectParam.getPosts().getId(),user);
            return QuarkResult.ok();
        });
        return result;
    }
    @ApiOperation("获取用户的是否以对该帖子收藏")
    @GetMapping("/judge")
    public QuarkResult judgeCollect( String token,Integer postId){
        QuarkResult result = restProcessor(() -> {
            User user = userService.getUserByToken(token);
            return QuarkResult.ok(collectService.judgeCollect(postId,user.getId()));
        });
        return result;
    }

}
