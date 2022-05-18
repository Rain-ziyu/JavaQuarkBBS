package com.quark.rest.controller;

import com.quark.common.base.BaseController;
import com.quark.common.dto.QuarkResult;
import com.quark.common.entity.Label;
import com.quark.rest.service.LabelService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


/**
 * @Author LHR
 * Create By 2017/8/27
 */
@CrossOrigin
@Api(value = "标签接口",description = "获取标签")
@RestController
@RequestMapping("/label")
public class LabelController extends BaseController{

    @Autowired
    private LabelService labelService;


    @ApiOperation("获取标签")
    @GetMapping
    public QuarkResult getAllLabel(){
        QuarkResult result = restProcessor(() -> {
            List<Label> labels = labelService.findAll();
            return QuarkResult.ok(labels);
        });
        return result;
    }
    @ApiOperation("新增标签")
    @PutMapping
    public QuarkResult addNewLabel(@RequestBody Label label){
        logger.info("");
        QuarkResult result = restProcessor(() -> {
            Label label1 = labelService.save(label);
            return QuarkResult.ok();
        });
        return result;
    }

}
