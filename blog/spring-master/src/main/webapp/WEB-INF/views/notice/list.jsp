
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
    <link rel="stylesheet" href="${contextPath}/resources/css/sub.css">>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/gsap@3.12.5/dist/gsap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/gsap@3.12.5/dist/ScrollTrigger.min.js"></script>
    <script>
        $(document).ready(function (){
            //페이지 로드시 공지사항 리스트를 가져오는 함수
            function getNotices(){
                $.ajax({
                    url:"/notice-json",
                    type:"GET",
                    dataType:"json"
                }).done(function (data){
                    $.each(data, function (index,value){
                        $("#viewCnt_"+value.noticeId).text(value.viewCnt);
                    })
                }).fail(function (error){
                    console.log(error);
                })
            }

            window.addEventListener("pageshow",function (event){
                if(event.persisted || (window.performance && window.performance.navigation.type ===2)){
                    getNotices();
                }
            })
        })
    </script>
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
                <li><a href="../myLogin/login.html">로그인</a></li>
                <li><a href="../myLogin/join.html">회원가입</a></li>
            </ol>
        </nav>
        <!-- <div class="toggleBox"></div> -->
    </div>
</header>

<div class="sub notice_list">
    <section class="visual_section">
        <div class="sub_visual"></div>
    </section>

    <div class="sub_content">
        <div class="noticeTit"><h2>공지사항</h2></div>
        <ul>
            <li class="list_head">
                <div class="subjectBox">
                    <h6>Title</h6>
                </div>
                <div class="dateBox">
                    <h6>작성일</h6>
                </div>
                <div class="countBox">
                    <h6>조회수</h6>
                </div>
            </li>

            <!-- 반복이 되어야하는 li 시작 -->
            <c:forEach var="item" items="${noticeList}">
            <li class="list_body" id="listBody">
                <a class="noticeId" href="/notice/${item.noticeId}" data-notice-id="${item.noticeId}">
                    <div class="subjectBox">
                        <p>${item.title}</p>
                    </div>
                    <div class="dateBox">
                        <p>${item.content}</p>
                    </div>
                    <div class="countBox">
                        <p id="viewCnt_${item.noticeId}">${item.viewCnt}</p>
                    </div>
                </a>
            </li>
            </c:forEach>
            <!-- 반복이 되어야하는 li 끝 -->
        </ul>

    </div>
</div>

<div class="footer">
    <h6>Copyright Portfolio</h6>
    <h6>상업적인 용도로 사용되는 페이지가 아닌 포트폴리오용 페이지입니다.</h6>
</div>
<script src="${contextPath}/resources/js/sub.js"></script>
<script src="${contextPath}/resources/js/utils/noticeHandler.js"></script>

</body>
</html>
