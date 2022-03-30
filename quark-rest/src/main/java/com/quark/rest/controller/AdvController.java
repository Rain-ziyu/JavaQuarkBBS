package com.quark.rest.controller;

import com.quark.common.base.BaseController;
import com.quark.common.dto.QuarkResult;
import com.quark.common.entity.Advertisement;
import com.quark.common.entity.Label;
import com.quark.common.entity.Posts;
import com.quark.common.entity.User;
import com.quark.rest.param.AdvParam;
import com.quark.rest.service.AdvertisementService;
import com.quark.rest.service.LabelService;
import com.quark.rest.service.PostsService;
import com.quark.rest.service.UserService;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@CrossOrigin
@RestController
@RequestMapping("/adv")
public class AdvController extends BaseController {
    @Autowired
    private PostsService postsService;
    @Autowired
    private LabelService labelService;
    @Autowired
    private UserService userService;
    @Autowired
    private AdvertisementService advertisementService;
    @ApiOperation("根据帖子标签获取对应推荐的广告")
    @GetMapping
    public QuarkResult getAdvByPosts(Integer postsId){
        QuarkResult result = restProcessor(() -> {
            Posts posts = postsService.findOne(postsId);
            Label label = posts.getLabel();
            List<Advertisement> advByLabel = advertisementService.getAdvByLabel(String.valueOf(label.getId()));
            return QuarkResult.ok(advByLabel);
        });
        return result;
    }
    @ApiOperation("根据帖子投放用户获取对应推荐的广告")
    @GetMapping("/getById")
    public QuarkResult getAdvByPosts(String token){
        QuarkResult result = restProcessor(() -> {
            User userByToken = userService.getUserByToken(token);
            List<Advertisement> advByLabel = advertisementService.getAdvByUserId(userByToken.getId());
            return QuarkResult.ok(advByLabel);
        });
        return result;
    }
    @ApiOperation("增加广告")
    @PutMapping
    public QuarkResult addAdv(@RequestBody AdvParam advParam){
        QuarkResult result = restProcessor(() -> {
            User userByToken = userService.getUserByToken(advParam.getToken());
            advParam.getAdv().setUserId(userByToken.getId());
            advertisementService.saveAdv(advParam.getAdv());
            return QuarkResult.ok();
        });
        return result;
    }

}
