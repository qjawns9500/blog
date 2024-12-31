package com.collab.service.login;

import com.collab.bean.login.JoinBean;
import com.collab.bean.util.RSADecryptBean;
import com.collab.dto.JoinDto;
import com.collab.service.login.IF.JoinServiceIF;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
@PropertySource("classpath:env.properties")
public class JoinService implements JoinServiceIF {

    private final RSADecryptBean decryptBean;
    private final JoinBean joinBean;

    @Value("${SHA_TYPE}")
    private int shaType;

    public JoinService(RSADecryptBean decryptBean, JoinBean joinBean) {
        this.decryptBean = decryptBean;
        this.joinBean = joinBean;

    }

    @Override
    public String userJoin(JoinDto vo, HttpServletRequest request) throws Exception {
        //RSA복호화
        String decriptPw = decryptBean.decryptRsa(vo.getPrivateKey(),vo.getEncPw());
        //SHA암호화(암호화 시킬 비밀번호)
        String encodePw = new ShaPasswordEncoder(shaType).encodePassword(decriptPw,vo.getId());
        vo.setPassword(encodePw);
        return joinBean.userJoin(vo);
    }
}
