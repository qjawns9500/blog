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

    <div class="sub login">
        <section class="visual_section">
            <div class="sub_visual"></div>
        </section>

        <div class="sub_content">
            <div class="login_wrap">
                <div class="login_top">
                    <h3>로그인</h3>
                    <div class="checkBox">
                        <input id="check_id" type="checkbox">
                        <label for="check_id">로그인 유지</label>
                    </div>
                </div>
    
                <div class="login_info_wrap">
                    <div class="login_info_inner">
                        <input class="id_input" type="text" value="" placeholder="아이디">
                        <input class="password_input" type="password" value="" placeholder="비밀번호">
                    </div>
                    <div class="submitBtn">
                        <button type="submit">로그인</button>
                    </div>
                </div>
    
                <div class="login_link">
                    <a href="/">아이디 / 비밀번호 찾기</a>
                    <a href="/login/join">회원가입</a>
                </div>
            </div>
        </div>
    </div>

    <div class="footer">
        <h6>Copyright Portfolio</h6>
        <h6>상업적인 용도로 사용되는 페이지가 아닌 포트폴리오용 페이지입니다.</h6>
    </div>
    <script src="${contextPath}/resources/js/sub.js"></script>
    <script src="${contextPath}/resources/js/common.js"></script>
</body>
</html>