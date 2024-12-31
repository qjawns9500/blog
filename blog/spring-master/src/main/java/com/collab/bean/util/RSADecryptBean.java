package com.collab.bean.util;

import org.springframework.stereotype.Component;

import javax.crypto.Cipher;
import java.nio.charset.StandardCharsets;
import java.security.PrivateKey;

@Component
public class RSADecryptBean {
    public String decryptRsa(PrivateKey privateKey, String securedValue ) throws Exception {
        System.out.println("복호화시작:!!!!!!!!");
//        Cipher cipher = Cipher.getInstance("RSA"); // RSA 알고리즘을 사용하는 Cipher 객체를 초기화 한다.
        Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
        byte[] encryptedBytes = hexToByteArray(securedValue); // RSA암호화한 PW가 16진수 문자열로 반환되기 때문에 16 -> 바이트 배열로 변환
        cipher.init(Cipher.DECRYPT_MODE, privateKey); // Cipher객체를 복호화 모드로 초기화
        // 헥사 문자열 길이 확인
        System.out.println("Hex String Length: " + securedValue.length());
        // 변환된 바이트 배열 길이 확인
        System.out.println("Encrypted Bytes Length: " + encryptedBytes.length);
        byte[] decryptedBytes = cipher.doFinal(encryptedBytes); // encryptedBytes를 복호화해 원래의 바이트 배열로 반환한다.
        String decrpytedValue = new String(decryptedBytes,"utf-8"); // 복호화된 바이트 배열을 UTF-8인코딩 방식으로 문자열 변환한다.
        return decrpytedValue;
    }
    public static byte[] hexToByteArray(String hex) {
        System.out.println("헥사 문자열을 바이트 배열로 변환 중...");
        if(hex == null || hex.length() % 2 != 0){ // 헥사문자열의 길이는 항상 짝수
            return new byte[]{};
        }
        byte[] bytes = new byte[hex.length() / 2];  // 헥사 문자열의 2자리는 1바이트를 나타내므로 바이트 배열의 각 인덱스에는 헥사문자열 2자리(1바이트)가 들어간다.
        for(int i = 0; i < hex.length(); i += 2){
            byte value = (byte)Integer.parseInt(hex.substring(i,i+2),16); // 2자리 문자열 추출후 int -> byte로 반환
            bytes[(int)Math.floor(i/2)] = value; // 헥사 문자열의 2자리를 바이트배열의 인덱스에 저장
        }
        return bytes;
    }
}