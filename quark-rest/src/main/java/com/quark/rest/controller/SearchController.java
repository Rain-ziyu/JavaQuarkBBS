package com.quark.rest.controller;

import com.quark.common.base.BaseController;
import com.quark.common.dto.QuarkResult;
import com.quark.common.entity.SearchKeyWord;
import com.quark.rest.service.RedisService;
import com.quark.rest.service.SearchKeyWordService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.concurrent.locks.ReentrantLock;

/**
 * @author User
 */
@CrossOrigin
@Api(value = "搜索接口")
@RestController
@RequestMapping("/search")
public class SearchController extends BaseController {
    private ReentrantLock reentrantLock = new ReentrantLock();
    @Value("${REDIS_KEY_WORDS}")
    private String REDIS_KEY_WORDS;
    @Autowired
    private SearchKeyWordService searchKeyWordService;
    @Autowired
    private RedisService redisService;

    @ApiOperation("根据搜索框内容搜索并保存")
    @PutMapping
//    一般在调用完搜索之后调用该方法
    public QuarkResult getResult( String keyWord) {
        QuarkResult result = restProcessor(() -> {
            //   存储搜索词
            searchKeyWordService.saveKeyWord(keyWord);
            return QuarkResult.ok();
        });
        return result;
    }

    @ApiOperation("获取热门搜索词")
    @GetMapping
    public QuarkResult getKeyWord() {
        QuarkResult result = restProcessor(() -> {
            List listValue = redisService.getListValue(REDIS_KEY_WORDS, 0, 11);
            if (listValue.isEmpty()) {
                if (reentrantLock.tryLock()) {
                    List<SearchKeyWord> searchKeyWords = searchKeyWordService.searchCount();
                    redisService.setListValue(REDIS_KEY_WORDS, searchKeyWords);
                    redisService.setListTime(REDIS_KEY_WORDS, 60);
                    reentrantLock.unlock();
                    return QuarkResult.ok(searchKeyWords);
                } else {
                    Thread.sleep(100L);
                    return getKeyWord();
                }
            }
            return QuarkResult.ok(listValue);
        });
        return result;
    }
}
