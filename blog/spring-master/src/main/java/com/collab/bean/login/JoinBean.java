package com.collab.bean.login;

import com.collab.dao.login.JoinDAO;
import com.collab.dto.JoinDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class JoinBean {
    private JoinDAO dao;

    @Autowired
    public JoinBean(JoinDAO dao) {
        this.dao = dao;
    }

    public String userJoin(JoinDto vo)throws Exception {
        if(dao.userJoin(vo) > 0){
            return "SUCCESS";
        }
        return "FAIL";
    }
}
