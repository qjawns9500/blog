<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 로컬환경에서 웹페이지 한글 깨짐현상 발생해서 추가 -->
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<c:set var="contextPath" scope="application" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>momo</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/reset.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/common.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/sub.css">>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/gsap@3.12.5/dist/gsap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/gsap@3.12.5/dist/ScrollTrigger.min.js"></script>

    <!--RSA-->
    <script src="${contextPath}/resources/js/rsa/jsbn.js"></script>
    <script src="${contextPath}/resources/js/rsa/prng4.js"></script>
    <script src="${contextPath}/resources/js/rsa/rng.js"></script>
    <script src="${contextPath}/resources/js/rsa/rsa.js"></script>
    <!--RSA-->


</head>
<body>
<header class="header">
    <div class="header_inner">
        <div class="logo">
            <a href="/">logo</a>
        </div>
        <nav>
            <ul>

                <li><a href="/guide">이용가이드</a></li>
                <li><a href="/notice">공지사항</a></li>
                <li><a href="/event">이벤트</a></li>
            </ul>
            <ol>
                <li><a href="/login">로그인</a></li>
                <li><a href="/login/join">회원가입</a></li>
            </ol>
        </nav>
        <!-- <div class="toggleBox"></div> -->
    </div>
</header>

<div class="sub join">
    <section class="visual_section">
        <div class="sub_visual"></div>
    </section>

    <div class="sub_content join_info">
        <h2>회원가입</h2>
        <form action="">
            <input type="hidden" name="rsaPublicKeyModules" id ="rsaPublicKeyModules" value="${sessionScope.rsaPublicKeyModules}">
            <input type="hidden" name="rsaPublicKeyExponent" id="rsaPublicKeyExponent"  value="${sessionScope.rsaPublicKeyExponent}">
            <input type="hidden" id="encPw" name="encPw" value="" />
            <div class="info_tableBox">
                <div class="inputFlex">
                    <label for="/">아이디</label>
                    <div class="inputBox idBox">
                        <input class="id_input" type="text" maxlength="20">
                    </div>
                </div>
                <div class="inputFlex">
                    <label for="password">비밀번호</label>
                    <div class="inputBox pwBox" id="password">
                        <input class="password" id="input_password" type="password" maxlength="30" onkeyup="checkInputPw()">
                        <input class="passwordCheck" id ="input_checkPassword"  type="password" placeholder="비밀번호를 다시한번 입력해주세요" maxlength="30" oninput="checkInputPw()">
                        <span class="small alert" id="checkPwSpan"></span>
                    </div>
                </div>
                <div class="inputFlex">
                    <label for="/">이름</label>
                    <div class="inputBox nameBox">
                        <input class="name_input"  id=name type="text" maxlength="3" onkeyup="chkSpecialChar(this)">
                    </div>
                </div>
                <div class="inputFlex">
                    <label for="/">닉네임</label>
                    <div class="inputBox nNameBox">
                        <input class="nName_input" type="text" maxlength="10">
                    </div>
                </div>
                <div class="inputFlex">
                    <label for="/">이메일</label>
                    <div class="inputBox emailBox">
                        <input class ="email" type="text">
                    </div>
                </div>
                <div class="inputFlex">
                    <label for="/">핸드폰번호('-' 제외)</label>
                    <div class="inputBox phoneBox">
                        <input type="text" class="phonePart" maxlength="11">
                    </div>
                </div>
                <div class="inputFlex">
                    <label for="/">주소</label>
                    <div class="inputBox addressBox">
                        <input class="address" type="text">
                    </div>
                </div>
            </div>

            <div class="agreeBox">
                <textarea readyonly name="" id="">개인정보 수집사항</textarea>
                <div class="agreeCheck">
                    <input id="checkInput" type="checkbox">
                    <label for="checkInput">개인정보 수집에 동의합니다.</label>
                </div>
            </div>

            <div class="submitBox">
                <button type="submit" class="btn_cancel">취소</button>
                <button type="submit" class="btn_confirm">확인</button>
            </div>
        </form>
    </div>
</div>

<div class="footer">
    <h6>Copyright Portfolio</h6>
    <h6>상업적인 용도로 사용되는 페이지가 아닌 포트폴리오용 페이지입니다.</h6>
