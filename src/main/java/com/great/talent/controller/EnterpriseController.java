package com.great.talent.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/Enterprise")
public class EnterpriseController {

    @RequestMapping("/path/{url}")
    public String Welcome(@PathVariable("url")String url){
        return "Enterprise/"+url;
    }
}
