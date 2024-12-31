package com.collab.service.login.IF;

import com.collab.dto.JoinDto;

import javax.servlet.http.HttpServletRequest;

public interface JoinServiceIF {
    //회원가입
    public String userJoin(JoinDto vo, HttpServletRequest request) throws Exception;
}
