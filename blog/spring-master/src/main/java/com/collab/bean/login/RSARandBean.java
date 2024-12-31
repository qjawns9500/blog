package com.collab.bean.login;

import com.collab.bean.login.IF.RSABeanIF;
import org.springframework.stereotype.Service;

import java.security.*;
import java.security.spec.RSAPrivateKeySpec;
import java.security.spec.RSAPublicKeySpec;
import java.util.Base64;

@Service
public class RSARandBean implements RSABeanIF{
    private KeyPairGenerator keyPairGenerator;
    private RSAPublicKeySpec publicSpec;
    private PrivateKey privateKey;

    public RSARandBean() {
       try{
           keyPairGenerator = keyPairGenerator.getInstance("RSA"); // KeyPairGenerator를 RSA알고리즘을 사용해 초기화
           keyPairGenerator.initialize(2048); // 생성할 키의 크기를 지정 (2048)

           KeyPair keyPair = keyPairGenerator.generateKeyPair(); // 키 쌍을 생성
           KeyFactory keyFactory = KeyFactory.getInstance("RSA"); // RSA알고리즘을 사용해 KeyFactory 초기화
           PublicKey publicKey = keyPair.getPublic(); // 공개키 저장
           privateKey = keyPair.getPrivate(); //개인키 저장
           publicSpec = (RSAPublicKeySpec)keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class); // 공개키의 스펙을 추출

           //개인키를 Base64로 인코딩
//           byte[] privateKeyBytes = privateKey.getEncoded();
//           String base64PrivateKey = Base64.getEncoder().encodeToString(privateKeyBytes);
//
//           System.out.println("-----------------START-----------------------");
//           System.out.println("개인키 (base64인코딩):");
//           System.out.println(base64PrivateKey);
//           System.out.println("공개키 모듈러스(16진수화한 값):");
//           System.out.println(getPublicKeyMoudules());
//           System.out.println("공개키 모듈러스(원본):");
//           System.out.println(publicSpec.getModulus());
//           System.out.println("-----------------END-----------------------");



       } catch (Exception e) {

       }
    }

    @Override
    public String getPublicKeyMoudules() { // 공개키의 모듈러스를 16진수 문자열로 변환
        return publicSpec.getModulus().toString(16);
    }

    @Override
    public String getPublicKeyExponent() throws Exception { //공개키의 공개지수를 16진수 문자열로 변환
        return publicSpec.getPublicExponent().toString(16);
    }

    @Override
    public PrivateKey getPrivateKey() throws Exception { // 개인키

        return privateKey;
    }

}
