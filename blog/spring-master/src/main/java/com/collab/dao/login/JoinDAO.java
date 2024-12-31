package com.collab.dao.login;

import com.collab.dto.JoinDto;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import org.springframework.stereotype.Repository;

@Repository
public class JoinDAO  extends EgovAbstractMapper {

    //회원가입
    public int userJoin(JoinDto vo)throws Exception{
        return insert("join.userJoinInsert", vo);
    }
}
