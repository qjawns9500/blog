package com.collab.bean.login.IF;

import java.security.PrivateKey;

public interface RSABeanIF {
    public String getPublicKeyMoudules();
    public String getPublicKeyExponent()throws Exception;
    public PrivateKey getPrivateKey()throws Exception;
}
