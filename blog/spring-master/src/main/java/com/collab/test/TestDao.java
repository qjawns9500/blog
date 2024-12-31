package com.collab.test;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class TestDao extends EgovAbstractMapper {

    public List<String> getList()throws Exception{
         List<String> result = selectList("main.getList");
        return result;
    }
}
