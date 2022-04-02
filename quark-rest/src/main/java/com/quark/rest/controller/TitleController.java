package com.quark.rest.controller;

import com.quark.common.base.BaseController;
import com.quark.common.dto.QuarkResult;
import com.quark.common.entity.*;
import com.quark.rest.service.*;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
    private UserService userService;
    @ApiOperation("获取所有的头衔")
    @GetMapping("/all")
    public QuarkResult getRank(){
        QuarkResult result = restProcessor(() -> {
            List<Rank> ranks = titleService.selectAllRank();
            return QuarkResult.ok(ranks);
        });
        return result;
    }
    @ApiOperation("获取用户以获得的头衔")
    @GetMapping
    public QuarkResult getNowUserRank(String token){
        QuarkResult result = restProcessor(() -> {
            User userByToken = userService.getUserByToken(token);
            List<UserRank> nowUserRankByUserId = userRankService.getNowUserRankByUserId(userByToken.getId());
            return QuarkResult.ok(nowUserRankByUserId);
        });
        return result;
    }
}
