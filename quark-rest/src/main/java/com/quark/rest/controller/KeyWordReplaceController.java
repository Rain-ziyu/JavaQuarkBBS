package com.quark.rest.controller;

import com.quark.common.base.BaseController;
import com.quark.common.dto.QuarkResult;
import com.quark.common.entity.Posts;
import com.quark.rest.service.impl.WordReplaceServiceImpl;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin
@Api(value = "敏感词处理",description = "替换敏感词")
@RestController
@RequestMapping("/replace")
public class KeyWordReplaceController extends BaseController {
    @Autowired
    private WordReplaceServiceImpl wordReplaceService;
    @GetMapping
    public QuarkResult replaceKeyWord(String word){
        QuarkResult result = restProcessor(() -> {
            String s = wordReplaceService.illegalWordsReplace(word);
            return QuarkResult.ok(s);
        });
        return result;
    }
}
