package com.quark.rest.controller;

import com.quark.common.base.BaseController;
import com.quark.common.dto.QuarkResult;
import com.quark.common.entity.User;
import com.quark.rest.param.CollectParam;
import com.quark.rest.service.RedisService;
import com.quark.rest.service.UserService;
import com.quark.rest.utils.GenerateUniqueID;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author User
 * 用于获取用户历史消息
 */
@CrossOrigin
@Api(value = "获取历史消息")
@RestController
@RequestMapping("/Chat")
public class ChatController extends BaseController {
    @Autowired
    private RedisService redisService;
    @Autowired
    private UserService userService;
    @ApiOperation("根据fromId和userId获取")
    @GetMapping
    public QuarkResult getChatHistoryById(String fromToken,Integer toId,Integer begin,Integer end){
        QuarkResult result = restProcessor(() -> {
            User user = userService.getUserByToken(fromToken);
            String generateID = GenerateUniqueID.GenerateID(user.getId(), toId);
            List listValue = redisService.getListValue(generateID, begin, end);
            return QuarkResult.ok(listValue);
        });
        return result;
    }
}
