package com.quark.rest.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.quark.common.base.BaseController;
import com.quark.common.dto.QuarkResult;
import com.quark.common.entity.*;
import com.quark.rest.service.*;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
@RequestMapping("/title")
public class TitleController extends BaseController {
    @Autowired
    private TitleService titleService;
    @Autowired
    private UserRankService userRankService;
    @Autowired
    private UserLevelService userLevelService;
    @Autowired
    private UserService userService;
    @ApiOperation("获取所有的头衔")
    @GetMapping("/all")
    public QuarkResult getRank(Integer current){
        QuarkResult result = restProcessor(() -> {
            Page page = new Page<>(current, 6);
            Page<Rank> ranks = titleService.selectAllRank(page);
            return QuarkResult.ok(ranks);
        });
        return result;
    }
    @ApiOperation("获取用户以获得的头衔")
    @GetMapping
    public QuarkResult getNowUserRank(String token){
        QuarkResult result = restProcessor(() -> {
            User userByToken = userService.getUserByToken(token);
           UserRank nowUserRankByUserId = userRankService.getNowUserRankByUserId(userByToken.getId());
            return QuarkResult.ok(nowUserRankByUserId);
        });
        return result;
    }

    @ApiOperation("用户佩戴头衔")
    @PostMapping
    public QuarkResult wearRank(String token,@RequestBody Rank rank){
        QuarkResult result = restProcessor(() -> {
            User userByToken = userService.getUserByToken(token);
            userLevelService.wearRank(userByToken,rank);
            return QuarkResult.ok();
        });
        return result;
    }
}
