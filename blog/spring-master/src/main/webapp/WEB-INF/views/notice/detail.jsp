
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 로컬환경에서 웹페이지 한글 깨짐현상 발생해서 추가 -->
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<c:set var="contextPath" scope="application" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/reset.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/common.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/sub.css">

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
                <li><a href="../sub_guide/guide.html">이용가이드</a></li>
                <li><a href="../sub_notice/notice_list.html">공지사항</a></li>
                <li><a href="../sub_event/event_list.html">이벤트</a></li>
            </ul>
            <ol>
                <li><a href="../myLogin/login.html">로그인</a></li>
                <li><a href="../myLogin/join.html">회원가입</a></li>
            </ol>
        </nav>
        <!-- <div class="toggleBox"></div> -->
    </div>
</header>

<div class="sub">
    <section class="visual_section">
        <div class="sub_visual"></div>
    </section>

    <div class="sub_content sub_view">
        <div class="subViewBox">
            <div class="subView_head">
                <h3 class="subjectTxt">제목:${noticeDetail.title}</h3>
                <h6 class="dateTxt">작성일:${noticeDetail.createDate}</h6>
            </div>
            <div class="subView_body">
                <div class="contentBox">
                    ${noticeDetail.content}
                </div>
            </div>
            <div class="listBtn">
                <button onclick="location.href='/notice'" class="list_btn">list</button>
            </div>
        </div>
    </div>
</div>

<div class="footer">
    <h6>Copyright Portfolio</h6>
    <h6>상업적인 용도로 사용되는 페이지가 아닌 포트폴리오용 페이지입니다.</h6>
</div>
<script src="${contextPath}/resources/js/sub.js"></script>


</body>
</html>
