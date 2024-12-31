package com.collab.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springmodules.validation.bean.conf.loader.annotation.handler.NotBlank;

import javax.validation.constraints.Pattern;
import java.security.PrivateKey;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class JoinDto {
    @NotBlank(message = "아이디를 입력해주세요")
    private String id;


    private String password;

    @NotBlank(message = "이름을 입력해주세요")
    private String username;

    private String nikename;

//    @NotBlank(message = "이메일을 입력해주세요")
//    @Pattern(regexp = "/^[0-9a-zA-z]+@[0-9a-zA-z]+\\.[a-z]{2,3}$/i", message = "이메일 형식이 아닙니다.")
    private String email;

//    @NotBlank(message = "이메일을 입력해주세요")
//    @Pattern(regexp="/^010[0-9]{8}$/", message = "전화번호 형식이 아닙니다.")
    private String phone;

    private String address;
    
    @NotBlank(message = "비밀번호를 입력해주세요")
    private String encPw; //암호화한 비밀번호(RSA)

    private PrivateKey privateKey;

}
