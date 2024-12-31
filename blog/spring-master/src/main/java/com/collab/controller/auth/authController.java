package com.collab.controller.auth;

import com.collab.controller.ExceptionController;
import com.collab.dto.JoinDto;
import com.collab.service.MeetingService;
import com.collab.service.login.JoinService;
import com.collab.service.login.LoginService;
import com.collab.bean.login.RSARandBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.security.PrivateKey;

@Controller
public class authController  extends ExceptionController {
    private LoginService loginService;
    private MeetingService meetingService;
    private JoinService joinService;

    private RSARandBean a1= new RSARandBean();

    @Autowired
    public authController(MeetingService meetingService, LoginService loginService,JoinService joinService) {
        this.meetingService = meetingService;
        this.loginService = loginService;
        this.joinService  = joinService;
    }
    //마이페이지
    @RequestMapping(value="/myPage" ,method = RequestMethod.GET)
    public String myPage(){
        return "myPage/myPage";
    }

    //마이페이지 Likes화면
    @RequestMapping(value="/myPage/likes" ,method = RequestMethod.GET)
    public String myLikes(Model model)throws Exception{
        model.addAttribute("likesList", meetingService.likesList());
        return "myPage/likesPage";
    }

    //회원가입
    @RequestMapping(value="/login/join" ,method = RequestMethod.GET)
    public String join(){
        return "login/join";
    }



    //로그인
    @RequestMapping(value = "/login" , method = RequestMethod.GET)
    public String loginForm(Model model){
        return "login/login";
    }

    //회원가입 폼(join Info)
    @RequestMapping(value="/login/joinInfo" ,method = RequestMethod.GET)
    public String joinInfo(JoinDto joinDto,HttpServletRequest request, Model model)throws Exception{
        System.out.println("회원가입 폼 요청 받음");
        loginService.keyGenerate(request.getSession());
        //비밀번호 설정(예정)
        //model.addAttribute("rule",joinService.getPwdConfig());
        //model.addAttribute("vo", vo);
        return "login/joinInfo";
    }

    //회원가입 요청
    @ResponseBody
    @RequestMapping(value="/login/userJoin.do",method = RequestMethod.POST)
    public String  joinTest(@Valid @RequestBody JoinDto vo, HttpServletRequest request)throws  Exception{
        PrivateKey privateKey = (PrivateKey) request.getSession().getAttribute("rsaPrivateKey");
        vo.setPrivateKey(privateKey);
        return joinService.userJoin(vo,request);
    }
}
