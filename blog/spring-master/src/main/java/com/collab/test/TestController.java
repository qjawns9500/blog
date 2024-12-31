package com.collab.test;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class TestController {
    @Autowired
    TestService testService;

    @GetMapping("/test")
    public String test() throws Exception{
        List<String> rawResult = testService.getList();

        String resultStr =  rawResult.get(0);
        System.out.println(resultStr);

        return resultStr;

    }

}
