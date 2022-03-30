package com.quark.porent.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@RequestMapping("/adv")
@Controller
public class AdvController {
    @RequestMapping("/adv")
    public String getAdv(){
        return "adv/adv";
    }
    @RequestMapping("/advList")
    public String getAdvList(){
        return "adv/advList";
    }
}
