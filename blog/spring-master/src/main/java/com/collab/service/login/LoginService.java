package com.collab.service.login;

import com.collab.bean.login.RSAArrBean;
import com.collab.bean.login.RSARandBean;
import com.collab.service.login.IF.LoginServiceIF;
import com.collab.bean.login.IF.RSABeanIF;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;


@Service
public class LoginService implements LoginServiceIF {
    private RSARandBean rsaRandBean;
    private RSAArrBean  rsaArrBean;

    @Value("${RSASETTING}")
    String rsaSetting;

    @Autowired
    public LoginService(RSARandBean rsaRandBean, RSAArrBean rsaArrBean){
        this.rsaRandBean = rsaRandBean;
        this.rsaArrBean = rsaArrBean;
    }

    @Override
    public void keyGenerate(HttpSession session) {
        if(session.getAttribute("rsaPublicKeyModules") == null){
            try{
                RSABeanIF rsa  =  getRsa();
                session.setAttribute("rsaPublicKeyModules", rsa.getPublicKeyMoudules());
                session.setAttribute("rsaPublicKeyExponent",rsa.getPublicKeyExponent());
                session.setAttribute("rsaPrivateKey", rsa.getPrivateKey());
            }catch (Exception e){
                e.printStackTrace();
            }
        }
    }

    private RSABeanIF getRsa(){
        if("Y".equals(rsaSetting)){
            return rsaArrBean;
        }else{
            return rsaRandBean;
        }
    }
}
