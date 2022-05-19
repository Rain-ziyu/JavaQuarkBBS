package com.quark.admin.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.quark.admin.service.AdvService;
import com.quark.common.base.BaseController;
import com.quark.common.dto.PageResult;
import com.quark.common.dto.QuarkResult;
import com.quark.common.entity.*;
import com.quark.common.mapper.AdvertisementMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;
/**
 *
 */

@RestController
@RequestMapping("/advertisements")

public class AdvertisementController extends BaseController {
    @Autowired
    AdvService advService;

    @GetMapping
    public PageResult getAll(Advertisement advertisement, String draw,
                             @RequestParam(required = false, defaultValue = "1") int start,
                             @RequestParam(required = false, defaultValue = "10") int length) {
        int pageNo = start / length;
        Page<Advertisement> page =new Page<>(pageNo,length);

        IPage<Advertisement> IPage =advService.findBypage(advertisement,page);
        PageResult<List<Advertisement>> result = new PageResult<>(
                draw,
                IPage.getTotal(),
                IPage.getTotal(),
                IPage.getRecords());
        return result;
    }
    @PostMapping("/delete")
    public QuarkResult deleteAdmin(@RequestParam(value = "id[]") String[] id) {

        QuarkResult result = restProcessor(() -> {
            advService.delbyId(id);
            //advService
            return QuarkResult.ok();
        });
        return result;
    }
    @PostMapping("/changeEnable")
    public QuarkResult changeEnable(@RequestParam(value = "id[]") String[] id) {
        QuarkResult result = restProcessor(() -> {
            advService.changeEnable(id);
            //advService
            return QuarkResult.ok();
        });
        return result;
    }
}
