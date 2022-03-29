package com.quark.rest.controller;

import com.quark.common.base.BaseController;
import com.quark.common.dto.QuarkResult;
import com.quark.common.entity.Advertisement;
import com.quark.common.entity.Label;
import com.quark.common.entity.Posts;
import com.quark.rest.service.AdvertisementService;
import com.quark.rest.service.LabelService;
import com.quark.rest.service.PostsService;
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
    @ApiOperation("增加广告")
    @PutMapping
    public QuarkResult addAdv(@RequestBody Advertisement advertisement){
        QuarkResult result = restProcessor(() -> {
            advertisementService.saveAdv(advertisement);
            return QuarkResult.ok();
        });
        return result;
    }

}