</div>
<script src="${contextPath}/resources/js/sub.js"></script>
<script src="${contextPath}/resources/js/common.js"></script>
<script>

    let join = {
        initFunc : function (){
            $(".btn_confirm").on("click", ()=>{
                if(!infoCheck()){
                    return;
                }
                if(!encodingPwd()){
                    return;
                }
                this.goJoin();
            })
        },

        goJoin: function (){
            let joinData = {
                id:$(".id_input").val(),
                password:$(".password").val(),
                username:$(".name_input").val(),
                nikename:$(".nName_input").val(),
                email:$(".email").val(),
                address:$(".address").val(),
                phone: $(".phonePart").val(),
                encPw:$("#encPw").val(),
            }
            $.ajax({
                type:"POST",
                url: "/login/userJoin.do",
                data:JSON.stringify(joinData),
                contentType: "application/json;charset=utf-8"
            }).done(function (resp){
                if(resp==="SUCCESS"){
                    alert(resp)
                    window.location="/";
                }
            }).fail(function (error){
                alert(error);
            })

        }
    }
    // 로그인 정보입력에 누락이 없는지 확인
    function infoCheck(){

        if($(".id_input").val() ===""){
            alert("아이디를 입력해주세요");
            return false;
        }
        if($(".password").val() ===""){
            alert("비밀번호를 입력해주세요")
            return false;
        }else if(!checkPw){
            alert("비밀번호가 일치하지않습니다.")
            return false;
        }
        if($(".name_input").val() ===""){
            alert("이름을 입력해주세요")
            return false;
        }
        if($(".nName_input").val() ===""){
            alert("닉네임을 입력해주세요")
            return false;
        }

        if(($(".email").val() ==="")){
            alert("이메일을 입력해주세요")
            return false;
        }else if(!checkEmail()){
            alert("유효하지않은 이메일 형식입니다.");
            return false;
        }

        if(($(".phonePart").val() ==="")) {
            alert("휴대폰번호를 입력해주세요")
            return false;
        }else if(!checkPhone()){
            alert("유효하지 않은 휴대폰 번호 형식입니다.")
            return false;
        }
        if($(".address").val() ===""){
            alert("주소를 입력해주세요")
            return false;
        }

        return true;
    }

    var checkPw = false;
    var pattern2 = /[0-9]/; // 숫자
    var pattern3 = /[~!@#$%^&*()_+|<>?:{}]/; // 특수 문자
    var pattern4 = /[a-zA-z]/ // 문자
    var pwRule = "";
    var pwRule2=0;

    //비밀번호 체크
    // function checkInputPw(input){
    //     if($("#input_password").val() != '' && $("#input_password").val() != input){
    //         $("#checkPwSpan").text("※ 비밀번호가 일치하지 않습니다.");
    //         checkPw = false;
    //     }else{
    //         $("#checkPwSpan").text("");
    //         checkPw = true;
    //     }
    // }
    // function checkInputPw2(input){
    //     if($("#input_password").val() != '' && $("#input_checkPassword").val() != input){
    //         $("#checkPwSpan").text("※ 비밀번호가 일치하지 않습니다.");
    //         checkPw = false;
    //     }else{
    //         $("#checkPwSpan").text("");
    //         checkPw = true;
    //     }
    // }

    //비밀번호 체크
    function checkInputPw() {
        const password = $("#input_password").val();
        const confirmPassword = $("#input_checkPassword").val();

        if (password !== '' && password !== confirmPassword) {
            $("#checkPwSpan").text("※ 비밀번호가 일치하지 않습니다.");
            checkPw = false;
        } else {
            $("#checkPwSpan").text("");
            checkPw = true;
        }
    }

    //휴대폰 번호 형식 체크
    function checkPhone(){
        let regExp=/^010[0-9]{8}$/;  "010-xxxx-xxxx"
        let phoneNum = $(".phonePart").val();
        return regExp.test(phoneNum);
    }

    //이메일 형식 체크
    function checkEmail(){
        let regExp = /^[0-9a-zA-z]+@[0-9a-zA-z]+\.[a-z]{2,3}$/i;
        let email = $(".email").val();
        return regExp.test(email);
    }

    //특수문자 제거
    function chkSpecialChar(obj){
        let tagId = $(obj).attr("id");
        let regExp = /[\_\{\}\[\]\/\?\.\\,\;\:\|\)\*\~\`\!\^\-\+\<\>\@\#\$\%\&\\\=\(\'\d]/g
        document.getElementById(tagId).value = obj.value.replace(regExp,"");
    }

    function encodingPwd(){
        try{
            var rsa = new RSAKey();
            rsa.setPublic($("#rsaPublicKeyModules").val(),$("#rsaPublicKeyExponent").val());
            $("#encPw").val(rsa.encrypt($.trim($("#input_password").val())));
            $("#input_password").val("");
            $("#input_checkPassword").val("");

        }catch (error){
            alert(error);
            return false;
        }

        return true;
    }
    join.initFunc();
</script>

</body>
</html>
