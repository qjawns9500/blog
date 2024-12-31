package com.collab.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class GuideController  extends ExceptionController {

    //커뮤니티 가이드
    @RequestMapping(value="/guide" ,method = RequestMethod.GET)
    public String guide(){
        return "guide/guide";
    }
}
